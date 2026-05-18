# Snapshot Payload Contract

## Purpose

Defines the canonical payload structure for all snapshot/checkpoint workflows.

This prevents uncontrolled mutation and inconsistent automation behaviour.

---

# Snapshot Event Types

Allowed:
- system_checkpoint
- schema_mutation
- release_checkpoint
- restoration_checkpoint
- emergency_rollback_point

---

# Canonical Payload Structure

```json
{
  "event_type": "system_checkpoint",
  "environment": "production",
  "triggered_by": "manual|schedule|workflow",
  "workflow_name": "AUTOPSY — SNAPSHOT CHECKPOINT — PROD",
  "workflow_version": "1.0.0",
  "github_commit_required": true,
  "supabase_snapshot_required": true,
  "rollback_required": true,
  "systems": {
    "supabase_project": "autopsy-canonical",
    "github_repo": "davidseamans/autopsy-core"
  },
  "metadata": {
    "reason": "Pre-migration checkpoint",
    "operator": "system",
    "ticket": null
  }
}
```

---

# Validation Rules

Required fields:
- event_type
- environment
- workflow_name
- workflow_version
- systems

Rejected if:
- production target missing rollback requirement
- workflow version missing
- unknown event type
- direct mutation requested without checkpoint

---

# Operational Principle

Every destructive or structural action must create a recoverable state first.
