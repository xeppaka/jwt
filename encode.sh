#!/usr/bin/env bash
HEADER=$(openssl base64 -e -A -in header.json | sed s/\+/-/ | sed -E s/=+$//)
PAYLOAD=$(openssl base64 -e -A -in payload.json | sed s/\+/-/ | sed -E s/=+$//)
echo "base64 encoded header: '$HEADER'"
echo "base64 encoded payload: '$PAYLOAD'"
STRING2ENCODE="$HEADER.$PAYLOAD"
SIGNATURE=$(echo -n $STRING2ENCODE | openssl dgst -sha256 -sign jwtRS256.key | openssl base64 -e -A | sed s/\+/-/ | sed -E s/=+$//)
echo "base64 encoded signature: '$SIGNATURE'"
JWT="$STRING2ENCODE.$SIGNATURE"
echo "JWT: '$JWT'"

