-- =========================================
-- FUNCTION: prevent_answer_changes_on_completed_run
-- =========================================

CREATE OR REPLACE FUNCTION prevent_answer_changes_on_completed_run()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
declare
  v_status text;
begin
  select status
  into v_status
  from public.autopsy_runs
  where id = coalesce(new.run_id, old.run_id);

  if v_status = 'completed' then
    raise exception 'Cannot modify answers for a completed run';
  end if;

  return coalesce(new, old);
end;
$function$ language plpgsql;
