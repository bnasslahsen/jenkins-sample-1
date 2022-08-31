#!/bin/bash

echo "${CONJUR_HOST}/authn/devsecops/admin/authenticate"

curl -k --location --request POST ${CONJUR_HOST}/authn/devsecops/admin/authenticate \
--header 'Content-Type: application/json' \
--header 'Accept-Encoding: base64' \
--data-raw '${CONJUR_API_KEY}'

