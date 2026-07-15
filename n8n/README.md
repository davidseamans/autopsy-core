# n8n Operational Layer

**Status:** Current operational overview  
**Governing standard:** DS-001 — BuildOS Engineering Standards v1.0  
**Last reviewed:** 2026-07-15

n8n is the deterministic orchestration layer for Autopsy and BuildOS.

It coordinates approved workflows among Supabase, GitHub, Notion, bounded OpenAI services, approved Vercel deployment interfaces, and operational reporting surfaces.

It does not own Core logic or operational business truth.

---

## Directory Structure

/workflows  
/contracts  
/logging  
/runbooks  
/templates

---

## Operating Rule

Every governed n8n workflow must be:
- named with a stable identifier and purpose
- versioned
- owned and scoped by an explicit authority envelope
- documented with input/output contracts and dependencies
- deterministic and idempotent where material
- reversible or replayable where mutation occurs
- observable and logged without exposing secrets
- linked to canonical GitHub source and retained certification evidence if production-impacting
- equipped with failure routing, reconciliation, and a recovery path proportionate to risk

---

## Authority Boundary

Supabase validates and owns operational truth.  
GitHub protects canonical engineering history.  
Notion provides operational governance and human control.  
Vercel delivers approved product surfaces.  
OpenAI provides bounded intelligence under explicit authority.  
n8n orchestrates, reconciles, and routes recovery.

No workflow may convert missing or unauthorised data into false success.

Lovable, Bubble, and Make are retired from the active canonical stack. Dated references remain historical evidence only.