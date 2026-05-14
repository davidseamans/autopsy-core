# 2026-05-14 — Full Product Recovery Standard v1

## Hard finding

The current repository is not yet a full wart-level product snapshot. It captures governance notes, selected migrations, and baseline inventories, but it does not yet guarantee deterministic restoration of the exact Lovable product state.

This is unacceptable for a commercial platform.

## Definition of a real backup

A real backup means the product can be restored exactly, including:

- frontend source
- page routes
- components
- colours
- spacing
- button states
- copy
- URLs
- database schema
- database seed data
- question wording
- answer options
- verdict wording
- narrative templates
- worksheet templates
- Supabase functions
- RLS policies
- triggers
- Make.com scenarios
- Notion canonical pages
- deployment configuration

Approximate rebuild from memory is not acceptable.

## Recovery principle

If the restored product looks, feels, or behaves differently after an incident, the backup was incomplete.

## Required backup layers

### Layer 1 — GitHub application source

Must include the full frontend source, not just notes or SQL.

Required:

- package files
- src directory
- components
- routes
- styles
- env example file
- Supabase client config
- UI copy constants
- visual design tokens

### Layer 2 — Supabase canonical database

Must include:

- schema migrations
- seed migrations
- question bank
- answer options
- verdict bands
- verdict narratives
- worksheet templates
- functions
- policies
- triggers
- validation queries

### Layer 3 — Platform exports

Must include export instructions and, where possible, actual exported artifacts for:

- Lovable project source / GitHub sync
- Make.com scenario blueprints
- Notion canonical pages

### Layer 4 — Release snapshot

Each valid release must have:

- GitHub tag
- Supabase migration version
- Lovable publish reference or exported source reference
- Make scenario export reference
- validation checklist
- before/after screenshots

## Immediate corrective action

Pause creative feature rebuilding.

Priority is now to create a deterministic recovery pack:

1. Capture current legacy production schema inventory.
2. Export canonical question and answer content from legacy production where available.
3. Create canonical seed SQL from recovered content.
4. Capture current Lovable state as source if possible.
5. Stop accepting AI-generated replacement content unless explicitly marked provisional.

## Non-negotiable rule

No more invented questions, generic wording, or reconstructed UI copy unless the source of truth is missing and the gap is explicitly documented.
