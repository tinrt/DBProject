async function getBalance() {
    const playerId = document.getElementById('playerIdBalance').value;
    const res = await fetch('/get_balance', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({player_id: playerId})
    });
    const data = await res.json();
    document.getElementById('balanceResult').innerText = data.balance ? `Balance: $${data.balance}` : 'Player not found!';
  }
  
  async function addPlayer() {
    const username = document.getElementById('playerUsername').value;
    const password = document.getElementById('playerPassword').value;
    const fname = document.getElementById('playerFirstName').value;
    const lname = document.getElementById('playerLastName').value;
    const email = document.getElementById('playerEmail').value;
    const dob = document.getElementById('playerDOB').value;
    const balance = document.getElementById('playerBalance').value;
  
    const res = await fetch('/add_player', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({ username, password, fname, lname, email, dob, balance })
    });
  
    const data = await res.json();
    alert(data.message || data.error);
  }
  
  async function placeBet() {
    const player_id = document.getElementById('betPlayerId').value;
    const match_id = document.getElementById('matchSelect').value;
    const amount = document.getElementById('betAmount').value;
    const odds = document.getElementById('betOdds').value;
  
    await fetch('/place_bet', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({player_id, match_id, amount, odds})
    });
  
    alert('Bet placed!');
  }
  

  async function runReport(reportType) {
    try {
      const res = await fetch(`/report/${reportType}`);
      const data = await res.json();
  
      const reportHeader = document.getElementById('reportHeader');
      const reportBody = document.getElementById('reportBody');
  
      reportHeader.innerHTML = '';
      reportBody.innerHTML = '';
  
      if (data.length > 0) {
        
        const headers = Object.keys(data[0]);
        reportHeader.innerHTML = '<tr>' + headers.map(h => `<th>${h}</th>`).join('') + '</tr>';
  
        
        data.forEach(row => {
          reportBody.innerHTML += '<tr>' + headers.map(h => `<td>${row[h]}</td>`).join('') + '</tr>';
        });
      } else {
        reportHeader.innerHTML = '';
        reportBody.innerHTML = '<tr><td colspan="5" class="text-center">No data available</td></tr>';
      }
    } catch (error) {
      console.error('Error running report:', error);
    }
  }


  async function getPlayerProfile() {
    const username = document.getElementById('profilePlayerUsername').value;
  
    if (!username) {
      alert('Please enter a username');
      return;
    }
  
    try {
      const res = await fetch(`/player_profile/${username}`);
      const data = await res.json();
  
      const playerInfoDiv = document.getElementById('playerInfo');
      const betsHeader = document.getElementById('betsHeader');
      const betsBody = document.getElementById('betsBody');
  
      playerInfoDiv.innerHTML = '';
      betsHeader.innerHTML = '';
      betsBody.innerHTML = '';
  
      if (data.error) {
        playerInfoDiv.innerHTML = `<div class="alert alert-danger">${data.error}</div>`;
        return;
      }
  
      
      const player = data.player;
      playerInfoDiv.innerHTML = `
        <div class="card p-3">
          <strong>Username:</strong> ${player.username} <br/>
          <strong>Name:</strong> ${player.fname} ${player.lname} <br/>
          <strong>Email:</strong> ${player.email} <br/>
          <strong>Balance:</strong> $${player.balance} <br/>
          <strong>Date Joined:</strong> ${player.date_joined}
        </div>`;
  
      
      if (data.bets.length > 0) {
        const headers = Object.keys(data.bets[0]);
        betsHeader.innerHTML = '<tr>' + headers.map(h => `<th>${h}</th>`).join('') + '</tr>';
        data.bets.forEach(bet => {
          betsBody.innerHTML += '<tr>' + headers.map(h => `<td>${bet[h]}</td>`).join('') + '</tr>';
        });
      } else {
        betsBody.innerHTML = '<tr><td colspan="5" class="text-center">No bets placed yet</td></tr>';
      }
    } catch (error) {
      console.error('Error fetching player profile:', error);
    }
  }
  
  
  
  async function loadGames() {
    try {
      const res = await fetch('/get_games');
      const games = await res.json();
      const gamesTable = document.getElementById('gamesTableBody');
      const matchSelect = document.getElementById('matchSelect');
  
      gamesTable.innerHTML = '';
      matchSelect.innerHTML = '';
  
      games.forEach(game => {
        gamesTable.innerHTML += `
          <tr>
            <td>${game.match_id}</td>
            <td>${game.teams}</td>
            <td>${game.status}</td>
            <td>Coming Soon</td> <!-- Placeholder for odds -->
          </tr>`;
        
        matchSelect.innerHTML += `<option value="${game.match_id}">${game.teams}</option>`;
      });
    } catch (error) {
      console.error('Error loading games:', error);
    }
  }
  
  
  
  document.addEventListener('DOMContentLoaded', loadGames);
  