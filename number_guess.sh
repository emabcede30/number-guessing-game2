#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# 2. Automatically create the tables if they don't exist yet
# (Wrapping them in IF NOT EXISTS ensures your script won't crash on future runs)
$PSQL "CREATE TABLE IF NOT EXISTS users (user_id SERIAL PRIMARY KEY, username VARCHAR(22) UNIQUE NOT NULL);"
$PSQL "CREATE TABLE IF NOT EXISTS games (game_id SERIAL PRIMARY KEY, user_id INT REFERENCES users(user_id), number_of_guesses INT NOT NULL);"

# 1. Prompt the user for their username
echo "Enter your username:"
read USERNAME

# 2. Look up the user_id based on the username entered
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# 3. Check if the user exists (is the USER_ID empty?)
if [[ -z $USER_ID ]]
then
  # --- NEW USER LOGIC ---
  # Print the exact new user welcome message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  # Insert the new user into the database so they exist for next time
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

  # 2. CRITICAL FIX: Fetch the newly created user_id so it isn't blank at the end!
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  
else
  # --- RETURNING USER LOGIC ---
  # Get total games played
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  
  # Get the minimum number of guesses (best game)
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  
  # Print the exact returning user welcome message
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# 1. Generate the random number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# 2. Track the number of guesses
GUESS_COUNT=0

# 1. Print the initial prompt
echo "Guess the secret number between 1 and 1000:"

# 2. Start the loop
while true
do
  read GUESS
  
  # Check if the input is NOT an integer
  if [[ ! $GUESS =~ ^[0-56789]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue # Skip the rest of the loop and ask for input again
  fi

  ((GUESS_COUNT++)) # Only count valid integer inputs as a try

  # Check the guess
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    # Print success message and break out of the loop
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# 3. Save the completed game data to the databasessssss

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $GUESS_COUNT)")