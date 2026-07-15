# Canonical Inventory

**Status:** Current inventory summary  
**Governing standard:** DS-001 — BuildOS Engineering Standards v1.0  
**Last reviewed:** 2026-07-15

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

- One authoritative owner per governed datum
- Deterministic outputs for material decisions
- Governance before velocity
- No hidden business logic in presentation clients, deployment surfaces, or orchestration workflows
- No undocumented production mutations
- Retired tools are historical evidence only unless formally re-authorised and recertified

---

GitHub = canonical engineering memory and version authority  
Supabase = operational business truth and execution integrity

Dated Lovable-, Bubble-, or Make-era records are retained as historical evidence and do not define current architecture.