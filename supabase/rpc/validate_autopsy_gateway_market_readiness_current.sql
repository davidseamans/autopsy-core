-- CURRENT CAPTURE: validate_autopsy_gateway_market_readiness
-- Captured from live Supabase state on 2026-05-13
-- Status: gateway integrity validator

-- Purpose:
-- Validate whether a completed Autopsy run is safe for:
-- - frontend rendering
-- - Make automation
-- - MCP consumption
-- - dashboard hydration
-- - API exposure

-- Validation categories:
-- 1. score integrity
-- 2. verdict integrity
-- 3. narrative completeness
-- 4. worksheet completeness
-- 5. progression integrity
-- 6. frontend safety

-- Architectural doctrine:
-- Frontends consume validated contracts.
-- Frontends do not infer missing business logic.
-- Unsafe payloads must fail explicitly.

-- Current known issue:
-- Integrity rules may incorrectly reject no-dominant-failure states.
-- Review scheduled after capture stabilization.
