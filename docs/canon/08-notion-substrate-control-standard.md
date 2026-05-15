# Notion Substrate Control Standard

## Purpose
Prevent Make.com-style silent chaos caused by unstable Notion page/database references, stale IDs, recreated databases, broken permissions, renamed properties, or visual-name assumptions.

This standard applies to all n8n workflows, AI-assisted operations, and manual changes that read from or write to Notion.

## Core Principle
Notion is a visibility and operational control layer.

Notion is not the source of transactional truth.

Supabase owns system truth. GitHub owns version and rollback truth. n8n orchestrates. Notion visualizes and coordinates.

## Rules
1. Never rely on visual page names alone.
2. Store canonical Notion page/database/data-source IDs in GitHub documentation.
3. Store n8n workflow JSON in GitHub.
4. Use stable parent pages/databases only.
5. Avoid deleting/recreating Notion databases.
6. If structure must change, migrate deliberately — do not rebuild casually.
7. Keep Notion as visibility/control layer, not source of truth.
8. n8n must search/read first, then write only after ID validation.

## Mandatory Notion Write Pattern
Every future Notion-writing workflow must start with validation.

Pattern:

Manual / controlled trigger
↓
Validate Notion target page/database exists
↓
Validate expected properties exist
↓
Validate target ID matches canonical ID
↓
Only then write

If validation fails:
- stop workflow
- log error
- do not write anywhere

## Current Safe Workflow
`WF-N8N-001-ConnectionAudit` is safe because it only searched Notion.

Search text:
`Autopsy`

Limit:
`1`

It did not write.

## Canonical IDs To Lock Before Notion Writes
Before any n8n workflow updates Notion pages/databases, these must be captured and stored:

- Autopsy System (Canonical) page ID
- EOD parent page or database ID
- My Priorities / Execution Engine database ID
- Notion integration permission scope
- Required property names
- Required data source IDs if database-backed

## Required GitHub Registry
Maintain a registry file at:

`docs/registry/notion-substrate-registry.md`

The registry must include:
- object label
- object type
- canonical ID
- URL
- purpose
- owner/system role
- write allowed? yes/no
- expected properties
- validation rule
- last verified date

## n8n Workflow Export Rule
Every material n8n workflow must be exported as JSON and stored under:

`/n8n/workflows/dev/`
`/n8n/workflows/staging/`
`/n8n/workflows/production/`

Workflow JSON must be committed to GitHub before it is treated as recoverable.

## Prohibited Patterns
Do not:
- write to a Notion database selected only by visible name
- rebuild a Notion database to fix a connection problem without migration record
- delete/recreate a database used by n8n without updating the registry
- let n8n write if validation fails
- use broad workspace access permanently
- make Notion the operational source of truth

## Required Failure Mode
If Notion target validation fails, the workflow must:
- stop
- produce an explicit error
- log the failed target ID/name
- avoid all writes
- require manual review

## Strategic Fix
The substrate issue is avoided by:

exported workflow JSON
+ GitHub version control
+ canonical Notion IDs
+ validation before write
+ no recreated databases without migration record

The tool is not the fix. The control discipline is the fix.
