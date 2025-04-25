-- =============================================
-- Procedure: proc_place_bet
-- Description: Places a bet by a player on a match
-- Inputs: player_id, match_id, amount, odds
-- =============================================

CREATE OR REPLACE PROCEDURE PlaceBet (
    p_player_id         IN Player.player_id%TYPE,
    p_match_id          IN MatchGame.match_id%TYPE,
    p_odds_id           IN Odds.odds_id%TYPE,
    p_bet_type          IN Bet.bet_type%TYPE,
    p_bet_amount        IN Bet.bet_amount%TYPE,
    p_potential_payout  IN Bet.potential_payout%TYPE,
    p_bet_status        IN Bet.bet_status%TYPE
) AS
BEGIN
    INSERT INTO Bet (
        player_id, match_id, odds_id,
        bet_type, bet_amount, potential_payout, bet_status
    )
    VALUES (
        p_player_id, p_match_id, p_odds_id,
        p_bet_type, p_bet_amount, p_potential_payout, p_bet_status
    );
    
    DBMS_OUTPUT.PUT_LINE('New bet was placed');
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
END;
/
-- TEST CASE:
-- EXECUTE proc_place_bet(1, 2, 100.00, 2.5);
