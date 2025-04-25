-- ==============================================
-- Trigger: trig_check_match_exists
-- Purpose: Ensure that a bet is placed only on an existing match
-- Fires: BEFORE INSERT on bets
-- ==============================================

CREATE OR REPLACE TRIGGER CheckMatchBeforeBetInsert
BEFORE INSERT ON Bet
REFERENCING NEW AS new
FOR EACH ROW
DECLARE
    v_match_exists INT;
BEGIN
    SELECT COUNT(*) INTO v_match_exists
    FROM MatchGame
    WHERE match_id = :NEW.match_id;
    
    IF v_match_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Match with ID ' || :NEW.match_id || ' does not exist.');
    END IF;
END;
/