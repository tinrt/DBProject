-- =============================================
-- Procedure: proc_add_player
-- Description: Adds a new player to the system
-- Inputs: name (VARCHAR), balance (DECIMAL)
-- =============================================

CREATE OR REPLACE PROCEDURE AddNewPlayer(
    p_username IN Player.username%TYPE,
    p_Fname IN Player.Fname%TYPE,
    p_Lname IN Player.Lname%TYPE,
    p_email IN Player.email%TYPE,
    p_date_of_birth IN Player.date_of_birth%TYPE,
    p_password_hash IN Player.password_hash%TYPE,
    p_balance IN Player.balance%TYPE) AS

BEGIN
    INSERT INTO Player (username, Fname, Lname, email, date_of_birth, password_hash, balance)
    VALUES (p_username, p_Fname, p_Lname, p_email, p_date_of_birth, p_password_hash, p_balance);
    DBMS_OUTPUT.PUT_LINE('New Player has been added successfully');
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occured');
        ROLLBACK;
END;
/

-- TEST CASE:
-- EXECUTE proc_add_player('John Doe', 500.00);
