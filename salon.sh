#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# INSERT=$($PSQL "INSERT INTO services(name) VALUES('Haircut')")

MAIN_MENU(){

  # Checking Inputs
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #Intro
  echo -e "\n\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n"

  #All Services
  ALL_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  
  #echo -e "${YELLOW}ID) Service Name${NC}"
  echo "$ALL_SERVICES" | while IFS='|' read -r SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  START_SERVICE
}

START_SERVICE() {
  #Service Input
  #echo -e "\nPlease Enter the ID of the Service:"
  read SERVICE_ID_SELECTED

  # Checking If INPUT_SERVICE_ID is number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    #Redirecting to Main Menu as Input is not number
    MAIN_MENU "Invalid Input. Please Try Again."
  else
    SERVICE_EXIST=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    #Service Does not Exist
    if [[ ! $SERVICE_EXIST ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      USER_EXIST=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      
      # if user does no exist
      if [[ -z $USER_EXIST ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        INSERT_USER_DATA=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      USER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your $SERVICE_EXIST, $CUSTOMER_NAME?"  
      read SERVICE_TIME

      BOOK_APPOINTMENT $SERVICE_ID_SELECTED $USER_ID "$CUSTOMER_NAME" "$SERVICE_TIME" "$SERVICE_EXIST"
    fi
  fi
}

BOOK_APPOINTMENT() {
  SERVICE_ID=$1
  CUSTOMER_ID=$2
  USER_NAME=$3
  SERVICE_TIME=$4
  SERVICE_EXIST=$5

  INSERT_APPOINTMENT_DATA=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID, $CUSTOMER_ID, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_EXIST at $SERVICE_TIME, $USER_NAME."
}

MAIN_MENU
