# 2026-05-17 Autopsy Canonical Recommissioning Proof

## Result

Autopsy-canonical is recommissioned.

The restored engine successfully completed a controlled synthetic validation run through the hardened public lifecycle boundary.

## Validated lifecycle

The following sequence was proven operational:

```text
create_autopsy_run
→ auto-freeze 10 canonical questions
→ rpc_submit_answer × 10
→ finalize_autopsy_run
→ recalculate_run_dimension_scores
→ apply_hard_fail
→ refresh_autopsy_intelligence
→ narrative and worksheet generation
→ completed run state
```

## Validation run

Run ID:

```text
df7a1fc3-fb87-4775-adf0-c9aa132892ce
```

Run name:

```text
VALIDATION_LOW_SYNTHETIC_2026_05_17_DIMFIX
```

## Proven outputs

```text
score_total = 0
verdict_name = Not Viable
status = completed
primary_risk = Cash Reality
primary_risk_code = cash_reality
weakest_dimension = Cash Reality
weakest_score = 0
cascade_level = critical
permission_level = locked
evidence_mode = proof_of_constraint_removal_required
```

## Hard-fail proof

Hard-fail triggered correctly from question/answer-native semantics.

The returned narrative resolved the dimension placeholder correctly:

```text
A critical failure condition was triggered in Cash Reality.
```

## Dimension-score fix

Earlier validation exposed that completed runs had no `run_dimension_scores` rows before intelligence refresh.

Patch applied:

```text
finalize_autopsy_run
→ recalculate_run_dimension_scores
→ apply_hard_fail
→ refresh_autopsy_intelligence
```

This corrected:

- empty dimension_scores
- null primary_risk
- unknown cascade level
- degraded diagnosis
- incorrect worksheet routing
- blank hard-fail narrative placeholder

## Worksheet routing proof

Before fix, catastrophic hard-fail run incorrectly produced:

```text
WORKSHEET: STRUCTURAL STABILITY VERIFIED
```

After fix, output correctly produced:

```text
WORKSHEET: PRIMARY CONSTRAINT = CASH REALITY
```

## Security boundary

Public app lifecycle RPCs retained intentionally:

```text
create_autopsy_run
rpc_submit_answer
finalize_autopsy_run
get_autopsy_gateway_payload
```

Internal Autopsy orchestration RPCs were revoked from public execution.

Remaining advisor warnings are either:

- expected SECURITY DEFINER warnings for the public lifecycle boundary,
- INFO warnings for RLS-enabled/no-policy tables, which means deny-all,
- deferred Core restoration scaffolding warnings.

## Canon confirmed

```text
active questions = 10
S1_ prefixed question IDs = 0
max score = 30
```

## Current phase transition

Autopsy is no longer in restoration mode.

Next phase:

```text
Lovable UI validation + operational maturity
```

## Next validation checklist

1. Run one low-score/hard-fail Autopsy through Lovable UI.
2. Confirm 10 questions only.
3. Confirm Verdict page uses canonical completed run fields.
4. Confirm History records the run.
5. Confirm gateway payload aligns with database result.
6. Run mid-band validation.
7. Run high-band validation.
8. Define n8n event/payload contracts.
9. Defer Core RLS hardening to a separate workstream.
