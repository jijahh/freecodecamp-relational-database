#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -n Enter your username:
read USERNAME

USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_INSERT=$($PSQL "insert into users(name) values ('$USERNAME')")
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
else 
  echo $USER_ID
  NUMBER_OF_GAMES=$($PSQL "select count(*) from games where user_id=$USER_ID")
  BEST_GAME=$($PSQL "select min(score) from games where user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_GAME guesses."
fi

NUMBER_TO_GUESS=$(( $RANDOM % 1000 ))
echo $NUMBER_TO_GUESS
echo "Guess the secret number between 1 and 1000:"
read GUESS
SCORE=1
while (( $GUESS != $NUMBER_TO_GUESS))
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
  elif (( $GUESS < $NUMBER_TO_GUESS ))
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
  read GUESS
  ((SCORE+=1))
done

echo "You guessed it in $SCORE tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
INSERT_GAME_RESULT=$($PSQL "insert into games(user_id,score) values ($USER_ID, $SCORE)")