#!/bin/bash


PP_DIR="${HOME}/Library/MobileDevice/Provisioning\ Profiles"

echo ">> Build Provisioning Profile... 🤞"
echo ">> Provisioning Profile Home = ${PP_DIR}"

mkdir -p "${PP_DIR}"

echo ${PROVISIONING_PROFILE} | base64 -d > "${PP_DIR}/${PROFILE_ID}.mobileprovision"

ls -lah "${PP_DIR}"

echo ">> Build Keychain Finished. 🤗"

exit 
