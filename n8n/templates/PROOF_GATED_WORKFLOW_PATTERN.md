# Proof-Gated Workflow Pattern

## Purpose

Defines the canonical orchestration pattern for production workflows.

A workflow is not complete because nodes executed.
A workflow is complete only when authoritative proof exists.

---

# Canonical Pattern

```text
TRIGGER
  ↓
VALIDATE INPUT
  ↓
EXECUTE ACTION
  ↓
CAPTURE AUTHORITATIVE PROOF
  ↓
VERIFY PROOF AGAINST SOURCE SYSTEM
  ↓
WRITE OPERATIONAL LOG
  ↓
DECLARE PASS/FAIL
```

---

# Required Proof Types

| Action | Required Proof |
|---|---|
| GitHub write | verified commit SHA |
| Supabase mutation | validation query result |
| Snapshot creation | snapshot ID + retrieval |
| Notion update | page fetch-back |
| RPC execution | returned validated state |

---

# Anti-Patterns

Prohibited:
- success inferred from downstream logging
- green-node optimism
- unverified HTTP success
- workflow completion without source-system verification
- diary-driven success reporting

---

# Workflow State Rules

PASS:
- authoritative proof verified

FAIL:
- proof absent
- proof mismatch
- proof retrieval failure
- partial mutation

UNKNOWN:
- workflow interrupted before verification

---

# Canonical Principle

The system of record decides success.

Not the orchestration engine.
