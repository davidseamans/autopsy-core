-- =========================================
-- FUNCTION: calculate_verdict
-- =========================================

CREATE OR REPLACE FUNCTION calculate_verdict(p_run_id uuid)
RETURNS void
LANGUAGE plpgsql
 SECURITY DEFINER
SET search_path TO 'public'
AS $function$
declare
  v_score integer;
  v_scenario text;
  v_label text;
  v_body text;
begin
  select score_total, scenario into v_score, v_scenario
  from autopsy_runs where id = p_run_id;

  select label, verdict_body into v_label, v_body
  from verdict_bands
  where v_score between min_score and max_score
  and (scenario = v_scenario or scenario is null)
  limit 1;

  update autopsy_runs
  set verdict_name = v_label, verdict_body = v_body
  where id = p_run_id;
end;
$function$ language plpgsql;
