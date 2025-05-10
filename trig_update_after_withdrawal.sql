CREATE OR REPLACE TRIGGER UpdateBalanceAfterTransaction
AFTER INSERT ON Player_Transaction
REFERENCING NEW AS new
FOR EACH ROW
DECLARE
BEGIN
  IF :new.transaction_type = 'deposit' THEN
    UPDATE Player
    SET balance = balance + :new.amount
    WHERE player_id = :new.player_id;

  ELSIF :new.transaction_type = 'withdrawal' OR :new.transaction_type = 'bet' THEN
    UPDATE Player
    SET balance = balance - :new.amount
    WHERE player_id = :new.player_id;
  END IF;
END;
/