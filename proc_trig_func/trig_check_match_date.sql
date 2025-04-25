-- ==============================================
-- Trigger: trig_check_match_date
-- Purpose: Prevent creating a match with a past date
-- Fires: BEFORE INSERT on matches
-- ==============================================

CREATE OR REPLACE TRIGGER check_match_date
BEFORE INSERT ON Bet
FOR EACH ROW
DECLARE
    v_match_date MatchGame.match_date%TYPE;
BEGIN

    -- Get match date
    SELECT match_date INTO v_match_date
    FROM MatchGame
    WHERE match_id = :NEW.match_id;
    
    -- Check if match date passed
    IF SYSDATE > v_match_date THEN
        RAISE_APPLICATION_ERROR(-20103, 'Match has already passed.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/