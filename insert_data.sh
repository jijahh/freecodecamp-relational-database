#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

tail -n +2 "games.csv" | while IFS=',' read -r year round winner opponent winnergoals opponentgoals;
do
  winnerid=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
  if [[ -z $winnerid ]]
  then
    INSERTED_INTO_TEAMS_RESULT=$($PSQL "INSERT INTO teams (name) values ('$winner');")
    winnerid=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
  fi
  opponentid=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
  if [[ -z $opponentid ]]
  then
    INSERTED_INTO_TEAMS_RESULT=$($PSQL "INSERT INTO teams (name) values ('$opponent');")
    opponentid=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
  fi
  insertgame=$($PSQL "INSERT INTO games (year,winner_id,opponent_id,winner_goals,opponent_goals, round) VALUES ($year, $winnerid, $opponentid, $winnergoals, $opponentgoals, '$round');")
done 