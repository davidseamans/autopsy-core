# RPC Inventory

| RPC | Purpose | Input | Output |
|---|---|---|---|
| freeze_run_questions | freeze deterministic run state | p_run_id | frozen question set |
| finalize_autopsy_run | compute verdict + narrative state | p_run_id | completed run |
| calculate_dimension_scores | calculate domain scoring | p_run_id | score object |

---

## Operational Rules

- RPCs are canonical execution units
- Lovable must not duplicate RPC logic
- Make.com must not replace RPC validation
- Production RPCs operate via p_run_id
