# 2026-05-14 — Lovable Reconstruction Failure

## Status

FAILED / REJECTED.

## What happened

Lovable rebuilt a technically connected frontend, but the result does not match the prior Autopsy product state.

## Rejected defects

- Questions are not the original startup/cleaning-focused questions.
- Dropdown language is wrong for the intended inexperienced operator.
- Labels such as Intake, Novice Operator, Builder Operator, Operating Leader are not accepted.
- Running visible answer score is wrong; prior UI removed visible scoring from answer choices.
- Answer selection visual style is wrong; black blobs are rejected.
- Prior dot progression/selection treatment is missing.
- Colour/feel of previous product is missing.
- Verdict language is wrong, e.g. Fragile / Narrow the Bet.
- Worksheet button/layer is missing.
- Charts/structural profile visualisation are missing.
- CRM/lead/job/conversion screens are missing.
- URL/routing state is not restored to prior product structure.

## Root cause

The previous Lovable frontend state was not captured at source level in GitHub. The repository contained governance and database material, but not a complete wart-level app snapshot.

## Governance decision

Do not continue creative Lovable reconstruction.

Stop all new feature restoration until original source of truth is recovered or a formal product specification is created from prior screenshots, EOD notes, and database records.

## Non-negotiable future standard

A release snapshot must allow exact restoration of:

- UI copy
- styling
- colours
- routes
- components
- database seed data
- frontend source
- screenshots
- published URL state
- Make scenarios
- Supabase schema/functions/policies

If before/after differs visually or behaviourally, the backup is incomplete.

## Immediate next step

Create a forensic recovery pack, not another Lovable prompt.
