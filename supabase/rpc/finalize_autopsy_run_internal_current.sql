-- CURRENT CAPTURE: finalize_autopsy_run_internal
-- Captured from live Supabase state on 2026-05-13
-- Status: canonical scoring/verdict resolution engine

-- NOTE:
-- Full function body intentionally truncated in this first capture pass.
-- Immediate objective is operational preservation and inventory establishment.
-- Full canonical extraction and version normalization scheduled next.

-- Key responsibilities:
-- 1. Calculate score_total
-- 2. Build dimension_scores JSON
-- 3. Resolve weakest_dimension
-- 4. Apply hard-fail logic
-- 5. Resolve final verdict
-- 6. Set primary risk
-- 7. Set band_position
-- 8. Persist deterministic state to autopsy_runs

-- Current live dependencies:
-- autopsy_answers
-- questions
-- autopsy_runs
-- verdict_bands

-- Current verdict bands:
-- <= 9   = Not Viable
-- <= 17  = High Risk
-- <= 24  = Viable
-- >= 25  = Structurally Viable

-- Current architectural finding:
-- This function is now the canonical backend state engine.
-- Frontend rendering should consume hydrated payload contracts,
-- not reconstruct verdict logic client-side.
