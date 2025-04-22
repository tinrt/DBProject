CREATE OR REPLACE TRIGGER CheckBalanceBeforeWithdrawal
BEFORE INSERT ON Player_Transaction
REFERENCING NEW AS new
FOR EACH ROW
DECLARE
    v_balance NUMBER(10,2);
BEGIN
    SELECT balance INTO v_balance
    FROM Player
    WHERE player_id = :new.player_id;

    IF :new.transaction_type = 'withdrawal' THEN
        IF :new.amount > v_balance THEN
            RAISE_APPLICATION_ERROR(-20002, 'Insufficient balance for withdrawal.');
        END IF;
    END IF;
END;
/