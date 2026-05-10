# Trigger Inventory

| Trigger | Target Table | Purpose |
|---|---|---|
| prevent_run_questions_update | run_questions | preserve frozen state integrity |
| prevent_run_questions_delete | run_questions | prevent deterministic drift |

---

## Governance Doctrine

Triggers protect deterministic execution.

Triggers exist to:
- stop silent mutation
- preserve auditability
- enforce freeze integrity
- protect longitudinal validity
