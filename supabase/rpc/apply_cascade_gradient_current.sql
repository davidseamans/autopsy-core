-- CURRENT CAPTURE: apply_cascade_gradient
-- Captured from live Supabase state on 2026-05-13
-- Status: permission / failure-shape / evidence-mode engine

-- Purpose:
-- Resolves weakest dimension pressure into:
-- - failure_shape
-- - permission_level
-- - evidence_mode
-- - failure_cascade JSON
-- - diagnosis.cascade_gradient JSON

-- This is central to Autopsy's gatekeeper architecture.
-- Do not mutate without snapshot + validation.

-- Live behaviour summary:
-- ratio <= 0.20 => critical_collapse / locked / proof_required_before_any_action
-- ratio <= 0.40 => severe_constraint / blocked / proof_required_before_commitment
-- ratio <= 0.60 => active_instability / conditional / proof_required_before_scale
-- ratio <= 0.80 => controlled_pressure / restricted / proof_required_before_expansion
-- else          => residual_risk / granted / monitoring_required
