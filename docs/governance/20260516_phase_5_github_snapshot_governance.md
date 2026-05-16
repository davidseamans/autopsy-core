# 2026-05-16 — Phase 5 GitHub Snapshot Governance

## Purpose
Lock the recovery state of `autopsy-canonical` after runtime, scoring, narrative, worksheet, retest, and gradient recovery.

## Canonical Supabase target
- Project: `autopsy-canonical`
- Ref: `fzbdztapkyrfwjwxtwte`

## Current recovery state
Completed:
- Runtime tables restored
- Runtime execution RPCs restored
- RLS/RPC access pass completed
- Canonical 10-question scoring restored
- Narrative engine restored from legacy Supabase
- Worksheet generation restored from legacy Supabase
- Retest condition generation restored from legacy Supabase
- Permission-gradient / pressure-profile orchestration restored

## Active runtime canon
- Active questions: 10
- Maximum score: 30
- Verdict bands:
  - Not Viable: 0–9
  - High Risk: 10–17
  - Viable: 18–24
  - Structurally Viable: 25–30

## Recovery doctrine
No rebuilding from memory.
Recovery source hierarchy:
1. Legacy Supabase `autopsy` / `pjbiylbzlacbzgzkppzf`
2. Legacy Lovable project `autopsy`
3. GitHub history / snapshots
4. Controlled reconstruction only when source extraction fails

## Remaining phases
- Phase 5: GitHub governance and snapshot discipline
- Phase 6: Pipeline restoration
- Phase 7: Core/Sleeve recovery alignment

## Outstanding governance risk
Some Supabase migrations were applied directly through the connected Supabase tool and must be mirrored into GitHub as concrete migration SQL files. This record is a governance checkpoint, not a substitute for migration-file parity.

## Snapshot rule
Any Supabase mutation must have a GitHub record on the same work session.

If a mutation is too large for one file, split by subsystem:
- runtime
- scoring
- RLS/security
- narrative
- gradient
- pipeline
- frontend contract
