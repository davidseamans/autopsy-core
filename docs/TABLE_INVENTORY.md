# Table Inventory

| Table | Purpose | Critical Notes |
|---|---|---|
| autopsy_runs | master execution container | canonical run state |
| autopsy_answers | stores answers per run | linked to questions |
| questions | canonical question bank | scenario controlled |
| run_questions | frozen deterministic question set | prevents mutation drift |
| verdict_bands | score governance | deterministic banding |
| verdict_narratives | narrative template system | section driven |

---

## Governance Rules

- No duplicate truth sources
- Core logic belongs in Supabase
- Front-end must not override database truth
- Frozen run state is authoritative
