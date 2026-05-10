# Migration Discipline

Every schema mutation must exist as a dedicated migration file.

## Naming Standard

001_create_run_questions.sql
002_add_primary_risk.sql
003_freeze_architecture.sql

---

## Rules

- No direct schema edits without migration
- One purpose per migration
- Rollback path required
- Migration must be committed before further mutation

---

## Operational Standard

DDL changes use migrations.
Operational queries may use execute_sql.

---

## Validation

Every migration must include:

- intended outcome
- validation query
- rollback strategy
