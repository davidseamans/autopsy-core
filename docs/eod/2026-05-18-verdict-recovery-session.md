# 2026-05-18 — Autopsy Verdict Recovery EOD

## Session status

We should stop here. The session has run long and the frontend has started to drift from refinement into overcorrection.

## Last verified checkpoint

- Checkpoint ID: CHK-20260518-1557-AUTOPSY
- Status: PASS
- GitHub manifest created
- latest-pass.json updated
- Notion PASS row created
- Restore allowed: true

## What was restored today

### Backend / runtime intelligence

- Score-gradient severity doctrine restored and expanded.
- 16 and 17 split into distinct states:
  - 16 = constrained movement
  - 17 = upper high-risk edge
- 24 / 25 permission boundary restored conceptually.
- Diagnostic cascade restored:
  - Main pressure
  - Secondary pressure
  - Third pressure
  - Severity / permission state
- Supporting blocks restored:
  - failure_drivers
  - evidence_required
  - required_actions
- `generate_supporting_blocks(run_id)` implemented.
- Supporting blocks wired into refresh/runtime objects.

### Frontend / Lovable

- Pressure Topology section added.
- Band-aware framing attempted.
- Verdict colour mapping partially restored.
- 30/30 now shows green Structurally Viable header.
- Mechanical Failure Chain changes based on high-score band, but still overuses diagnostic/failure framing.

## What improved

The product is no longer just a scorecard. It is moving back toward:

Data → Dimensions → Diagnosis → Permission → Proof → Action

Best recovered phrase from 30/30:

> This is what permission looks like.

That is the correct Autopsy voice.

## What went wrong late session

The last frontend iteration became too green and too busy.

Specific issue:

- High-score runs still show watchpoint/blocker language too aggressively.
- Pressure Topology at 30/30 feels punitive instead of calmly operational.
- Supporting Diagnosis added too much duplication before being removed/redirected.
- Several sections still overlap:
  - Structural Diagnostics
  - Pressure Topology
  - Execution Watchpoints
  - Verdict Judgement
  - Recovery & Retest Gate

This is not structural failure. It is editorial hierarchy failure.

## Current diagnosis

The backend is ahead of the frontend.

The data model now has enough intelligence, but the UI still needs a mature composition rule:

- Not Viable = failure diagnosis
- High Risk = pressure diagnosis
- Viable = stability / constraint diagnosis
- Structurally Viable = execution control / watchpoint framing

The same data cannot be rendered with the same emotional language across all bands.

## Do not do next

Do not add another section.
Do not add more green.
Do not keep tuning long prose.
Do not run another broad Lovable redesign directive tonight.

## Next session starting point

### Step 1 — Snapshot first

Run n8n checkpoint again only after confirming we want to preserve today’s post-checkpoint changes.

Recommended checkpoint note:

> Restored verdict judgement runtime: diagnostic cascade, score-gradient voice, pressure topology, supporting blocks, and initial band-aware rendering. Frontend requires editorial simplification.

### Step 2 — Simplify high-score framing

For Structurally Viable:

- Replace Main Blocker with Primary Watchpoint only where score < max.
- Replace Pressure Topology wording with Execution Watchpoints.
- Remove red/pink alert styling from high-score cards.
- Use green sparingly: header, accent, not every block.
- No Failure Drivers language on 30/30.

### Step 3 — Section ownership rule

Final target section roles:

1. Header = verdict and score
2. Operational State = permission status
3. Dimension Pressure Profile = score map
4. Pressure / Watchpoint Topology = what to watch
5. Failure Chain / Execution Watchpoints = how pressure could move
6. Verdict Judgement = meaning and permission
7. Recovery & Retest Gate = proof/action
8. Worksheet = execution tool

No section should repeat another section’s job.

## Current release status

Not public-release ready.

Reasons:

- Worksheet still scaffold.
- Public-facing language still uneven.
- High-score framing still wrong in places.
- Evidence/proof standards need refinement.
- Industry/scenario/proficiency dialogue layer not yet built.

## Product principle recovered

Permission is not a mood.
Permission is a governed consequence of evidence.

That remains the core doctrine.
