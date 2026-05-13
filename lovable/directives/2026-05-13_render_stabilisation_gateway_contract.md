# Lovable Directive — Render Stabilisation via Gateway Contract

## START

### Objective

Stabilise the Autopsy verdict/result rendering layer without changing backend logic.

The frontend must render from the existing Supabase gateway payload contract and must not reconstruct verdict, scoring, cascade, permission, or worksheet logic client-side.

### Scope

This directive applies only to Lovable/frontend rendering behaviour for the existing Autopsy project.

Target Lovable project:

`dc7fb6a8-9a10-4cef-9cee-85b1bf782906`

### Non-Negotiable Constraints

Do NOT change:

- Supabase schema
- Supabase functions
- `finalize_autopsy_run`
- `finalize_autopsy_run_internal`
- score thresholds
- verdict band logic
- hard-fail logic
- cascade logic
- worksheet generation logic
- retest generation logic
- Make webhook logic

Do NOT add business logic to the frontend.

Frontend must display backend-provided fields only.

### Required Backend Read Surface

Use the existing Supabase RPC/payload contract as the preferred render source:

- `get_autopsy_gateway_payload(p_run_id)`

If the frontend currently reads directly from `autopsy_runs`, keep that only as fallback. Primary render source must be the gateway payload contract.

### Required Rendering Behaviour

When a run is completed, the verdict/result page must display:

1. score total
2. final verdict
3. status
4. completed timestamp where available
5. weakest dimension / primary risk when present
6. no-dominant-failure message when weakest dimension is null
7. execution diagnosis
8. mechanism step 1
9. mechanism step 2
10. mechanism step 3
11. final outcome
12. worksheet output
13. retest condition

### Perfect Score / No-Dominant-Failure Rule

If `weakest_dimension` is null and the run is completed:

Do NOT show broken placeholders.
Do NOT show raw null values.
Do NOT block rendering solely because weakest dimension is null.

Display this state as:

`No dominant structural weakness was identified.`

Use the backend-provided narrative, worksheet, and retest text where available.

### Integrity Handling

If the payload contains an `integrity` object:

- show missing-field warnings only in a small diagnostic/admin area
- do not replace the full verdict screen with an error if core fields exist
- core fields are: status, score_total, final_verdict

If core fields are missing, show a controlled error:

`This Autopsy run has not produced a complete verdict payload yet. Please refresh or rerun finalisation.`

### Placeholder Cleanup

Remove or suppress all visible placeholder text such as:

- undefined
- null
- [object Object]
- no data
- TBD
- placeholder
- missing field

unless explicitly shown inside a diagnostic/admin panel.

### Validation Steps

Test three completed runs:

1. Low score / Not Viable
2. Mid score / High Risk or Viable
3. Perfect or near-perfect score / Structurally Viable

For each test confirm:

- verdict page loads
- score appears
- final verdict appears
- narrative sections appear
- worksheet appears
- retest condition appears
- no null/undefined placeholder is visible
- no-dominant-failure state renders cleanly when weakest dimension is null

### Completion Criteria

This task is complete only when:

- completed runs render without placeholder leakage
- perfect/no-dominant-failure runs do not break the page
- frontend uses backend payload fields rather than recreating verdict logic
- no backend logic has been modified

## END
