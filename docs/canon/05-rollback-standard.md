# Rollback Standard

## Purpose
Rollback capability is mandatory operational infrastructure.

Every material change to:
- schema
- workflows
- automation
- operational logic
- integrations
- prompts
- governance documents

must be recoverable.

---

## Recovery Layers

| Layer | Recovery Method |
|---|---|
| GitHub | branch restore / commit revert |
| Supabase | snapshots / migration rollback |
| n8n | workflow export restore |
| Notion | canonical mirror + checkpoint logs |

---

## Mandatory Standards

### GitHub
- All controlled work occurs on `dev`
- `main` remains stable
- Snapshot branches created before major architectural shifts

### Supabase
- Migrations version controlled
- No undocumented schema changes
- RPC logic governed and recoverable

### n8n
- Workflow exports committed to GitHub
- Production workflows isolated
- Naming standards enforced

---

## EOD Rule

End of Day reports are system-state checkpoints.

They are not journaling.

They exist to:
- reconstruct state
- recover from mistakes
- identify drift
- maintain continuity
- accelerate restart

---

## Failure Rule

If rollback cannot occur quickly and deterministically:
- the implementation is incomplete
- governance is insufficient
- production readiness does not exist
