# n8n Governance Standard

## Purpose

n8n is the orchestration layer for Autopsy.

It is NOT:
- Core business logic
- Validation authority
- Scoring authority
- Canonical data authority

Supabase remains canonical truth.

---

# Architectural Rule

n8n may:
- trigger workflows
- move data between systems
- invoke approved RPCs
- create operational checkpoints
- generate notifications
- run scheduled controls

n8n must NOT:
- calculate verdicts
- store canonical business rules
- mutate protected records directly
- bypass Supabase validation
- contain hidden operational logic

---

# Environment Structure

Required environments:

1. DEV
2. STAGING
3. PRODUCTION

No direct experimental work in production.

---

# Workflow Naming Convention

Format:

AREA — PURPOSE — ENV

Examples:
- AUTOPSY — SNAPSHOT CHECKPOINT — PROD
- AUTOPSY — EOD CONTROL — PROD
- AUTOPSY — RUN ANALYTICS — STAGING

---

# Required Workflow Metadata

Every workflow must document:
- owner
- purpose
- trigger source
- mutation targets
- rollback impact
- dependent systems
- last validated date

---

# Snapshot Rule

Before any production mutation workflow:

1. GitHub checkpoint
2. Supabase snapshot if schema/data affected
3. Rollback reference recorded
4. Validation query prepared

---

# Webhook Standard

Webhook naming:

/api/v1/<domain>/<action>

Examples:
- /api/v1/autopsy/run-completed
- /api/v1/system/snapshot

Rules:
- explicit purpose only
- no generic mutation webhooks
- all payloads versioned
- payload validation required

---

# Logging Standard

Every production workflow must log:
- execution timestamp
- workflow version
- triggering system
- success/failure state
- affected entity IDs
- rollback reference if mutation occurs

---

# Failure Handling

Workflow failure must:
- fail visibly
- log clearly
- avoid partial silent mutation
- preserve rollback path

No silent retries on destructive operations.

---

# Prohibited Patterns

- hidden business logic
- direct table mutation bypassing RPC validation
- production testing workflows
- hardcoded production UUIDs
- undocumented automation branches
- dual-source truth systems

---

# Canonical Principle

Automation exists to strengthen governance and execution reliability.

Automation must never weaken auditability.
