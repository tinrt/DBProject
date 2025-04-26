from flask import Flask, render_template, request, jsonify
import cx_Oracle

app = Flask(__name__)

# Oracle DB connection (adjust user/password/SID/host)
dsn = cx_Oracle.makedsn("localhost", 1521, service_name="XEPDB1")
connection = cx_Oracle.connect(user="BetSyncDB", password="1234", dsn=dsn)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get_balance', methods=['POST'])
def get_balance():
    player_id = request.json['player_id']
    cursor = connection.cursor()
    cursor.execute("SELECT balance FROM Player WHERE player_id = :id", id=player_id)
    result = cursor.fetchone()
    print(f"Result: {result}")
    if result:
        balance = result[0]
        return jsonify({'balance': balance})
    else:
        
        return jsonify({'error': 'Player not found'}), 404

@app.route('/add_player', methods=['POST'])
def add_player():
    try:
        data = request.json
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO Player (username, fname, lname, email, password_hash, balance, date_of_birth)
            VALUES (:username, :fname, :lname, :email, :password_hash, :balance, TO_DATE(:dob, 'YYYY-MM-DD'))
        """, 
        username=data['username'],
        fname=data['fname'],
        lname=data['lname'],
        email=data['email'],
        password_hash=data['password'],
        balance=data['balance'],
        dob=data['dob']
        )
        connection.commit()
        return jsonify({'message': 'Player added successfully'})

    except Exception as e:
        print(f"Error in add_player: {e}")
        return jsonify({'error': str(e)}), 500


@app.route('/place_bet', methods=['POST'])
def place_bet():
    try:
        data = request.json
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO Bet (player_id, match_id, amount, odds)
            VALUES (:player_id, :match_id, :amount, :odds)
        """,
        player_id=data['player_id'],
        match_id=data['match_id'],
        amount=data['amount'],
        odds=data['odds']
        )
        connection.commit()
        return jsonify({'message': 'Bet placed successfully'})

    except Exception as e:
        print(f"Error in place_bet: {e}")
        return jsonify({'error': str(e)}), 500


@app.route('/get_games', methods=['GET'])
def get_games():
    try:
        cursor = connection.cursor()
        cursor.execute("""
            SELECT match_id, team_1, team_2, status
            FROM MatchGame
            WHERE status IN ('upcoming', 'live')
        """)
        games = []
        for match_id, team1, team2, status in cursor.fetchall():
            games.append({
                'match_id': match_id,
                'teams': f"{team1} vs {team2}",
                'status': status
            })
        return jsonify(games)
    except Exception as e:
        print(f"Error in get_games: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/report/<report_type>', methods=['GET'])
def report(report_type):
    try:
        cursor = connection.cursor()

        if report_type == 'highBalance':
            cursor.execute("SELECT player_id, balance FROM Player WHERE balance > 200")
        elif report_type == 'topBets':
            cursor.execute("SELECT player_id, bet_amount FROM Bet ORDER BY bet_amount DESC FETCH FIRST 5 ROWS ONLY")
        elif report_type == 'finishedMatches':
            cursor.execute("SELECT match_id, final_score FROM MatchGame WHERE status = 'finished'")
        elif report_type == 'betsPerPlayer':
            cursor.execute("""
                SELECT player_id, COUNT(*) AS total_bets 
                FROM Bet 
                GROUP BY player_id
            """)
        elif report_type == 'playersBySport':
            cursor.execute("""
                SELECT DISTINCT p.player_id, s.sport_name
                FROM Bet b
                JOIN MatchGame m ON b.match_id = m.match_id
                JOIN Team t ON m.team_1 = t.team_id
                JOIN Sport s ON t.sport_id = s.sport_id
                JOIN Player p ON b.player_id = p.player_id
            """)
        else:
            return jsonify({'error': 'Unknown report type'}), 400

        columns = [col[0] for col in cursor.description]
        rows = cursor.fetchall()

        result = [dict(zip(columns, row)) for row in rows]
        return jsonify(result)

    except Exception as e:
        print(f"Error in report {report_type}: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/player_profile/<string:username>', methods=['GET'])
def player_profile(username):
    try:
        cursor = connection.cursor()

        # Fetch player info by username (not ID anymore)
        cursor.execute("""
            SELECT player_id, username, fname, lname, email, balance, date_joined 
            FROM Player 
            WHERE username = :uname
        """, uname=username)
        player_row = cursor.fetchone()

        if not player_row:
            return jsonify({'error': 'Player not found'}), 404

        player_columns = [col[0].lower() for col in cursor.description]
        player_data = dict(zip(player_columns, player_row))

        player_id = player_data['player_id']

        # Fetch player bets by player_id
        cursor.execute("""
            SELECT bet_id, match_id, bet_amount, odds_id 
            FROM Bet 
            WHERE player_id = :pid
            ORDER BY bet_id
        """, pid=player_id)
        bet_columns = [col[0].lower() for col in cursor.description]
        bet_rows = cursor.fetchall()
        bets = [dict(zip(bet_columns, row)) for row in bet_rows]

        return jsonify({'player': player_data, 'bets': bets})

    except Exception as e:
        print(f"Error in player_profile: {e}")
        return jsonify({'error': str(e)}), 500


if __name__ == "__main__":
    app.run(debug=True)
