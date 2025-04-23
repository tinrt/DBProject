-- Simple queries

-- 1. display all players from Player table sorted by last name
SELECT fname, lname
FROM Player
ORDER BY lname;

-- 2. display all teams where the team name contains football
SELECT team_name
FROM Team
WHERE team_name LIKE '%Football';

-- 3. display the count of all matches that have not been played or started 
SELECT COUNT (*) AS upcomingMatchesCount
FROM MatchGame
WHERE status = 'upcoming';

-- 4. display transaction data with type bet above $50 and sorted by player id
SELECT *
FROM Player_Transaction
WHERE amount > 50 AND transaction_type = 'bet'
ORDER BY player_id;

-- 5. display all bets with potential payout greater $50, sorted by potential payout amount
SELECT *
FROM Bet
WHERE potential_payout > 50
ORDER BY potential_payout DESC;

-- 6. display sum of all potential payout amounts per player
SELECT player_id, SUM(potential_payout) AS total_potential_payout
FROM Bet
GROUP BY player_id;

-- 7. display all match ids where the odds for team2 is greater than odds for team1
SELECT match_id, team_1_odds, team_2_odds
FROM Odds
WHERE team_2_odds > team_1_odds;

-- Aggregate Functions

-- 1. calculate average potential payout amount for pending bets
SELECT AVG(potential_payout)
FROM Bet
WHERE bet_status = 'pending';

-- 2. calculate the total amount deposited for each player
SELECT player_id, SUM(amount) AS Total_Deposited
FROM Player_Transaction
WHERE transaction_type = 'deposit'
GROUP BY player_id;

-- Subqueries and Joins

-- Subqueries

-- 1. display all team names for which the sport is football
SELECT team_name
FROM Team
WHERE sport_id = (SELECT sport_id 
		FROM Sport
		WHERE sport_name = "football");

--2. display players who have won bets
SELECT fname, lname
FROM Player
WHERE player_id = (SELECT player_id
		FROM Bet
		WHERE bet_status = 'won');

-- 3. display all matches a specific team is playing in
SELECT match_date, match_location
FROM MatchGame
WHERE team_1 = (SELECT team_id
		FROM Team
		WHERE team_name = 'United Soccer')
OR team_2 = (SELECT team_id
		FROM Team
		WHERE team_name = 'United Soccer');

-- 4. display odds for both teams for a match between United Soccer and Galaxy Soccer
SELECT team_1_odds, team_2_odds
FROM Odds
WHERE match_id = (SELECT match_id
		FROM MatchGame 
		WHERE team_1 = (SELECT team_id 
				FROM Team
				WHERE team_name = 'United Soccer')
		 AND team_2 =  (SELECT team_id
				FROM Team
				WHERE team_name = 'Galaxy Soccer'));

-- Joins

-- 1. display all future matches (date and location) for the team United Soccer
SELECT m.match_date, m.match_location
FROM Team t JOIN MatchGame m ON t.team_id = m.team_1 OR t.team_id = m.team_2
WHERE t.team_name = 'United Soccer' AND m.status = 'upcoming'; 

-- 2. display match data and odds data for all upcoming games
SELECT m.match_date, m.match_location, o.team_1_odds, o.team_2_odds, o.draw_odds, m.team_1, m.team_2
FROM Odds o 
    INNER JOIN MatchGame m ON o.match_id = m.match_id
	INNER JOIN Team t ON m.team_1 = t.team_id
WHERE m.status = 'upcoming';

-- 3. display player info for players with pending bets
SELECT p.fname, p.lname, p.email, b.bet_amount, b.potential_payout, b.bet_status
FROM Player p INNER JOIN Bet b ON p.player_id = b.player_id
WHERE b.bet_status = 'pending';

-- 4. display player info and transactions for all players (even players with no transaction history)
SELECT p.fname, p.lname, p.email, t.*
FROM Player p LEFT JOIN Player_Transaction t ON p.player_id = t.player_id;
