CREATE OR REPLACE FUNCTION GetBetStatus(p_bet_id IN Bet.bet_id%TYPE) RETURN VARCHAR2 AS
    v_bet_status VARCHAR2(20);
BEGIN
    SELECT bet_status INTO v_bet_status
    FROM Bet
    WHERE bet_id = p_bet_id;
    
    RETURN v_bet_status;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error, no bet found with ID ' || p_bet_id);
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error');
        RETURN NULL;
END;
/