--  create a procedure to complete match status and update final score of a match game

CREATE OR REPLACE PROCEDURE Complete_MatchGame (p_match_id IN MatchGame.match_id%TYPE,
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
-- EXECUTE CompleteMatchGame(5, '3-2');
