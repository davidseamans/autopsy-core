# 2026-05-16 — Lovable Reference Reuse Protocol

## Purpose
Lovable's "Reuse work from other projects" / "Add reference" function must be considered part of the recovery and parity workflow.

## Problem Observed
During Autopsy recovery, we reconstructed UI behaviour and styling from screenshots and memory while Lovable exposed an "Add reference" option that may have allowed the current project to reference the legacy Autopsy project directly.

## Rule
Before any future Lovable rebuild, recovery, UI parity pass, or component restoration, check whether Lovable can reference the accepted legacy/source project.

## Required Sequence
1. Identify the target project being edited.
2. Identify the accepted source/reference project.
3. Use Lovable "Add reference" where available.
4. Instruct Lovable to compare against the reference project for:
   - components
   - routes
   - layouts
   - visual styling
   - interaction flow
   - form persistence
   - verdict layout
   - history layout
   - worksheet layout
   - sidebar/app shell
5. Only reconstruct manually if reference reuse is unavailable or insufficient.

## Canonical Current References
- Current canonical Lovable project: `f9ce02c9-c9fa-4b07-917c-0d521d6aff74`
- Legacy/source Lovable project: `autopsy` / prior accepted Autopsy build, if selectable in Lovable references
- Canonical Supabase project: `fzbdztapkyrfwjwxtwte`

## Non-Negotiable
Do not rebuild UI from memory before checking Lovable reference reuse.

## Recovery Lesson
UI parity is not just styling. It includes behaviour, page structure, button placement, route design, spacing, product authority, and user trust cues.

## Status
This protocol is now mandatory for future Autopsy, Core, Sleeve, and Cuff recovery work.
