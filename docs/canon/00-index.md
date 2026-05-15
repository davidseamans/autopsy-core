# Autopsy Control Canon

## Purpose
This repository is the operational and version-control backbone for Autopsy / Core / Sleeve.

This canon defines system authority, operational governance, environment discipline, automation standards, rollback standards, audit standards, and change-control procedures.

## Current Working Branch

`dev` is the working branch for active controlled development.

`main` is stable/control.

`snapshot/2026-05-13-start` is an existing rollback/snapshot branch.

## Canonical Documents

| Document | Purpose |
|---|---|
| 01-operating-model.md | Defines operational architecture and responsibilities |
| 02-source-of-truth-map.md | Defines authoritative systems and ownership boundaries |
| 03-environment-model.md | Defines DEV/STAGING/PRODUCTION standards |
| 04-change-control.md | Defines deployment and modification discipline |
| 05-rollback-standard.md | Defines recovery and rollback procedures |
| 06-n8n-operating-standard.md | Defines orchestration governance |
| 07-eod-snapshot-standard.md | Defines daily checkpoint discipline |

## Architecture Principles

Core is the industry-agnostic universal operational framework.

Sleeves are industry-specific operational overlays.

Cuffs are client-specific adaptations and must never contaminate Core or Sleeve.

## Governance Rule

No production automation or AI orchestration proceeds without version control, rollback capability, audit visibility, deterministic recovery, and environment separation.

## Strategic Rule

The system must evolve toward enterprise operational reliability, accounting-grade auditability, aviation-style checklist discipline, deterministic execution, and governed AI augmentation.
