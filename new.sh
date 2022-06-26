#! /bin/bash

ARCHETYPE=$1
NAME=$2
FILENAME="./content/$ARCHETYPE/$NAME.md"
API_KEY=$(aws secretsmanager get-secret-value --secret-id linkr-api-key | jq ".SecretString | fromjson | .key" -r)
URL="https://www.thesheps.dev/$ARCHETYPE/$NAME"
SHORT_CODE=$(curl -H "x-api-key: $API_KEY" -d "{ \"longUrl\": \"$URL\" }" https://api.sheps.link/entries | jq .shortUrl -r)
SHORT_URL="https://sheps.link$SHORT_CODE"

hugo new "$ARCHETYPE/$NAME.md"
awk "NR==2{print \"shortUrl: $SHORT_URL\"}1" "$FILENAME" | sponge "$FILENAME"
