- =========================================
-- FUNCTION: resolve_primary_constraint
-- =========================================

CREATE OR REPLACE FUNCTION resolve_primary_constraint(p_run_id uuid)
RETURNS text
LANGUAGE plpgsql
AS $function$
DECLARE
    v_constraint TEXT;
BEGIN

    -- HARD FAIL FIRST
    SELECT ca.concept
    INTO v_constraint
    FROM concept_aggregation ca
    JOIN concept_groups cg 
        ON cg.group_label = ca.concept
    WHERE ca.run_id = p_run_id
      AND ca.has_hard_fail = true
    ORDER BY cg.priority_rank ASC
    LIMIT 1;

    IF v_constraint IS NOT NULL THEN
        RETURN v_constraint;
    END IF;

    -- SOFT FAIL
    SELECT ca.concept
    INTO v_constraint
    FROM concept_aggregation ca
    JOIN concept_groups cg 
        ON cg.group_label = ca.concept
    WHERE ca.run_id = p_run_id
      AND ca.has_fail = true
    ORDER BY ca.fail_count DESC, cg.priority_rank ASC
    LIMIT 1;

    IF v_constraint IS NOT NULL THEN
        RETURN v_constraint;
    END IF;

    -- NO FAIL
    RETURN 'No critical constraints';

END;
$function$ language plpgsql;
