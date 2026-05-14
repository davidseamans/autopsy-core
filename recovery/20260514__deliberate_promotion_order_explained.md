# 2026-05-14 — Deliberate Promotion Order Explained

## Why promotion order matters

Some tables are simple lookup/content tables. Others depend on those lookup tables through foreign keys, generated records, or runtime logic.

If tables are copied in the wrong order, the target project can end up with:

- broken foreign keys
- orphaned records
- runtime rows pointing at missing source rows
- copied garbage test data
- frontend rendering duplicate or obsolete records
- functions/views expecting tables that do not exist yet

Therefore promotion must follow dependency order, not alphabetical order.

## Promotion order

### 1. Static lookup tables first

These define the vocabulary of the system.

- scenario
- dimensions
- dimension_dictionary
- terminology_dictionary

Reason: questions, narratives, progression states, and UI labels depend on these definitions.

### 2. Canonical diagnostic content

- questions
- answer_options
- question_scenario_config
- hard_fail_conditions

Reason: these define the actual Autopsy experience. They must be restored before frontend work resumes.

### 3. Verdict and narrative system

- verdict_bands
- verdict_narratives
- verdict_templates
- domain_narratives
- narrative_templates
- advisory_overrides

Reason: verdict generation depends on score bands, narrative blocks, and domain-specific output logic.

### 4. Dimension intelligence layer

- dimension_failure_profiles
- dimension_pressure_profiles
- dimension_evidence_profiles
- dimension_invalidation_rules
- dimension_recovery_validation

Reason: these drive failure shape, pressure state, invalid evidence, progression proof, and recovery validation.

### 5. Progression and operating state layer

- operational_states
- operational_policies
- execution_states
- progression_gates

Reason: these control permission, blocking, progression, and state transitions.

### 6. Worksheet template layer

- worksheet_templates
- worksheet_intervention_templates
- worksheet_action_templates
- worksheet_evidence_templates
- worksheet_retest_templates

Reason: these are templates. They must exist before generated worksheet runtime records are created.

### 7. Runtime structures recreated, not copied

- autopsy_runs
- autopsy_answers
- run_questions
- run_dimension_scores
- run_feedback
- run_worksheets
- run_worksheet_actions
- run_worksheet_evidence
- run_worksheet_retest_gates
- run_operational_state_history

Reason: old rows are test/debug history. Recreate the schema, but do not import old rows unless specifically needed for forensic comparison.

### 8. Pipeline foundation

- accounts
- contacts
- leads
- sites
- pipeline
- quotes
- jobs
- revenue_events
- documents
- audit_log
- config

Reason: these form the Core operational spine. They must be restored as part of platform recovery, not as a side issue.

### 9. Governance and recovery records

- system_mutations
- system_snapshots
- system_session_checkpoints
- system_content
- system_contract_registry
- system_function_registry

Reason: these provide auditability and system authority history.

### 10. Advanced structural layer

- telemetry_definitions
- telemetry_events
- causal_nodes
- causal_edges

Reason: valuable but not required to get the app back up. Promote after core Autopsy and pipeline are stable.

### 11. Archive/forensic tables last

- backup_questions
- backup_answer_options
- backup_verdict_bands
- backup_verdict_narratives
- questions_backup_20260415
- questions_backup_20260426_qid_cleanup
- answer_options_backup_20260426_qid_cleanup
- verdict_narratives_backup_20260424
- verdict_narratives_legacy_archive

Reason: these are preservation assets. They should not be active runtime tables.

## Rule

Promote active intelligence first. Recreate runtime clean. Preserve archives separately. Do not import garbage test history into canonical runtime.
