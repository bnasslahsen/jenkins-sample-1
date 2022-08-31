#!/bin/bash



CONJUR_SESSION_TOKEN=$(curl -k --location --request POST "${CONJUR_HOST}/authn/devsecops/admin/authenticate" --header "Content-Type: application/json" --header "Accept-Encoding: base64" --data-raw "${CONJUR_API_KEY}" | head -n 1| cut -d $' ' -f2

CONJUR_SECRET= curl -k --location --request GET "${CONJUR_HOST}/secrets/devsecops/variable/ci/jenkins/secrets/github_private_key" --header 'Authorization: Token token="$CONJUR_SESSION_TOKEN"'

echo $CONJUR_SECRET
