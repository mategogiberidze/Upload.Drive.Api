#!/bin/bash

### Script to refresh token
 
REFRESH_TOKEN=`cat /tmp/refresh_token.txt`
CLIENT_ID=`cat /tmp/client_id.txt`
CLIENT_SECRET=`cat /tmp/client_secret.txt`

REFRESH=`curl -X POST -d 'client_id='"$CLIENT_ID"'&client_secret='"$CLIENT_SECRET"'&refresh_token='"$REFRESH_TOKEN"'&grant_type=refresh_token' https://accounts.google.com/o/oauth2/token`
echo $REFRESH


ACCESS_TOKEN=`echo $REFRESH | jq -r ".access_token"`
echo $ACCESS_TOKEN > /tmp/token.txt
echo $REFRESH_TOKEN > /tmp/refresh_token.txt
echo $CLIENT_ID > /tmp/client_id.txt
echo $CLIENT_SECRET > /tmp/client_secret.txt
