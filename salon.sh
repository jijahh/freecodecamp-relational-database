#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
AVAILABLE_SERVICES=$($PSQL "select * from services order by service_id")
echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
do
  echo "$SERVICE_ID) $SERVICE_NAME"
done
read SERVICE_ID_SELECTED
SERVICE_ID_CHOICE=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
if [[ -z $SERVICE_ID_CHOICE ]]
then
  echo -e "\nI could not find that service. What would you like today?"
  echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
fi
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  insert_customer_result=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
fi
customer_id=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
read SERVICE_TIME
insert_appointment_result=$($PSQL "insert into appointments(customer_id,service_id,time) values($customer_id,$SERVICE_ID_CHOICE,'$SERVICE_TIME')")
echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
