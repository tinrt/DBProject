-- =============================================
-- Function: func_get_match_outcome
-- Description: Returns the outcome of a match based on match ID
-- Input: match_id (INT)
-- Output: VARCHAR - outcome result
-- =============================================

CREATE OR REPLACE FUNCTION get_match_outcome(
    p_match_id IN MatchGame.match_id%TYPE
) 
RETURN MatchGame.final_score%TYPE IS
    v_final_score MatchGame.final_score%TYPE;
BEGIN
    SELECT final_score INTO v_final_score
    FROM MatchGame
    WHERE match_id = p_match_id;
    
    If v_final_score IS NULL THEN
        RAISE_APPLICATION_ERROR(-20104, 'Match has not been finished.');
    ELSE
        RETURN v_final_score;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        RETURN NULL;
END get_match_outcome;
/

-- TEST CASE:
-- EXECUTE func_get_match_outcome(1);
