#!/bin/bash

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

query=$1
if [[ $query =~ ^[0-9]+$ ]]
then
  atomic_number=$query
  atomic_number=$($PSQL "select atomic_number from elements where atomic_number='$query'")
  if [[ -z $atomic_number ]]
  then
    echo "I could not find that element in the database."
    exit 
  fi
else
  atomic_number=$($PSQL "select atomic_number from elements where name='$query'")
  if [[ -z $atomic_number ]]
  then
    atomic_number=$($PSQL "select atomic_number from elements where symbol='$query'")
    if [[ -z $atomic_number ]]
    then
      echo "I could not find that element in the database."
      exit 
    fi
  fi
fi
IFS="|" read symbol name <<< "$($PSQL "select symbol, name from elements where atomic_number = $atomic_number")"
IFS="|" read atomic_mass melting_point boiling_point type_id<<< "$($PSQL "select atomic_mass, melting_point_celsius, boiling_point_celsius, type_id from properties where atomic_number = $atomic_number")"
type=$($PSQL "select type from types where type_id = $type_id")
echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."