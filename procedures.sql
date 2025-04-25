-- procedure to update the status of a match game

CREATE OR REPLACE PROCEDURE UpdateMatchGameStatus ( p_match_id IN MatchGame.match_id%TYPE, 
						    p_status IN MatchGame.status%TYPE) AS

BEGIN

	UPDATE MatchGame
	SET status = p_status
	WHERE match_id = p_match_id;

	DBMS_OUTPUT.PUT_LINE('Match status updated successfully to ' || p_status || ' for match id ' || p_match_id);

	COMMIT;


EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Error occurred');
		ROLLBACK;
END;
/

-- call procedure to update match game status

EXECUTE UpdateMatchGameStatus(3, 'finished');

EXECUTE UpdateMatchGameStatus(4, 'live');


--  create a procedure to complete match status and update final score of a match game

CREATE OR REPLACE PROCEDURE CompleteMatchGame (p_match_id IN MatchGame.match_id%TYPE,
						p_final_score IN MatchGame.final_score%TYPE) AS

BEGIN

	UPDATE MatchGame
	SET final_score = p_final_score, status = 'finished'
	WHERE match_id = p_match_id;

	DBMS_OUTPUT.PUT_LINE ('Match successfully completed. Match ID: ' || p_match_id || ' final score: ' || p_final_score);
	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Error occurred');
		ROLLBACK;
END;
/

-- call procedure to update status and score of completed match game
EXECUTE CompleteMatchGame(5, '3-2');

--  create procedure to set odds for a match game

CREATE OR REPLACE PROCEDURE SetOdds (p_match_id IN MatchGame.match_id%TYPE,
    								p_admin_id IN Admin.admin_id%TYPE,
				    				p_team_1_odds IN Odds.team_1_odds%TYPE,
				     				p_team_2_odds IN Odds.team_2_odds%TYPE,
				     				p_draw_odds IN Odds.draw_odds%TYPE) AS

BEGIN
	INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
	VALUES (p_match_id, p_admin_id, p_team_1_odds, p_team_2_odds, p_draw_odds);

	DBMS_OUTPUT.PUT_LINE('Odds added successfully.');
	COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Error occurred adding odds.');
		ROLLBACK;

END;
/

-- call procedure to add odds to new match game
EXECUTE SetOdds(7, 1, 2.50, 1.50, 3.50); 
EXECUTE SetOdds(3, 1, 2.00, 1.80, 3.00);

--  create new admin 

CREATE OR REPLACE PROCEDURE CreateNewAdmin (p_username IN Admin.username%TYPE, 							p_password_hash IN Admin.password_hash%TYPE) AS

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

EXECUTE CreateNewAdmin('admin2', 'password123');
