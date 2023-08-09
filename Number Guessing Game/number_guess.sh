#!/bin/bash

# Set the PSQL variable to the command for running Postgres with appropriate options
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt player for username
echo -e "\nEnter your username:"
read USERNAME

# Get username data from the 'users' table
USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

# Check if player is not found
if [[ -z $USERNAME_RESULT ]]; then
    # Greet player and add player to the 'players' table
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
    INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
else
    # If the username exists, get the number of games played and the best game from the 'games' table
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN users USING(user_id) WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games LEFT JOIN users USING(user_id) WHERE username='$USERNAME'")

    # Print a welcome back message with the username and statistics
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Variable to store the number of guesses/tries
GUESS_COUNT=0

# Prompt the first guess
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

# Loop to prompt the user to guess until correct
while [[ $USER_GUESS -ne $SECRET_NUMBER ]]; do
    # Check if the user input is not an integer
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]; then
        echo -e "\nThat is not an integer, guess again:"
    else
        # Check if the user's guess is higher or lower than the secret number
        if [[ $USER_GUESS -gt $SECRET_NUMBER ]]; then
            echo "It's lower than that, guess again:"
        else
            echo "It's higher than that, guess again:"
        fi

        # Increment the number of guesses
        ((GUESS_COUNT++))
    fi

    read USER_GUESS
done

# Loop ends when the guess is correct, so update the guess count
((GUESS_COUNT++))

# Get user id
USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# Add the result to the 'games' table for game history
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, guesses) VALUES ($USER_ID_RESULT, $SECRET_NUMBER, $GUESS_COUNT)")

# Winning message
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"