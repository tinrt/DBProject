-- =============================================
-- Function: func_get_player_balance
-- Description: Returns the balance of a player based on player_id input
-- Input: player_id (INT)
-- Output: DECIMAL(10,2) representing player's balance
-- =============================================

CREATE OR REPLACE FUNCTION get_player_balance(
    p_player_id IN Player.player_id%TYPE
) 
RETURN MatchGame.final_score%TYPE IS
    v_balance Player.balance%TYPE;
BEGIN
    SELECT balance INTO v_balance
    FROM Player
    WHERE player_id = p_player_id;
    RETURN v_balance;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20101, 'Player not found.');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        RETURN NULL;
END get_player_balance;
/


-- TEST CASE:
-- EXECUTE func_get_player_balance(1);
