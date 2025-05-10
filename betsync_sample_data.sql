-- Insert into Admin
INSERT INTO Admin (username, password_hash) VALUES ('admin1', 'hash123');
INSERT INTO Admin (username, password_hash) VALUES ('admin2', 'hash456');
INSERT INTO Admin (username, password_hash) VALUES ('admin3', 'hash789');
INSERT INTO Admin (username, password_hash) VALUES ('admin4', 'hashabc');
INSERT INTO Admin (username, password_hash) VALUES ('admin5', 'hashdef');
INSERT INTO Admin (username, password_hash) VALUES ('admin6', 'hashghi');
INSERT INTO Admin (username, password_hash) VALUES ('admin7', 'hashjkl');
INSERT INTO Admin (username, password_hash) VALUES ('admin8', 'hashmno');
INSERT INTO Admin (username, password_hash) VALUES ('admin9', 'hashpqr');
INSERT INTO Admin (username, password_hash) VALUES ('admin10', 'hashstu');

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

INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player5', 'First5', 'Last5', 'player5@example.com', 'hash5', 449.58, TO_DATE('1983-08-02', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player6', 'First6', 'Last6', 'player6@example.com', 'hash6', 229.87, TO_DATE('2008-07-05', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player7', 'First7', 'Last7', 'player7@example.com', 'hash7', 393.32, TO_DATE('1983-06-10', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player8', 'First8', 'Last8', 'player8@example.com', 'hash8', 944.42, TO_DATE('1990-03-21', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player9', 'First9', 'Last9', 'player9@example.com', 'hash9', 920.79, TO_DATE('1987-10-13', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player10', 'First10', 'Last10', 'player10@example.com', 'hash10', 667.08, TO_DATE('1990-02-01', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player11', 'First11', 'Last11', 'player11@example.com', 'hash11', 465.95, TO_DATE('2019-01-21', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player12', 'First12', 'Last12', 'player12@example.com', 'hash12', 926.76, TO_DATE('2010-06-08', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player13', 'First13', 'Last13', 'player13@example.com', 'hash13', 491.34, TO_DATE('1993-03-31', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player14', 'First14', 'Last14', 'player14@example.com', 'hash14', 531.98, TO_DATE('1993-09-08', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player15', 'First15', 'Last15', 'player15@example.com', 'hash15', 85.75, TO_DATE('1991-04-27', 'YYYY-MM-DD'));
INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
VALUES ('player16', 'First16', 'Last16', 'player16@example.com', 'hash16', 904.09, TO_DATE('1991-04-13', 'YYYY-MM-DD'));

-- Insert into Team
INSERT INTO Team (sport_id, team_name) VALUES (42, 'Team5');
INSERT INTO Team (sport_id, team_name) VALUES (42, 'Team6');
INSERT INTO Team (sport_id, team_name) VALUES (44, 'Team7');
INSERT INTO Team (sport_id, team_name) VALUES (42, 'Team8');
INSERT INTO Team (sport_id, team_name) VALUES (42, 'Team9');
INSERT INTO Team (sport_id, team_name) VALUES (44, 'Team10');
INSERT INTO Team (sport_id, team_name) VALUES (43, 'Team11');
INSERT INTO Team (sport_id, team_name) VALUES (42, 'Team12');
INSERT INTO Team (sport_id, team_name) VALUES (43, 'Team13');
INSERT INTO Team (sport_id, team_name) VALUES (44, 'Team14');
INSERT INTO Team (sport_id, team_name) VALUES (44, 'Team15');
INSERT INTO Team (sport_id, team_name) VALUES (42, 'Team16');

-- Updated Insert into MatchGame
INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (117, 118, 28, TO_DATE('2025-04-22', 'YYYY-MM-DD'), 'finished', '2-1', 'Stadium A');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (119, 120, 29, TO_DATE('2025-04-23', 'YYYY-MM-DD'), 'upcoming', NULL, 'Stadium B');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (121, 122, 30, TO_DATE('2025-04-24', 'YYYY-MM-DD'), 'live', NULL, 'Stadium C');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (117, 119, 31, TO_DATE('2025-04-25', 'YYYY-MM-DD'), 'upcoming', NULL, 'Stadium D');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (118, 120, 32, TO_DATE('2025-04-26', 'YYYY-MM-DD'), 'upcoming', NULL, 'Stadium E');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (128, 125, 33, TO_DATE('2025-03-27', 'YYYY-MM-DD'), 'finished', '1-2', 'Location5');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (126, 127, 34, TO_DATE('2025-01-31', 'YYYY-MM-DD'), 'live', '3-5', 'Location6');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (127, 126, 35, TO_DATE('2025-07-12', 'YYYY-MM-DD'), 'live', '4-1', 'Location7');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (120, 126, 36, TO_DATE('2025-05-19', 'YYYY-MM-DD'), 'finished', '0-5', 'Location8');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (125, 120, 37, TO_DATE('2025-06-13', 'YYYY-MM-DD'), 'upcoming', '1-3', 'Location9');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (127, 120, 28, TO_DATE('2025-04-30', 'YYYY-MM-DD'), 'live', '5-1', 'Location10');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (117, 121, 29, TO_DATE('2025-04-27', 'YYYY-MM-DD'), 'upcoming', '0-0', 'Location11');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (121, 126, 30, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'upcoming', '3-3', 'Location12');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (125, 119, 31, TO_DATE('2025-07-04', 'YYYY-MM-DD'), 'live', '2-4', 'Location13');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (124, 125, 32, TO_DATE('2025-04-04', 'YYYY-MM-DD'), 'finished', '3-4', 'Location14');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (127, 125, 33, TO_DATE('2025-06-29', 'YYYY-MM-DD'), 'finished', '1-5', 'Location15');

INSERT INTO MatchGame (team_1, team_2, admin_id, match_date, status, final_score, match_location)
VALUES (123, 120, 34, TO_DATE('2025-04-06', 'YYYY-MM-DD'), 'live', '3-4', 'Location16');

-- Standard odds per match, using match_ids 157–173 and admin_ids 28–37
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (157, 28, 1.80, 2.00, 3.50);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (158, 29, 1.90, 2.10, 3.30);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (159, 30, 2.00, 1.80, 3.00);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (160, 31, 2.50, 1.60, 2.90);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (161, 32, 2.20, 2.20, 2.20);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (162, 33, 2.10, 2.30, 3.10);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (163, 34, 1.70, 2.60, 3.20);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (164, 35, 1.85, 2.15, 3.40);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (165, 36, 2.00, 2.00, 3.00);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (166, 37, 1.95, 2.25, 3.25);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (167, 28, 2.10, 1.90, 2.80);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (168, 29, 1.60, 2.40, 3.10);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (169, 30, 2.25, 1.85, 2.95);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (170, 31, 2.40, 1.70, 2.60);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (171, 32, 2.00, 2.00, 3.00);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (172, 33, 1.88, 2.22, 3.33);
INSERT INTO Odds (match_id, admin_id, team_1_odds, team_2_odds, draw_odds) VALUES (173, 34, 2.55, 1.45, 3.05);

-- All of these match_ids are 'upcoming' or 'live'
INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (152, 158, 57, 'team_1', 50, 90, 'won');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (153, 159, 58, 'draw', 30, 99, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (154, 160, 59, 'team_2', 40, 72, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (155, 161, 60, 'team_1', 60, 150, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (156, 163, 62, 'draw', 20, 44, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (159, 164, 63, 'team_1', 175.89, 300, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (160, 165, 64, 'team_2', 13.3, 25, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (161, 166, 65, 'draw', 95.97, 280, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (162, 167, 66, 'team_1', 66.16, 120, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (165, 168, 67, 'team_2', 131.97, 290, 'pending');

INSERT INTO Bet (player_id, match_id, odds_id, bet_type, bet_amount, potential_payout, bet_status)
VALUES (166, 169, 68, 'draw', 92.36, 250, 'pending');


INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (1, 152, 23.57, 'deposit', TO_DATE('2024-06-12', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:06', 'HH24:MI:SS'), 'completed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (2, 153, -3.31, 'bet', TO_DATE('2024-06-05', 'YYYY-MM-DD'), TO_TIMESTAMP('16:17:29', 'HH24:MI:SS'), 'failed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (3, 154, 39.05, 'deposit', TO_DATE('2024-05-04', 'YYYY-MM-DD'), TO_TIMESTAMP('06:28:08', 'HH24:MI:SS'), 'pending');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (4, 155, -6.54, 'bet', TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_TIMESTAMP('16:31:58', 'HH24:MI:SS'), 'completed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (5, 156, -5.48, 'withdrawal', TO_DATE('2025-01-28', 'YYYY-MM-DD'), TO_TIMESTAMP('19:17:44', 'HH24:MI:SS'), 'completed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (6, 159, -6.27, 'withdrawal', TO_DATE('2024-08-30', 'YYYY-MM-DD'), TO_TIMESTAMP('15:53:55', 'HH24:MI:SS'), 'pending');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (7, 160, -3.68, 'bet', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_TIMESTAMP('04:56:50', 'HH24:MI:SS'), 'completed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (8, 161, -5.63, 'withdrawal', TO_DATE('2024-07-04', 'YYYY-MM-DD'), TO_TIMESTAMP('20:04:28', 'HH24:MI:SS'), 'pending');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (9, 162, 19.53, 'deposit', TO_DATE('2025-04-05', 'YYYY-MM-DD'), TO_TIMESTAMP('09:42:01', 'HH24:MI:SS'), 'pending');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (10, 165, -8.7, 'bet', TO_DATE('2024-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('04:49:01', 'HH24:MI:SS'), 'pending');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (11, 166, -5.53, 'bet', TO_DATE('2024-08-16', 'YYYY-MM-DD'), TO_TIMESTAMP('07:22:38', 'HH24:MI:SS'), 'completed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (12, 167, -3.5, 'bet', TO_DATE('2025-01-26', 'YYYY-MM-DD'), TO_TIMESTAMP('19:15:03', 'HH24:MI:SS'), 'completed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (13, 168, -9.25, 'withdrawal', TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_TIMESTAMP('03:58:11', 'HH24:MI:SS'), 'pending');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (14, 152, -6.23, 'bet', TO_DATE('2025-02-05', 'YYYY-MM-DD'), TO_TIMESTAMP('05:12:20', 'HH24:MI:SS'), 'completed');

INSERT INTO Player_Transaction (transaction_id, player_id, amount, transaction_type, transaction_date, transaction_time, status)
VALUES (15, 153, 40.73, 'deposit', TO_DATE('2025-01-23', 'YYYY-MM-DD'), TO_TIMESTAMP('20:53:00', 'HH24:MI:SS'), 'completed');
