# n8n Operational Layer

n8n is the orchestration layer for Autopsy.

It coordinates approved workflows between Supabase, GitHub, Notion, Lovable, and operational reporting surfaces.

It does not own Core logic.

---

## Directory Structure

/workflows
/contracts
/logging
/runbooks
/templates

---

## Operating Rule

Every n8n workflow must be:
- named
- versioned
- documented
- reversible where mutation occurs
- logged
- linked to a GitHub checkpoint if production-impacting

---

## Authority Boundary

Supabase validates.
GitHub protects.
Notion visualizes.
Lovable surfaces.
n8n orchestrates.

No exceptions.
