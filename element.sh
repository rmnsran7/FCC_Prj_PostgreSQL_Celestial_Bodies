#!/bin/bash

#PSQL Connect
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Func to get elements details by atomic number
get_element_by_atomic_number() {
  local ATOMIC_NUMBER=$1
  local RESULT=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type 
    FROM elements INNER JOIN properties USING(atomic_number)
    INNER JOIN types USING(type_id)
    WHERE atomic_number = $ATOMIC_NUMBER")
    echo $RESULT
}

# Func to get elements details by symbol
get_element_by_symbol() {
  local SYMBOL=$1
  local RESULT=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type 
    FROM elements INNER JOIN properties USING(atomic_number)
    INNER JOIN types USING(type_id)
    WHERE symbol = '$SYMBOL'")
    echo $RESULT
}

# Func to get elements details by name
get_element_by_name() {
  local NAME=$1
  local RESULT=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type 
    FROM elements INNER JOIN properties USING(atomic_number)
    INNER JOIN types USING(type_id)
    WHERE name = '$NAME'")
    echo $RESULT
}

# Function to Print Results
print_details() {

  # If no row returned
  if [[ -z $1 ]]
  then
    return 1
  fi

  # Read the result into variables
  echo "$1" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL MASS MELTING BOILING TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
  return 0
}

# Checking for arguments
if [[ $1 ]]
then
  # Finding details related to argument
  
  # Try to get element information using each method
  ELEMENT=""

  # If argument is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$(get_element_by_atomic_number $1)
  
  # If input is 1 or 2 chars long, then get details by symbol
  elif [[ ${#1} -le 2 ]]
  then
    ELEMENT=$(get_element_by_symbol $1)
  
  # Otherwise get details by Element Name
  else
    ELEMENT=$(get_element_by_name $1)
  fi

  # Print element info or error message
  if ! print_details "$ELEMENT"
  then
    echo "I could not find that element in the database."
  fi

# When no arguments
else
  echo "Please provide an element as an argument."
fi
