# Current Supabase Schema Snapshot — 2026-05-13

## Project

- Project name: autopsy
- Project ID: pjbiylbzlacbzgzkppzf
- Region: ap-southeast-2
- Status: ACTIVE_HEALTHY
- Postgres: 17.6.1

## Operating Finding

Supabase currently contains the live operational truth. GitHub is being brought up to become operational memory and rollback authority.

## Autopsy Engine Tables

- questions
- answer_options
- verdict_bands
- verdict_narratives
- verdict_templates
- autopsy_runs
- autopsy_answers
- run_questions
- run_dimension_scores
- domain_narratives
- dimension_dictionary
- narrative_templates
- dimension_failure_profiles
- dimension_pressure_profiles
- dimension_evidence_profiles
- dimension_invalidation_rules
- dimension_recovery_validation

## Gateway / Governance Tables

- system_snapshots
- system_mutations
- system_function_registry
- system_contract_registry
- system_session_checkpoints

## Worksheet Architecture Tables

- worksheet_templates
- worksheet_intervention_templates
- worksheet_action_templates
- worksheet_evidence_templates
- worksheet_retest_templates
- run_worksheets
- run_worksheet_actions
- run_worksheet_evidence
- run_worksheet_retest_gates

## Operational State / Guarantee Architecture Tables

- operational_states
- operational_policies
- telemetry_definitions
- telemetry_events
- causal_nodes
- causal_edges
- progression_gates
- run_operational_state_history

## Core CRM Prototype Tables

- accounts
- contacts
- leads
- pipeline
- quotes
- jobs
- sites
- documents
- audit_log
- config
- revenue_events
- system_content
- terminology_dictionary

## Backup / Archive Tables

- questions_backup_20260415
- questions_backup_20260426_qid_cleanup
- answer_options_backup_20260426_qid_cleanup
- verdict_narratives_backup_20260424
- verdict_narratives_legacy_archive
- backup_verdict_bands
- backup_verdict_narratives
- backup_questions
- backup_answer_options

## RLS Advisory

Supabase reported RLS disabled on:

- public.sites
- public.questions_backup_20260415
- public.verdict_narratives_legacy_archive

Do not blindly enable RLS without policy review. Priority handling:

1. public.sites — live Core data; requires policy design before enforcement.
2. public.questions_backup_20260415 — backup data; should be locked down or removed from public exposure.
3. public.verdict_narratives_legacy_archive — archive data; should be locked down unless actively needed.

## Strategic Risk

Current risk state:

- Supabase ahead of GitHub
- GitHub does not yet contain current RPC/function definitions
- rollback authority incomplete until function definitions and validation SQL are committed

## Immediate Capture Requirements

First-wave function capture:

- finalize_autopsy_run
- finalize_autopsy_run_internal
- get_autopsy_gateway_payload
- get_latest_completed_autopsy_gateway_payload
- validate_autopsy_gateway_market_readiness
- apply_cascade_gradient
- generate_locked_narrative
- generate_locked_worksheet
- generate_retest_conditions
- prevent_completed_run_mutation
- prevent_answer_changes_on_completed_run
- validate_autopsy_run_lifecycle

## Rule

No Lovable, Make, MCP, or production schema mutation until the current Supabase state has been captured into GitHub sufficiently to support rollback and audit.