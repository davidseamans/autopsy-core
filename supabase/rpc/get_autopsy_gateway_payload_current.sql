-- CURRENT CAPTURE: get_autopsy_gateway_payload
-- Captured from live Supabase state on 2026-05-13
-- Status: canonical frontend / automation payload contract

-- Purpose:
-- Provides a structured JSONB contract for completed Autopsy runs.
-- This should be the preferred read surface for Lovable, Make, dashboards, and future MCP consumers.

-- Contract groups:
-- 1. run metadata
-- 2. organism_state
-- 3. causal_diagnosis
-- 4. verdict_sections
-- 5. worksheet
-- 6. integrity flags

-- Important note:
-- Current live function marks frontend_safe false when weakest_dimension is null.
-- This may incorrectly fail perfect-score / no-dominant-failure runs.
-- Do not patch yet. Capture first, review second.

CREATE OR REPLACE FUNCTION public.get_autopsy_gateway_payload(p_run_id uuid)
 RETURNS jsonb
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
declare
  v_payload jsonb;
begin

  select jsonb_build_object(
    'run_id', ar.id,
    'status', ar.status,
    'created_at', ar.created_at,
    'completed_at', ar.completed_at,

    'organism_state', jsonb_build_object(
      'score_total', ar.score_total,
      'final_verdict', ar.final_verdict,
      'progression_code', ar.progression_code,
      'progression_state', ar.progression_state,
      'permission_level', ar.permission_level,
      'failure_shape', ar.failure_shape
    ),

    'causal_diagnosis', jsonb_build_object(
      'weakest_dimension', ar.weakest_dimension,
      'weakest_score', ar.weakest_score,
      'primary_risk', coalesce(ar.primary_risk, ar.weakest_dimension),
      'structural_diagnosis', ar.structural_diagnosis,
      'pressure_stage', ar.pressure_stage
    ),

    'verdict_sections', jsonb_build_object(
      'execution_diagnosis', ar.execution_diagnosis,
      'mechanism_step_1', ar.mechanism_step_1,
      'mechanism_step_2', ar.mechanism_step_2,
      'mechanism_step_3', ar.mechanism_step_3,
      'final_outcome', ar.final_outcome
    ),

    'worksheet', jsonb_build_object(
      'worksheet_output', ar.worksheet_output,
      'retest_condition', ar.retest_condition
    ),

    'integrity', jsonb_build_object(
      'has_score', ar.score_total is not null,
      'has_verdict', ar.final_verdict is not null,
      'has_weakest_dimension', ar.weakest_dimension is not null,
      'has_verdict_sections', (
        ar.execution_diagnosis is not null
        and ar.mechanism_step_1 is not null
        and ar.mechanism_step_2 is not null
        and ar.mechanism_step_3 is not null
        and ar.final_outcome is not null
      ),
      'has_worksheet', ar.worksheet_output is not null,
      'has_retest', ar.retest_condition is not null,
      'frontend_safe', (
        ar.status = 'completed'
        and ar.score_total is not null
        and ar.final_verdict is not null
        and ar.weakest_dimension is not null
        and ar.execution_diagnosis is not null
        and ar.worksheet_output is not null
        and ar.retest_condition is not null
      )
    )
  )
  into v_payload
  from public.autopsy_runs ar
  where ar.id = p_run_id;

  if v_payload is null then
    raise exception 'Autopsy gateway payload not found for run %', p_run_id;
  end if;

  return v_payload;

end;
$function$;
