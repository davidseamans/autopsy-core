# 2026-05-14 — Recovery Scope: Autopsy + Pipeline

## Decision

Recovery scope is not limited to Autopsy.

The recovery effort includes:

- Autopsy diagnostic engine
- Autopsy narratives
- Autopsy worksheet layer
- Autopsy progression and evidence logic
- Core pipeline tables and logic
- Leads
- Accounts
- Contacts
- Sites
- Quotes
- Jobs
- Revenue events
- Audit/config/document support tables

## User-approved recovery rule

Nothing is deleted from the old `autopsy` Supabase project until the new `autopsy-canonical` project generates output identical to the accepted prior state.

## Recovery principle

Tables may be copied across as clean reconstructed tables rather than inheriting broken migration lineage.

CSV/data-level extraction is acceptable where the table contents are the asset.

DDL/schema reconstruction is required where constraints, keys, policies, functions, and triggers matter.

## Classification method

Each old-project table must be classified before promotion:

- CORE CANONICAL — belongs in the clean canonical product
- ACTIVE SUPPORTING — supports core operation or reporting
- PIPELINE CORE — belongs to CRM/pipeline recovery
- EXPERIMENTAL — useful but not promoted without review
- LEGACY — preserved for reference only
- ARCHIVE — backup/history only
- DUPLICATE — redundant copy of another source
- DEAD — no current operational value

## Initial pipeline recovery candidates

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

## Initial Autopsy recovery candidates

- questions
- answer_options
- verdict_bands
- verdict_narratives
- verdict_templates
- dimensions
- domain_narratives
- dimension_dictionary
- dimension_failure_profiles
- dimension_pressure_profiles
- dimension_evidence_profiles
- dimension_invalidation_rules
- dimension_recovery_validation
- progression_gates
- operational_states
- operational_policies
- telemetry_definitions
- causal_nodes
- causal_edges
- worksheet templates and run worksheet tables
- system registries and mutation logs

## Non-negotiable

The old project remains the forensic source until the new canonical project is independently validated.
