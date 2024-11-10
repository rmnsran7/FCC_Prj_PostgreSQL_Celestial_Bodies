#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Total number of goals in all games from winning teams:
echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

# Total number of goals in all games from both teams combined:
echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"

# Average number of goals in all games from the winning teams:
echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

# Average number of goals in all games from the winning teams rounded to two decimal places:
echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

# Average number of goals in all games from both teams:
echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

# Most goals scored in a single game by one team:
echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games")"

# Number of games where the winning team scored more than two goals:
echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

# Winner of the 2018 tournament team name:
echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams t JOIN games g ON t.team_id = g.winner_id WHERE g.year = 2018 AND g.round = 'Final'")"

# List of teams who played in the 2014 'Eighth-Final' round:
echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT t.name FROM games g LEFT JOIN teams t ON t.team_id IN (g.winner_id, g.opponent_id) WHERE g.year = 2014 AND g.round = 'Eighth-Final' ORDER BY t.name")"

# List of unique winning team names in the whole data set:
echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT name FROM teams t JOIN games g ON t.team_id = g.winner_id ORDER BY name")"

# Year and team name of all the champions:
echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT g.year, t.name FROM games g JOIN teams t ON g.winner_id = t.team_id WHERE round = 'Final' ORDER BY g.year")"

# List of teams that start with 'Co':
echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%' ORDER BY name")"