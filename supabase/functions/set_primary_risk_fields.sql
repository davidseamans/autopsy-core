-- =========================================
-- FUNCTION: set_primary_risk_fields
-- =========================================

CREATE OR REPLACE FUNCTION set_primary_risk_fields(p_run_id uuid)
RETURNS void
LANGUAGE plpgsql
 SECURITY DEFINER
SET search_path TO 'public'
AS $function$
declare
  v_dimension text;
  v_failure text;
  v_requirement text;
  v_retest text;
begin
  select primary_risk_dimension into v_dimension
  from autopsy_runs where id = p_run_id;

  select failure_condition, requirement_to_proceed, retest_condition
  into v_failure, v_requirement, v_retest
  from domain_narratives
  where dimension_code = v_dimension and is_active = true
  limit 1;

  update autopsy_runs
  set primary_risk_failure = v_failure,
      primary_risk_requirement = v_requirement,
      primary_risk_retest = v_retest
  where id = p_run_id;
end;
$function$ language plpgsql;
