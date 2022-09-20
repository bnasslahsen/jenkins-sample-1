#!/bin/bash
#
# Script Purpose:#     - Authenticate to Conjur/Conjur REST API#    - Retrieve a secret value
#

# Global Variables
conjur_url=${CONJUR_URL}
conjur_pass=${CONJUR_API_KEY}
conjur_account=${CONJUR_ACCOUNT}
#conjur_host=${CONJUR_HOST}
conjur_host=host%2Fci%2Fjenkins%2Fcontroller
secret_id=ci/jenkins/secrets/github_private_key

echo $conjur_url
echo $conjur_pass
echo $conjur_account
echo $conjur_host
echo $secret_id

# Prompt API KEY for Conjur host

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

