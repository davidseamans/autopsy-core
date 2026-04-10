-- =========================================
-- FUNCTION: apply_hard_fail
-- =========================================

CREATE OR REPLACE FUNCTION apply_hard_fail(p_run_id uuid)
RETURNS void
LANGUAGE plpgsql
 SECURITY DEFINER
SET search_path TO 'public'
AS $function$
declare
  v_fail_id uuid;
  v_dimension text;
begin
  select q.id, q.dimension_code
  into v_fail_id, v_dimension
  from autopsy_answers a
  join questions q on q.id = a.question_id
  where a.run_id = p_run_id
    and q.is_hard_fail is true
    and coalesce(a.score_value, 0) = 0
  limit 1;

  if v_fail_id is not null then
    update autopsy_runs
    set verdict_name = 'STOP', status = 'failed',
        primary_risk = v_dimension, hard_fail_question_id = v_fail_id
    where id = p_run_id;
  end if;
end;
$function$ language plpgsql;
