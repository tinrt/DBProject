-- =============================================
-- Function: func_potential_payout
-- Description: Calculates the potential payout for a given bet amount and odds
-- Input: amount (DECIMAL), odds (DECIMAL)
-- Output: DECIMAL - potential payout
-- =============================================

CREATE OR REPLACE FUNCTION GetPotentialPayout(
    p_bet_amount IN Bet.bet_amount%TYPE,
    p_odds_id    IN Odds.odds_id%TYPE
) RETURN DECIMAL AS
    v_team_1_odds    Odds.team_1_odds%TYPE;
    v_team_2_odds    Odds.team_2_odds%TYPE;
    v_draw_odds      Odds.draw_odds%TYPE;
    v_potential_payout DECIMAL(9, 2);
BEGIN
    SELECT team_1_odds, team_2_odds, draw_odds
    INTO v_team_1_odds, v_team_2_odds, v_draw_odds
    FROM Odds
    WHERE odds_id = p_odds_id;

    v_potential_payout := p_bet_amount * v_team_1_odds;

    RETURN v_potential_payout;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No odds found for the given odds_id');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: An unexpected error occurred while calculating the potential payout.');
        RETURN NULL;
END;
/

-- TEST CASE:
-- EXECUTE func_potential_payout(100, 1.8);
