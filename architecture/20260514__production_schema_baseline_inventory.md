# 2026-05-14 — Production Schema Baseline Inventory

## Purpose

This document records the current production public schema inventory after Supabase branch replay failed and produced an empty dev schema.

## Finding

Supabase production remains intact.

Supabase dev branch is not reliable for development because migration replay failed and produced zero public tables.

## Production Table Inventory

| Table | RLS | Rows |
|---|---:|---:|
| public.questions | true | 12 |
| public.answer_options | true | 48 |
| public.verdict_bands | true | 4 |
| public.run_questions | true | 3200 |
| public.scenario | true | 4 |
| public.question_scenario_config | true | 0 |
| public.dimensions | true | 6 |
| public.autopsy_runs | true | 291 |
| public.autopsy_answers | true | 4026 |
| public.domain_narratives | true | 6 |
| public.run_feedback | true | 6 |
| public.accounts | true | 2 |
| public.contacts | true | 4 |
| public.leads | true | 2 |
| public.pipeline | true | 5 |
| public.quotes | true | 1 |
| public.jobs | true | 1 |
| public.documents | true | 0 |
| public.audit_log | true | 42 |
| public.config | true | 0 |
| public.sites | false | 2 |
| public.revenue_events | true | 0 |
| public.system_content | true | 3 |
| public.terminology_dictionary | true | 4 |
| public.questions_backup_20260415 | false | 17 |
| public.advisory_overrides | true | 3 |
| public.execution_states | true | 3 |
| public.verdict_narratives | true | 20 |
| public.verdict_narratives_backup_20260424 | true | 5 |
| public.worksheet_templates | true | 0 |
| public.verdict_templates | true | 20 |
| public.hard_fail_conditions | true | 0 |
| public.run_dimension_scores | true | 168 |
| public.questions_backup_20260426_qid_cleanup | true | 13 |
| public.answer_options_backup_20260426_qid_cleanup | true | 40 |
| public.system_snapshots | true | 5 |
| public.backup_verdict_bands | true | 16 |
| public.backup_verdict_narratives | true | 20 |
| public.backup_questions | true | 48 |
| public.backup_answer_options | true | 240 |
| public.dimension_dictionary | true | 6 |
| public.narrative_templates | true | 12 |
| public.dimension_failure_profiles | true | 6 |
| public.dimension_pressure_profiles | true | 12 |
| public.dimension_evidence_profiles | true | 3 |
| public.dimension_invalidation_rules | true | 6 |
| public.dimension_recovery_validation | true | 6 |
| public.system_mutations | true | 13 |
| public.system_function_registry | true | 12 |
| public.system_contract_registry | true | 5 |
| public.worksheet_intervention_templates | true | 0 |
| public.worksheet_action_templates | true | 0 |
| public.worksheet_evidence_templates | true | 0 |
| public.worksheet_retest_templates | true | 0 |
| public.run_worksheets | true | 0 |
| public.run_worksheet_actions | true | 0 |
| public.run_worksheet_evidence | true | 0 |
| public.run_worksheet_retest_gates | true | 0 |
| public.operational_states | true | 6 |
| public.operational_policies | true | 4 |
| public.telemetry_definitions | true | 5 |
| public.telemetry_events | true | 0 |
| public.causal_nodes | true | 5 |
| public.causal_edges | true | 4 |
| public.run_operational_state_history | true | 0 |
| public.progression_gates | true | 4 |
| public.verdict_narratives_legacy_archive | false | 0 |
| public.system_session_checkpoints | true | 1 |

## Critical RLS Advisory

RLS disabled:

- public.sites
- public.questions_backup_20260415
- public.verdict_narratives_legacy_archive

## Operational Decision

Do not rely on Supabase dev branch until migration baseline is repaired.

Production schema must be treated as the current canonical baseline.

Next step is to create a clean baseline migration/export process so future environments can be rebuilt deterministically.
