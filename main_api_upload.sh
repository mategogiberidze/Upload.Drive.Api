#!/bin/bash

### Enter Client ID & Secret
read -p "Please enter client_id: " CLIENT_ID
read -p "Please enter client_secret: " CLIENT_SECRET

### Save Client ID & Secret
echo $CLIENT_ID > /tmp/client_id.txt
echo $CLIENT_SECRET > /tmp/client_secret.txt

SCOPE=https://www.googleapis.com/auth/drive.file

VERIFY_DEVICE=`curl -d "client_id="$CLIENT_ID"&scope=$SCOPE" https://accounts.google.com/o/oauth2/device/code`
#echo $VERIFY_DEVICE

###Create variables
DEVICE_CODE=`echo $VERIFY_DEVICE | jq -r ".device_code"`
USER_CODE=`echo $VERIFY_DEVICE | jq -r ".user_code"`
echo -e "\nuser_code: $USER_CODE"
#echo -e "device_code: $DEVICE_CODE \n"

read -p "please enter user code to  https://www.google.com/device and press any button to continue"
read -p "Did you authorized? yes/no :" input

if [ $input == "yes" ]; then
	echo Next step is to get access_token
elif [ $input == "no" ]; then
	echo Try again to run script
else
	exit 10
fi

BEARER=`curl -d "client_id="$CLIENT_ID"&client_secret="$CLIENT_SECRET"&grant_type=http://oauth.net/grant_type/device/1.0&code="$DEVICE_CODE"" https://www.googleapis.com/oauth2/v4/token`
#echo -e "\n $BEARER \n"


REFRESH_TOKEN=`echo $BEARER | jq -r ".refresh_token"`
ACCESS_TOKEN=`echo $BEARER | jq -r ".access_token"` 
echo -e "\n access_token: $ACCESS_TOKEN"

### Save Access Token
echo $ACCESS_TOKEN > /tmp/token.txt
### Save Refresh Token
echo $REFRESH_TOKEN > /tmp/refreshh_token.txt


