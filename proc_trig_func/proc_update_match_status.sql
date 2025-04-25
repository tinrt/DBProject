-- procedure to update the status of a match game

CREATE OR REPLACE PROCEDURE Update_MatchGame_Status ( p_match_id IN MatchGame.match_id%TYPE, 
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

-- EXECUTE Update_MatchGame_Status(3, 'finished');

-- EXECUTE Update_MatchGame_Status(4, 'live');