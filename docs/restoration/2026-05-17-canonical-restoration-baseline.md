# 2026-05-17 Canonical Restoration Baseline

## Status

Autopsy-canonical has been restored to a governed canonical operating spine.

Supabase project: `autopsy-canonical`  
Project ref: `fzbdztapkyrfwjwxtwte`  
Production branch in Supabase UI: `main`  
GitHub repository: `davidseamans/autopsy-core`

## Current canon

- Active question count: 10
- Maximum score: 30
- Question ID format: no `S1_` prefix
- Verdict bands remain:
  - Not Viable: 0–9
  - High Risk: 10–17
  - Viable: 18–24
  - Structurally Viable: 25–30

## Restored layers

- Safe structural tables
- Governance and registry tables
- Scenario/content seed tables
- Behavioural parity register
- Hard-fail behaviour
- Primary-risk intelligence functions
- Gradient/cascade diagnostic profile
- Mutation governance triggers
- Autonomous surface views and payload wrappers
- Question ID canonical correction
- n8n orchestration doctrine replacing Make.com
- Hardened finalize orchestration sequence

## Critical doctrine

Make.com is deprecated and must not be restored.

n8n is the planned orchestration target. Any n8n integration must be contract-first and must define payload shape, auth boundary, logging discipline, rollback posture, and event contract before implementation.

## Key canonical functions restored/hardened

- `finalize_autopsy_run(p_run_id uuid)`
- `apply_hard_fail(p_run_id uuid)`
- `check_hard_fail(p_run_id uuid)`
- `refresh_autopsy_intelligence(p_run_id uuid)`
- `set_primary_risk(p_run_id uuid)`
- `generate_run_diagnosis(p_run_id uuid)`
- `apply_cascade_gradient(p_run_id uuid)`
- `get_run_risk_profile(p_run_id uuid)`
- `validate_autopsy_gateway_market_readiness()`
- `create_system_snapshot()`
- `create_system_snapshot(p_note text)`

## Key canonical views restored

- `v_autopsy_canonical_verdict`
- `v_autopsy_gateway`
- `v_autopsy_product_readiness`
- `v_autopsy_stale_runs`

## Governance controls restored

- `restoration_import_log`
- `autopsy_behavioral_parity_register`
- `system_mutations`
- `system_snapshots`
- mutation prevention triggers for completed runs, completed-run answers, and frozen run questions

## Current GitHub branch state

Existing branches:

- `main`
- `dev`
- `snapshot/2026-05-13-start`

## Known gap

Supabase dashboard currently reports: GitHub repository not connected.

This means database health is good, and GitHub branch model exists, but Supabase project-level GitHub integration still needs dashboard-side connection if the Supabase connector API does not expose that setting.

## Operating rule from this point

No casual production mutation.

Use:

- `main` for production/canonical baseline
- `dev` for migration and behavioural testing
- Supabase migrations for database changes
- GitHub documentation and migration artefacts for reproducibility

## Next validation

Run live scenario tests:

1. hard-fail run
2. catastrophic low run
3. High Risk run
4. Viable run
5. Structurally Viable run

Then rebind Lovable to canonical views and payloads.
