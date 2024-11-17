#!/bin/bash

# DB Connection
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Random Number
RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

# CHECK USER FUNCTION
check_user() {
  local USER_NAME=$1

  # CHECKING IF USER EXISTS
  USER_EXIST=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME'")
  echo $USER_EXIST
}

# CREATE NEW USER
create_user() {
  local NEW_USER_NAME=$1
  # Insert the new user into the database
  local INSERT_NEW_USER=$($PSQL "INSERT INTO users(user_name) VALUES('$NEW_USER_NAME');")
  # Get ID using currval of the sequence
  local USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$NEW_USER_NAME';")
  echo "$USER_ID"
}

# GET USER DETAILS
get_user_details() {
  local USER_NAME=$1
  local USER_DATA=$($PSQL "SELECT u.user_id, u.user_name, MIN(g.total_guess), COUNT(*)
  FROM users u
  INNER JOIN
  games g
  ON u.user_id = g.user_id
  WHERE
  g.guessed = true AND u.user_name = '$USER_NAME'
  GROUP BY
  u.user_id, u.user_name")

  echo "$USER_DATA"
}

# PLAY GAME FUNCTION
play_game() {
  local USER_ID=$1
  local TRIES=0
  
  # INSERT GAME ROW INTO games TABLE
  local INSERT_DATA=$($PSQL "INSERT INTO games(random_number, total_guess, user_id)
  VALUES($RANDOM_NUMBER, 0, $USER_ID);")
  local INSERT_AND_GET_ID=$($PSQL "SELECT game_id FROM games WHERE user_id=$USER_ID ORDER BY game_id DESC LIMIT 1;")

  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS
  ((TRIES++))

  while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read USER_GUESS
    ((TRIES++))
  done

  while [[ $USER_GUESS -ne $RANDOM_NUMBER ]]
  do
    if [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
    read USER_GUESS
    ((TRIES++))
  done

  # USER WON. UPDATING ROW AND PRINTING DATA
  UPDATE_GAME=$($PSQL "UPDATE games SET total_guess=$TRIES, guessed=true WHERE game_id=$INSERT_AND_GET_ID;")
  echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
}

# MAIN USER INTERFACE
echo "Enter your username:"
read USER_NAME

# IF USER DOES NOT EXIST
if [[ -z $(check_user $USER_NAME) ]]
then
  USER_ID=$(create_user $USER_NAME)
  echo "Welcome, $USER_NAME! It looks like this is your first time here."

# IF USER EXISTS
else
  USER_DETAILS=$(get_user_details $USER_NAME)
  IFS="|" read -r USER_ID USER_NAME MIN_GUESS TOTAL_GAMES <<< "$USER_DETAILS"
  echo "Welcome back, $USER_NAME! You have played $TOTAL_GAMES games, and your best game took $MIN_GUESS guesses."
fi

# STARTING GAME
play_game $USER_ID