#!/bin/bash
#
# Script Purpose:#     - Authenticate to Conjur/Conjur REST API#    - Retrieve a secret value
#

# Global Variables
conjur_url=${CONJUR_URL}
conjur_pass=${CONJUR_API_KEY}
conjur_account=${CONJUR_ACCOUNT}
conjur_host=${CONJUR_HOST}
secret_id=${SECRET_ID}

echo $DEBUG
if "$DEBUG" ; then
 echo "Value: $conjur_url" | sed 's/./& /g'
 echo "Value: $conjur_pass" | sed 's/./& /g'
 echo "Value: $conjur_account" | sed 's/./& /g'
 echo "Value: $conjur_host" | sed 's/./& /g'
 echo "Value: $secret_id" | sed 's/./& /g'
fi

# Authenticate against conjur, get a temporary token
token=$(curl -k -s --header "Accept-Encoding: base64" --data "$conjur_pass" "$conjur_url"/authn/"$conjur_account"/"$conjur_host"/authenticate)

# Connect to the Conjur/Conjur REST API to retrieve secret value"
secret_value=$(curl -k -s --header "Authorization: Token token=\"$token\"" "$conjur_url/secrets/$conjur_account/variable/$secret_id")

echo " "
echo "---- Retrieving Secret Value -----------"
echo "ID: $secret_id"
echo "Value: $secret_value"
echo "----------------------------------------"
echo " "
