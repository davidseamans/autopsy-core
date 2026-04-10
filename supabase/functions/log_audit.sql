-- =========================================
-- FUNCTION: log_audt
-- =========================================

CREATE OR REPLACE FUNCTION log_audit()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
insert into audit_log(entity, entity_id, action)
values (tg_table_name, new.id, tg_op);
return new;
end;
$function$ language plpgsql;
