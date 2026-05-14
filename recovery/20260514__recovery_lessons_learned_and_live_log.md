# 2026-05-14 — Recovery Lessons Learned and Live Log

## Current incident

A Lovable rebuild produced a technically connected but product-invalid frontend. The app lost the accepted Autopsy feel, question language, verdict framing, colour/selection behaviour, worksheet access, and pipeline screens.

## Root cause

The working product state was not captured completely enough. GitHub contained governance, notes, and some migrations, but not a wart-level product snapshot.

The recovery mistake was initially treating a connected frontend plus a minimal Supabase skeleton as recovery. That was wrong.

## Corrected recovery stance

The old `autopsy` Supabase project is the forensic source of truth until `autopsy-canonical` independently reproduces accepted output.

The polluted `autopsy-canonical` skeleton was discarded. Recovery now proceeds only from old `autopsy` into clean canonical structures.

## What has been learned

### 1. Database connectivity is not product recovery

A frontend connected to Supabase is not restored unless it reproduces:

- exact question doctrine
- exact answer architecture
- exact verdict logic
- exact narrative layers
- worksheet access
- charts/profile displays
- pipeline screens
- colour and interaction behaviour
- accepted wording and tone

### 2. Lovable must render canon, not invent product logic

Lovable is not the authority for Autopsy doctrine.

Allowed:

- render canonical database content
- implement UI from explicit specification
- connect to governed RPCs/views

Forbidden:

- invent questions
- invent answer wording
- invent dropdown categories
- invent verdict labels
- substitute generic business/coaching language

### 3. A live operational database is not a backup

The old project survived, but it became the accidental memory of the system. That is not acceptable long term.

Future release snapshots must include:

- schema
- seed data
- functions/RPCs
- views
- triggers
- RLS policies
- frontend source
- visual screenshots
- Lovable project reference/export
- Make scenario exports
- Notion canon references

### 4. Recovery must be incremental

The old project showed 500/503/504 instability when queried aggressively. Single-table extraction is safer.

Permanent rule:

- extract one table
- validate
- promote
- log event
- continue

### 5. Runtime history is not canon

Do not import polluted runtime rows unless specifically needed for forensic comparison.

Do not copy rows from:

- autopsy_runs
- autopsy_answers
- run_questions
- run_dimension_scores
- run_worksheets
- run_worksheet_actions
- run_worksheet_evidence
- run_worksheet_retest_gates
- telemetry_events

Recreate runtime structures cleanly.

### 6. Structural business failure diagnosis is Autopsy DNA

Autopsy is not a quiz app or generic coaching tool.

Autopsy diagnoses structural business failure mechanics:

- what breaks first
- why it breaks
- how fast it breaks
- whether it is recoverable
- what evidence proves recovery
- what invalidates claimed progress
- when progression is permitted

## Recovery completed so far

### Governance committed

- `recovery/20260514__automatic_recovery_runbook_v1.md`
- `recovery/20260514__recovery_scope_autopsy_plus_pipeline.md`
- `recovery/20260514__deliberate_promotion_order_explained.md`
- `incidents/20260514__lovable_reconstruction_failure.md`
- `canon/20260514__autopsy_structural_business_failure_diagnosis_dna.md`

### Supabase canonical reset

- Polluted skeleton data discarded.
- Clean recovery target established in `autopsy-canonical`.
- Old `autopsy` remains untouched as forensic source.

### Rehydrated into `autopsy-canonical`

- dimensions
- questions
- answer_options
- verdict_bands
- verdict_narratives
- verdict_templates
- dimension_failure_profiles

## Canonical content recovered so far

### Dimensions

- Cash Reality
- Economic Literacy
- Market Reality
- Operational Capacity
- Execution Discipline
- Psychological Resilience

### Verdict bands

- Not Viable: 0–9
- High Risk: 10–17
- Viable: 18–24
- Structurally Viable: 25–30

### Narrative sections

- core_failure_point
- failure_drivers
- repair_sequence
- evidence_required
- retest_condition

### Failure profiles restored

- Cash Reality: existential / rapid / low recoverability
- Economic Literacy: invisible erosion / slow but destructive / high recoverability
- Market Reality: inevitable / moderate / medium recoverability
- Operational Capacity: structural / accelerating under load / high recoverability
- Execution Discipline: degradational / slow compounding / high recoverability
- Psychological Resilience: cumulative / progressive / variable recoverability

## Still to recover

### High priority

- dimension_pressure_profiles
- dimension_evidence_profiles
- dimension_invalidation_rules
- dimension_recovery_validation
- domain_narratives
- dimension_dictionary
- narrative_templates
- advisory_overrides

### Worksheet engine

- worksheet_templates
- worksheet_intervention_templates
- worksheet_action_templates
- worksheet_evidence_templates
- worksheet_retest_templates

### Progression engine

- scenario
- question_scenario_config
- operational_states
- operational_policies
- execution_states
- progression_gates

### Runtime structures to recreate cleanly

- autopsy_runs
- autopsy_answers
- run_questions
- run_dimension_scores
- run_worksheets
- run_worksheet_actions
- run_worksheet_evidence
- run_worksheet_retest_gates
- run_operational_state_history

### Pipeline recovery

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

### Later advanced systems

- telemetry_definitions
- telemetry_events schema only unless required
- causal_nodes
- causal_edges
- views/RPCs/functions/triggers

## Permanent recovery checklist

1. Stop feature work.
2. Identify source of truth.
3. Freeze old source; do not delete.
4. Discard polluted target data if invalid.
5. Recreate clean schema shells.
6. Extract one table at a time.
7. Validate row count and content.
8. Promote to canonical.
9. Log recovery event.
10. Commit governance note or migration.
11. Rebuild runtime cleanly.
12. Reconnect frontend only after data canon is restored.
13. Compare screenshots and outputs before declaring recovery complete.

## Current next action

Continue with `dimension_pressure_profiles`, then evidence/invalidation/recovery validation tables.
