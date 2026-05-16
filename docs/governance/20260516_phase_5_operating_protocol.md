# Phase 5 — GitHub Governance, Snapshots, Branching, Rollback

## Objective
Prevent future Autopsy/Core/Sleeve drift by making every mutation traceable, reversible, and testable.

## Non-negotiable rule
No Supabase mutation without a GitHub artefact in the same work session.

## Migration parity cleanup
Every Supabase migration applied during recovery must be mirrored into GitHub under:

```text
supabase/migrations/
```

If exact SQL is not available as a file, create a recovery record under:

```text
docs/governance/
```

The record must include:
- migration name
- project ref
- subsystem affected
- source of truth used
- verification status
- known caveats

## Snapshot strategy
A snapshot is required before any material mutation to:
- runtime tables
- question bank
- verdict bands
- narrative tables
- RPC functions
- triggers
- RLS policies
- pipeline/core tables

Snapshot record must identify:
- date/time
- subsystem
- source project
- target project
- intended mutation
- rollback method

## Branch discipline
Default branch model:

```text
main = stable canonical state
recovery/* = recovery work
feature/* = new feature work
hotfix/* = urgent correction
```

Rules:
- recovery and feature work must be isolated when practical
- production/canonical changes must be documented
- no casual direct mutation without recovery note

## Environment separation
Current state:
- legacy source: Supabase `autopsy` / `pjbiylbzlacbzgzkppzf`
- canonical target: Supabase `autopsy-canonical` / `fzbdztapkyrfwjwxtwte`
- canonical frontend: Lovable `autopsy-canonical`

Required future state:
- dev branch/project for unsafe changes
- staging validation before production/canonical promotion
- production/canonical protected from speculative work

## Rollback protocol
Rollback must be defined before high-risk mutation.

Rollback options:
1. reverse SQL migration
2. restore from snapshot table/export
3. reapply known-good migration from GitHub
4. revert frontend change in Lovable/GitHub
5. abandon dev branch and recreate from canonical

## Validation gates
Before marking a phase complete:
- schema exists
- functions exist
- RLS/access pass verified
- runtime smoke test passes
- GitHub record exists
- Notion/EOD record updated

## Current recovery source hierarchy
1. Legacy Supabase `autopsy`
2. Legacy Lovable project `autopsy`
3. GitHub repository history
4. Controlled reconstruction only if source extraction fails

## Phase 6 handoff
Pipeline restoration must use the same process:
- inspect legacy Supabase
- compare canonical Supabase
- migrate only missing/different pieces
- verify constraints and triggers
- mirror in GitHub
- only then expose in Lovable UI
