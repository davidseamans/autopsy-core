-- CURRENT CAPTURE: finalize_autopsy_run
-- Captured from live Supabase state on 2026-05-13
-- Status: canonical finalize orchestrator

CREATE OR REPLACE FUNCTION public.finalize_autopsy_run(p_run_id uuid)
 RETURNS autopsy_runs
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
declare
  v_existing autopsy_runs;
begin

  select *
  into v_existing
  from public.autopsy_runs
  where id = p_run_id;

  if v_existing.id is null then
    raise exception 'Autopsy run not found: %', p_run_id;
  end if;

  if v_existing.status = 'completed' then
    return v_existing;
  end if;

  -- CORE FINALIZE
  select *
  into v_existing
  from public.finalize_autopsy_run_internal(p_run_id);

  -- NARRATIVE HYDRATION
  perform public.generate_verdict_autopsy_narrative(p_run_id);

  perform public.generate_locked_narrative(p_run_id);

  perform public.generate_locked_worksheet(p_run_id);

  perform public.generate_retest_conditions(p_run_id);

  -- FINAL LOCK
  update public.autopsy_runs
  set
    status = 'completed',
    completed_at = now()
  where id = p_run_id;

  select *
  into v_existing
  from public.autopsy_runs
  where id = p_run_id;

  return v_existing;

end;
$function$;
