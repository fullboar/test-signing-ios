#!/bin/bash


PP_DIR="${HOME}/Library/MobileDevice/Provisioning\ Profiles"

echo ">> Build Provisioning Profile... 🤞"
echo ">> PP Home = ${PP_DIR}"

ls -lah ${PP_DIR}
ls -lah ~/

mkdir -p ${PP_DIR}

echo ${PROVISIONING_PROFILE} | base64 -d > ${PP_DIR}/${PROFILE_ID}.mobileprovision

ls -lah ${PP_DIR}

echo ">> Build Keychain Finished. 🤗"

exit 
