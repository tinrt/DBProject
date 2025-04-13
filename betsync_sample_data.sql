
-- Insert into SPORT
INSERT INTO Sport (sport_type) VALUES ('Soccer');
INSERT INTO Sport (sport_type) VALUES ('Football');
INSERT INTO Sport (sport_type) VALUES ('Baseball');

-- Insert into TEAM
INSERT INTO Team (sport_type, team_name) VALUES ('Soccer', 'Red Hawks');
INSERT INTO Team (sport_type, team_name) VALUES ('Soccer', 'Blue Tigers');
INSERT INTO Team (sport_type, team_name) VALUES ('Football', 'Iron Bulls');
INSERT INTO Team (sport_type, team_name) VALUES ('Baseball', 'Diamond Eagles');

-- Insert into ADMIN
INSERT INTO Admin (username, password_hash) VALUES ('admin1', 'hash_pass1');
INSERT INTO Admin (username, password_hash) VALUES ('admin2', 'hash_pass2');

-- Insert into PLAYER
INSERT INTO Player (username, Fname, Lname, email, password_hash, balance) 
VALUES ('jdoe', 'John', 'Doe', 'jdoe@example.com', 'passhash1', 150.00);

INSERT INTO Player (username, Fname, Lname, email, password_hash, balance) 
VALUES ('asmith', 'Alice', 'Smith', 'asmith@example.com', 'passhash2', 250.00);

-- Insert into MATCHGAME
INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (1, 2, 1, TO_DATE('2025-04-15', 'YYYY-MM-DD'), 'upcoming', NULL, 'Metropolis Stadium');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (3, 4, 2, TO_DATE('2025-04-10', 'YYYY-MM-DD'), 'finished', '21-14', 'Iron Field');

-- Insert into TEAM_MATCH
INSERT INTO Team_Match (match_id, team_id) VALUES (1, 1);
INSERT INTO Team_Match (match_id, team_id) VALUES (1, 2);
INSERT INTO Team_Match (match_id, team_id) VALUES (2, 3);
INSERT INTO Team_Match (match_id, team_id) VALUES (2, 4);

-- Insert into ODDS
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
VALUES (1, 1, 2.50, 3.10, 3.00);

INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
VALUES (2, 2, 1.80, 4.00, 0.00);

-- Insert into BET
INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (1, 1, 1, 'team_1', 50.00, 125.00, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (2, 2, 2, 'team_2', 30.00, 120.00, 'lost');

-- Insert into PLAYER_TRANSACTION
INSERT INTO Player_Transaction (player_id, amount, transaction_type, status)
VALUES (1, 100.00, 'deposit', 'completed');

INSERT INTO Player_Transaction (player_id, amount, transaction_type, status)
VALUES (2, 30.00, 'bet', 'completed');

