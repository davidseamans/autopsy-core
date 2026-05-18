# Incident — n8n GitHub False Positive

## Date

2026-05-17 AEST

## Classification

False Positive Orchestration Success

Severity: High

---

## Summary

n8n workflow execution appeared successful because downstream Notion diary entries were created and workflow status indicated success.

However, GitHub was not updated. The system reported operational success without verifying the authoritative rollback system.

---

## Failure Mode

The workflow treated secondary visibility output as evidence of primary system success.

Notion write success was incorrectly interpreted as full workflow success.

GitHub write success was not independently verified.

---

## Systems Affected

- n8n orchestration
- GitHub rollback/control layer
- Notion visibility layer
- EOD confidence model

---

## Root Cause

Missing proof contract.

The workflow did not require:
- GitHub commit SHA capture
- GitHub commit fetch-back verification
- expected file-path verification
- explicit fail state when GitHub proof was absent

---

## Governance Correction

A GitHub Write Proof Contract is now mandatory.

No workflow may report PASS unless GitHub success is verified from GitHub itself.

---

## New Rule

Notion diary entry does not prove operational success.

n8n node success does not prove operational success.

HTTP success does not prove operational success.

Only authoritative-system verification proves success.

---

## Required Remediation

1. Add GitHub proof check to all production n8n workflows.
2. Require commit SHA capture for every GitHub write.
3. Fetch commit back from GitHub before marking PASS.
4. Log verified commit SHA in operational output.
5. If proof missing, mark workflow FAIL even if Notion logging succeeds.

---

## Prevention Principle

A control system must verify the system of record, not its own optimistic execution state.
