-- ==============================================
-- Trigger: trig_check_age
-- Purpose: Ensure that a player being inserted is at least 18 years old
-- Fires: BEFORE INSERT on players
-- ==============================================

CREATE OR REPLACE TRIGGER check_player_age
BEFORE INSERT OR UPDATE ON Player
FOR EACH ROW
BEGIN

    IF ADD_MONTHS(:NEW.date_of_birth, 12 * 21) > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20102, 'Player is not 21 or older.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/