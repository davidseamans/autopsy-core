-- =========================================
-- FUNCTION: convert_lead
-- =========================================

CREATE OR REPLACE FUNCTION public.convert_lead(p_lead_id uuid)
RETURNS json
LANGUAGE plpgsql
AS $function$
declare
v_lead record;
v_account_id uuid;
v_contact_id uuid;
v_pipeline_id uuid;
begin

-- Get lead
select * into v_lead
from leads
where id = p_lead_id;

if not found then
return json_build_object('error', 'LEAD_NOT_FOUND');
end if;

-- Prevent duplicate conversion
if v_lead.status = 'converted' then
return json_build_object('error', 'LEAD_ALREADY_CONVERTED');
end if;

-- Create account
insert into accounts(name)
values (v_lead.name)
returning id into v_account_id;

-- Create contact
insert into contacts(account_id, name)
values (v_account_id, v_lead.name)
returning id into v_contact_id;

-- Create pipeline
insert into pipeline(account_id, stage)
values (v_account_id, 'qualified')
returning id into v_pipeline_id;

-- Mark lead as converted
update leads
set status = 'converted'
where id = p_lead_id;

return json_build_object(
'success', true,
'account_id', v_account_id,
'contact_id', v_contact_id,
'pipeline_id', v_pipeline_id
);

exception
when others then
return json_build_object('error', SQLERRM);
end;
$function$ language plpgsql;
