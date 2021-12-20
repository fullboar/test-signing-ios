#!/bin/bash

KC_NAME=cicd.keychain
# KC_NAME=login.keychain
CERT_PATH=certificates.p12

echo ">> Build Keychain Starting... 🤞"

echo ">> Extracting Artifats"
echo ${CERTIFICATE} | base64 -d > $CERT_PATH

echo ">> Create Keychain $KC_NAME"
/usr/bin/security create-keychain -p $1 $KC_NAME
/usr/bin/security default-keychain -s $KC_NAME
/usr/bin/security unlock-keychain -p $1 $KC_NAME
/usr/bin/security list-keychains -d user -s $KC_NAME

echo ">> Importing Certificate"
/usr/bin/security import $CERT_PATH -k $KC_NAME -P $1 -T /usr/bin/codesign
/usr/bin/security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k $1 $KC_NAME
/usr/bin/security set-keychain-settings $KC_NAME

echo ">> Importing AppleWWDRCAG3"
echo ${APPLEWWDRCAG3_CERT} | base64 -d > AppleWWDRCAG3.cer.der
/usr/bin/security import AppleWWDRCAG3.cer.der -k $KC_NAME -P $1


echo ">> Build Keychain Finished. 🤗"

exit 0
