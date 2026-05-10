# Canonical Inventory

## Core Tables

| Table | Purpose |
|---|---|
| autopsy_runs | execution container |
| autopsy_answers | answer storage |
| questions | question bank |
| run_questions | frozen question state |
| verdict_bands | verdict governance |
| verdict_narratives | narrative templates |

---

## Core RPCs

| RPC | Purpose |
|---|---|
| freeze_run_questions | freeze deterministic run state |
| finalize_autopsy_run | compute verdicts |
| calculate_dimension_scores | compute scoring |

---

## Governance Rules

- One source of truth
- Deterministic outputs
- Governance before velocity
- No hidden logic in Lovable
- No undocumented mutations

---

GitHub = operational memory
Supabase = execution engine
