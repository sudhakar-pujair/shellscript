#!/bin/bash

#Variable Declaration For Pokemon URL
URL='https://pokeapi.co/api/v2/pokemon?limit=100000'

#Access Content Using CURL
curl -sL ${URL}

#Installing JQ for JSON Parsing
apt update && apt install -y jq

#Parsing with JQ
curl -sL ${URL} | jq ".results[]"
curl -sL ${URL} | jq ".results[].name" -r

#Assign Output To Variable
ALL_POKEMON=$(curl -sL ${URL} | jq ".results[].name" -r)

#Running A For Loop To Print Pokemon One By One
for POKEMON in ${ALL_POKEMON}
do
echo "The Name Of The Pokemon Is ${POKEMON}."
echo '--------------------------------------'
done
#End of Script
