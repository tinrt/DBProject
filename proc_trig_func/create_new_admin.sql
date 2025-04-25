CREATE OR REPLACE PROCEDURE Create_New_Admin (p_username IN Admin.username%TYPE, 							p_password_hash IN Admin.password_hash%TYPE) AS

BEGIN

	INSERT INTO Admin (username, password_hash)
	VALUES (p_username, p_password_hash);
	DBMS_OUTPUT.PUT_LINE('New admin created successfully');
	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Error occurred creating new admin');
		ROLLBACK;

END;
/

-- call procedure to create a new admin

-- EXECUTE CreateNewAdmin('admin2', 'password123');
