# Validation — Lovable Render Stabilisation

## Date

2026-05-13

## Scope

Validation of Lovable render stabilisation after directive:

`lovable/directives/2026-05-13_render_stabilisation_gateway_contract.md`

## Evidence Supplied

Three screenshot validations were supplied by user:

1. Not Viable — score 3/30
2. High Risk — score 16/30
3. Structurally Viable — score 30/30

## Validation Result

### Test 1 — Not Viable

Observed:

- status completed
- score displayed: 3/30
- final verdict displayed: Not Viable
- primary constraint displayed: Execution Discipline
- execution diagnosis rendered
- mechanism steps rendered
- final outcome rendered
- worksheet rendered
- retest condition rendered
- no null/undefined/[object Object] leakage visible

Result: PASS

### Test 2 — High Risk

Observed:

- status completed
- score displayed: 16/30
- final verdict displayed: High Risk
- primary constraint displayed: Market Reality
- execution diagnosis rendered
- mechanism steps rendered
- final outcome rendered
- worksheet rendered
- retest condition rendered
- no null/undefined/[object Object] leakage visible

Result: PASS

### Test 3 — Structurally Viable

Observed:

- status completed
- score displayed: 30/30
- final verdict displayed: Structurally Viable
- no-dominant-failure message displayed: No dominant structural weakness was identified.
- execution diagnosis rendered
- mechanism steps rendered
- final outcome rendered
- worksheet rendered
- retest condition rendered
- diagnostic panel shows missing_weakest_dimension

Result: PASS WITH KNOWN DIAGNOSTIC ISSUE

## Known Issue

The diagnostic payload integrity panel still reports:

`missing_weakest_dimension`

for a perfect-score/no-dominant-failure run.

This is not a frontend rendering failure. The visible user-facing page renders correctly.

Root cause likely remains backend integrity logic in `get_autopsy_gateway_payload` / readiness validation treating null weakest_dimension as missing rather than valid when score_total = 30 or final_verdict = Structurally Viable.

## Decision

Do not mutate backend immediately.

Classify as controlled backend integrity refinement for a later targeted pass.

## Current Status

Render stabilisation is accepted as successful for this pass.

Frontend now correctly renders:

- low score failure state
- mid score risk state
- perfect score/no-dominant-failure state
- worksheet output
- retest condition

## Next Candidate Backend Fix

Review and patch gateway integrity rules so that:

- weakest_dimension may be null when score_total = 30
- no-dominant-failure is treated as valid
- frontend_safe does not fail solely due to null weakest_dimension in structurally viable perfect-score runs

Apply only after snapshot and validation SQL are prepared.
