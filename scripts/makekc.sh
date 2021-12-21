#!/bin/sh
set -eo pipefail

CERT_PATH=$RUNNER_TEMP/certificates.p12
# KEYCHAIN_PATH=$RUNNER_TEMP/cicd.keychain-db

echo ">> Build Keychain Starting... 🤞"

echo ">> Extracting Artifats"
echo -n "${CERTIFICATE}" | base64 --decode --output "${CERT_PATH}"
md5 "$CERT_PATH"

echo ">> Create Keychain $KC_NAME"
/usr/bin/security create-keychain -p $1 $KC_NAME
/usr/bin/security default-keychain -s $KC_NAME
/usr/bin/security unlock-keychain -p $1 $KC_NAME
/usr/bin/security list-keychains -d user -s $KC_NAME

# # create temporary keychain
# security create-keychain -p "$1" $KEYCHAIN_PATH
# security set-keychain-settings -lut 21600 $KEYCHAIN_PATH
# security unlock-keychain -p "$1" $KEYCHAIN_PATH

echo ">> Importing Certificate"
/usr/bin/security import $CERT_PATH -k $KC_NAME -P $1 -T /usr/bin/codesign -T /usr/bin/security
/usr/bin/security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k $1 $KC_NAME
/usr/bin/security set-keychain-settings $KC_NAME

# # import certificate to keychain
# security import $CERT_PATH -P "$1" -A -t cert -f pkcs12 -k $KEYCHAIN_PATH
# security list-keychain -d user -s $KEYCHAIN_PATH

echo ">> Importing AppleWWDRCAG3"
# echo ${APPLEWWDRCAG3_CERT} | base64 -d > AppleWWDRCAG3.cer.der
# /usr/bin/security import AppleWWDRCAG3.cer.der -k $KC_NAME -P $1


echo ">> Build Keychain Finished. 🤗"

exit 0
