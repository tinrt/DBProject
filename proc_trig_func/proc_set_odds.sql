--  create procedure to set odds for a match game

CREATE OR REPLACE PROCEDURE Set_Odds (p_match_id IN MatchGame.match_id%TYPE,
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
-- EXECUTE SetOdds(7, 1, 2.50, 1.50, 3.50); 
-- EXECUTE SetOdds(3, 1, 2.00, 1.80, 3.00);
