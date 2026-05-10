# Naming Standards

## SQL Migrations

Format:

001_create_run_questions.sql
002_add_primary_risk.sql
003_freeze_architecture.sql

Rules:
- lowercase only
- underscores only
- one purpose per migration

---

## RPC Naming

Format:

verb_subject_action

Examples:
- freeze_run_questions
- finalize_autopsy_run
- calculate_dimension_scores

---

## Snapshot Naming

Format:

SNAPSHOT_YYYY-MM-DD_DESCRIPTION.md

Example:

SNAPSHOT_2026-05-10_PRE_WORKSHEET_ENGINE.md

---

## Rollback Naming

rollback_feature_name.sql

Example:

rollback_gradient_system.sql
