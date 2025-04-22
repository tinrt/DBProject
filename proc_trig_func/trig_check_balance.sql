CREATE OR REPLACE TRIGGER check_balance_before_insert
BEFORE INSERT OR UPDATE ON Bet
FOR EACH ROW
DECLARE
    v_balance Player.balance%TYPE;
BEGIN
    -- Get Players current salary
    SELECT balance 
    INTO v_balance
    FROM Player
    WHERE player_id = :NEW.player_id;
    
    -- Raise an error if the bet amount is more than the balance
    IF :NEW.bet_amount > v_balance THEN
        RAISE_APPLICATION_ERROR(-20100, 'Insuffient funds to place bet.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20101, 'Player not found.');
    WHEN OTHERS THEN
        RAISE;
END;
/