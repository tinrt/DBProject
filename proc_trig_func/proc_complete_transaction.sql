-- =============================================
-- Procedure: proc_complete_transaction
-- Description: Deducts player balance and inserts transaction record
-- Inputs: player_id, amount
-- =============================================


CREATE OR REPLACE PROCEDURE place_transaction (
    p_player_id             IN Player.player_id%TYPE,
    p_amount                IN Player_Transaction.amount%TYPE,
    p_transaction_type      IN Player_Transaction.transaction_type%TYPE,
    p_status                IN Player_Transaction.status%TYPE
) AS
BEGIN
    INSERT INTO Player_Transaction (
        player_id, amount, transaction_type, status
    )
    VALUES (
        p_player_id, p_amount, p_transaction_type, p_status
    );
    
    DBMS_OUTPUT.PUT_LINE('Your request to ' || p_transaction_type ||
                         ' $' || p_amount || ' is ' || p_status);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
END;
/


-- TEST CASE:
-- EXECUTE proc_complete_transaction(1, 100.00);
