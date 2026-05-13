# Lovable Directive — Dimension Pressure Profile Graph

## START

### Objective

Add a Dimension Pressure Profile graph to the Autopsy Verdict page without changing backend logic.

This is a frontend rendering improvement only.

### Target Project

`dc7fb6a8-9a10-4cef-9cee-85b1bf782906`

### Scope

Add one graph/card to the Verdict page after Run Details and before Execution Diagnosis.

### Non-Negotiable Constraints

Do NOT change:

- Supabase schema
- Supabase functions
- `finalize_autopsy_run`
- `finalize_autopsy_run_internal`
- `get_autopsy_gateway_payload`
- scoring logic
- verdict logic
- hard-fail logic
- worksheet logic
- retest logic
- Make webhook logic

Do NOT create business logic in the frontend.

The graph must render backend-provided dimension scores only.

### Data Source

Use backend-provided values from the run payload or fallback `autopsy_runs` row.

Preferred field:

- `dimension_scores`

Expected shape may be JSON/object like:

```json
{
  "cash_reality": 6,
  "economic_literacy": 6,
  "market_reality": 6,
  "operational_capacity": 6,
  "execution_discipline": 6,
  "psychological_resilience": 6
}
```

If `dimension_scores` is missing or invalid, do not invent values. Show:

`Dimension profile unavailable for this run.`

### Graph Name

Use title:

`Dimension Pressure Profile`

### Display Rules

Render six horizontal bars, one per dimension:

1. Cash Reality
2. Economic Literacy
3. Market Reality
4. Operational Capacity
5. Execution Discipline
6. Psychological Resilience

Each bar must show:

- dimension label
- score value
- maximum possible score if known
- visual bar proportional to score

Use `/6` as max score only when the frontend can safely infer six dimensions at five? No. Do not infer incorrectly.

If backend does not provide max score, display raw score only and use relative scaling against highest observed dimension score.

Preferred display if max score is known:

`Market Reality — 2 / 6`

Fallback display:

`Market Reality — 2`

### Sorting

Sort bars weakest to strongest:

lowest score first.

### Highlight Rule

If `weakest_dimension` or `primary_risk_code` exists, highlight that dimension as:

`Primary Constraint`

If no weakest dimension exists, show:

`No dominant structural weakness identified.`

Do not force a fake weakest dimension.

### Style

Keep styling consistent with existing Verdict cards:

- same card width
- same border radius
- same typography style
- clean spacing
- no clutter
- no animation required

### Validation

Test three completed runs:

1. Not Viable
2. High Risk
3. Structurally Viable / 30 score

Confirm:

- graph appears below Run Details
- all available dimensions render
- bars sort weakest to strongest
- primary constraint is highlighted when present
- no-dominant-failure state does not invent a constraint
- no null/undefined/[object Object] leakage appears
- no backend logic was changed

### Completion Criteria

Task is complete only when the graph renders correctly on all three test runs and no backend mutation has occurred.

## END
