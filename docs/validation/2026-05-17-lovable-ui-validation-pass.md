# 2026-05-17 Lovable UI Validation Pass

## Result

Lovable UI validation passed against the recommissioned `autopsy-canonical` backend.

Canonical Lovable project:

```text
Autopsy Gateway Shell
Project ID: f9ce02c9-c9fa-4b07-917c-0d521d6aff74
Backend: fzbdztapkyrfwjwxtwte
```

## Validation summary

Validation result: PASS

Validated path:

```text
New run
→ 10 question flow
→ lowest / no-evidence answers selected
→ hard-fail path
→ verdict page
→ history page
```

## Observed setup

Run created:

```text
Low Hard Fail Validation
Cleaning / Startup / Unproven
validator@example.com
```

RPCs confirmed executable by the UI path:

```text
record_autopsy_answer
finalize_autopsy_run
```

The current UI still uses `record_autopsy_answer`; this is retained as a compatibility shim. Future UI refactor should migrate to `rpc_submit_answer`.

## Question flow proof

- Exactly 10 questions delivered.
- No `S1_` prefix appeared.
- Dimension chips displayed humanised labels such as:
  - CASH REALITY
  - EXECUTION DISCIPLINE
  - OPERATIONAL CAPACITY
- Lowest / no-evidence answers selected for all 10 questions.

## Verdict proof

Verdict page confirmed:

```text
Status = COMPLETED
Verdict = Not Viable
Score = 0 / 30
Hero pill = PRIMARY CONSTRAINT · CASH REALITY
```

Dimension Pressure Profile populated with all six dimensions at zero.

Mechanical Failure Chain populated with:

```text
Primary Constraint = Cash Reality
Pressure Stage = Restricted Progression
Failure Path = Cash Reality Constraint Pattern
Required Breakpoint with Permission Bias = Strong Restriction
Retest Condition populated
```

Hard Fail Triggered card present and separate from hero.

Narrative paragraphs populated with real prose:

- What This Verdict Means
- Execution Diagnosis
- Mechanism Step 1
- Mechanism Step 2
- Mechanism Step 3
- Final Outcome

No blank/snake_case output observed.

Worksheet block correctly routed to:

```text
Worksheet: Primary Constraint = Cash Reality
```

It did not say:

```text
Structural Stability Verified
```

## History proof

Initial issue:

```text
column autopsy_runs.finalized_at does not exist
```

Frontend fix applied:

```text
removed non-existent finalized_at select; sourced date from created_at
```

History now renders the validation run at the top:

```text
Low Hard Fail Validation — Not Viable — Score 0 / 30 — Primary constraint: Cash Reality
```

Navigation controls present:

- Back
- New Run

## Backend change note

Backend compatibility grant applied earlier:

```text
record_autopsy_answer(uuid, uuid, uuid)
```

Allowed for:

```text
anon
authenticated
```

Reason: existing Lovable UI uses legacy answer RPC.

## Follow-up backlog

1. Refactor Lovable answer submission from `record_autopsy_answer` to `rpc_submit_answer`.
2. Add an RPC preflight check in UI.
3. Improve permission error messaging.
4. Improve History metadata once canonical UX settles.
5. Run mid-band and high-band UI validation.
6. Keep Core RLS hardening deferred to its own workstream.

## Status transition

Autopsy is now beyond backend restoration and has passed first end-to-end Lovable UI validation.

Current phase:

```text
UI validation + operational maturity
```
