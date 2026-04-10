-- =========================================
-- FUNCTION: apply_autopsy_result
-- =========================================
CREATE OR REPLACE FUNCTION apply_autopsy_result(p_run_id uuid)
RETURNS void
LANGUAGE plpgsql
AS $function$
DECLARE
    v_constraint TEXT;
BEGIN
    v_constraint := resolve_primary_constraint(p_run_id);

    UPDATE autopsy_runs
    SET
        primary_risk = v_constraint,
        weakest_domain = v_constraint,
        verdict = v_constraint
    WHERE id = p_run_id;
END;
$function$ LANGUAGE plpgsql;
