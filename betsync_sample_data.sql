-- Insert into Admin
INSERT INTO Admin (username, password_hash) VALUES ('admin1', 'hash123');

-- Insert into Sport
INSERT INTO Sport (sport_name) VALUES ('football');
INSERT INTO Sport (sport_name) VALUES ('soccer');
INSERT INTO Sport (sport_name) VALUES ('baseball');

-- Insert into Player
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player1', 'John', 'Doe', 'john@example.com', 'hash1', 200.00, TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player2', 'Jane', 'Smith', 'jane@example.com', 'hash2', 300.00, TO_DATE('1992-02-02', 'YYYY-MM-DD'));

INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player3', 'Ali', 'Reza', 'ali@example.com', 'hash3', 150.00, TO_DATE('1995-03-03', 'YYYY-MM-DD'));

INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player4', 'Maria', 'Lopez', 'maria@example.com', 'hash4', 500.00, TO_DATE('1991-04-04', 'YYYY-MM-DD'));

INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player5', 'Tom', 'Lee', 'tom@example.com', 'hash5', 250.00, TO_DATE('1989-05-05', 'YYYY-MM-DD'));

-- Insert into Team (2 per sport for simplicity)
INSERT INTO Team (sport_id, team_name) VALUES (1, 'Thunder Football');
INSERT INTO Team (sport_id, team_name) VALUES (1, 'Eagles Football');
INSERT INTO Team (sport_id, team_name) VALUES (2, 'United Soccer');
INSERT INTO Team (sport_id, team_name) VALUES (2, 'Galaxy Soccer');
INSERT INTO Team (sport_id, team_name) VALUES (3, 'Red Sox Baseball');
INSERT INTO Team (sport_id, team_name) VALUES (3, 'Blue Jays Baseball');

-- Insert into MatchGame
INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (1, 2, 1, TO_DATE('2025-04-22', 'YYYY-MM-DD'), 'finished', '2-1', 'Stadium A');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (3, 4, 1, TO_DATE('2025-04-23', 'YYYY-MM-DD'), 'upcoming', NULL, 'Stadium B');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (5, 6, 1, TO_DATE('2025-04-24', 'YYYY-MM-DD'), 'live', NULL, 'Stadium C');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (1, 3, 1, TO_DATE('2025-04-25', 'YYYY-MM-DD'), 'upcoming', NULL, 'Stadium D');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (2, 4, 1, TO_DATE('2025-04-26', 'YYYY-MM-DD'), 'upcoming', NULL, 'Stadium E');

-- Insert into Odds
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
VALUES (1, 1, 1.80, 2.00, 3.50);

INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
VALUES (2, 1, 1.90, 2.10, 3.30);

INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
VALUES (3, 1, 2.00, 1.80, 3.00);

INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
VALUES (4, 1, 2.50, 1.60, 2.90);

INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds)
VALUES (5, 1, 2.20, 2.20, 2.20);

-- Insert into Bet
INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (1, 1, 1, 'team_1', 50, 90, 'won');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (2, 2, 2, 'draw', 30, 99, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (3, 3, 3, 'team_2', 40, 72, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (4, 4, 4, 'team_1', 60, 150, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (5, 5, 5, 'draw', 20, 44, 'pending');

-- Insert into Player_Transaction
INSERT INTO Player_Transaction (player_id, amount, transaction_type, status)
VALUES (1, 100, 'deposit', 'completed');

INSERT INTO Player_Transaction (player_id, amount, transaction_type, status)
VALUES (2, 50, 'deposit', 'completed');

INSERT INTO Player_Transaction (player_id, amount, transaction_type, status)
VALUES (3, 40, 'bet', 'completed');

INSERT INTO Player_Transaction (player_id, amount, transaction_type, status)
VALUES (4, 60, 'bet', 'completed');

INSERT INTO Player_Transaction (player_id, amount, transaction_type, status)
VALUES (5, 20, 'withdrawal', 'completed');
