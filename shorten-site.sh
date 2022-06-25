#! /bin/bash

ITEMS=$(ls ./content/post)
API_KEY=$(aws secretsmanager get-secret-value --secret-id linkr-api-key | jq ".SecretString | fromjson | .key" -r)

for ITEM in $ITEMS
do
    URL="https://www.thesheps.dev/post/${ITEM::-3}"
    SHORT_CODE=$(curl -H "x-api-key: $API_KEY" -d "{ \"longUrl\": \"$URL\" }" https://api.sheps.link/entries | jq .shortUrl -r)
    SHORT_URL="https://sheps.link$SHORT_CODE"
    awk "NR==2{print \"shortUrl: $SHORT_URL\"}1" "./content/post/$ITEM" | sponge "./content/post/$ITEM"
done