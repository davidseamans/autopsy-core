# Autopsy Mermaid Diagram Index

Purpose: maintain canonical architecture diagrams for Autopsy, Core/Sleeve governance, workflow authority, and system boundaries.

## Naming standard

Use numbered, kebab-case Mermaid files:

- `001-operational-architecture-map.mmd`
- `002-eod-authority-workflow.mmd`
- `003-core-sleeve-boundary-map.mmd`
- `004-autopsy-run-lifecycle.mmd`
- `005-data-authority-map.mmd`

## Stack position

- Supabase = source of truth and validation authority
- n8n = orchestration authority
- Notion = management and visibility layer
- GitHub = version-control authority
- Codex = code/repository execution assistant
- Mermaid = architecture diagram language

## Retired from current diagram set

Bubble, Lovable, and Make are intentionally excluded from the current architecture diagrams. They are not part of the active canonical stack for this diagram pack.

## Rule

Diagrams must preserve Core purity. Industry-specific logic belongs in Sleeves, not Core.
