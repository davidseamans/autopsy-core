# RPC Inventory

**Status:** Current inventory summary  
**Governing standard:** DS-001 — BuildOS Engineering Standards v1.0  
**Last reviewed:** 2026-07-15

| RPC | Purpose | Input | Output |
|---|---|---|---|
| freeze_run_questions | freeze deterministic run state | p_run_id | frozen question set |
| finalize_autopsy_run | compute verdict + narrative state | p_run_id | completed run |
| calculate_dimension_scores | calculate domain scoring | p_run_id | score object |

---

## Operational Rules

- RPCs are canonical execution units for the governed logic assigned to them.
- Presentation clients, including the Vercel-delivered application, must not duplicate RPC logic.
- Orchestration platforms, including n8n, must not replace Supabase validation or become a competing business-rules engine.
- Production RPCs operate via `p_run_id` where specified by the contract.
- Historical references to Lovable or Make.com describe retired implementation paths and are not current dependencies.