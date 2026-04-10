-- =========================================
-- FUNCTION: validate_pipeline_stage_transition
-- =========================================

CREATE OR REPLACE FUNCTION validate_pipeline_stage_transition()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
if tg_op = 'UPDATE' then

if old.stage = 'lead' and new.stage not in ('qualified') then
  raise exception 'INVALID STAGE TRANSITION: lead to %', new.stage;
end if;

if old.stage = 'qualified' and new.stage not in ('quoted') then
  raise exception 'INVALID STAGE TRANSITION: qualified to %', new.stage;
end if;

if old.stage = 'quoted' and new.stage not in ('won', 'lost') then
  raise exception 'INVALID STAGE TRANSITION: quoted to %', new.stage;
end if;

if old.stage in ('won', 'lost') and new.stage <> old.stage then
  raise exception 'FINAL STAGE CANNOT BE CHANGED';
end if;

end if;

return new;
end;
$function$ language plpgsql;
