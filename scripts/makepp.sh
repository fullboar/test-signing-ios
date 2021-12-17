#!/bin/bash

echo ">> Build Provisioning Profile... 🤞"

mkdir -p ~/MobileDevice/Provisioning\ Profiles

echo ${PROVISIONING_PROFILE} | base64 -d > ~/MobileDevice/Provisioning\ Profiles/${PROFILE_ID}.mobileprovision

ls -lah ~/MobileDevice/Provisioning\ Profiles

echo ">> Build Keychain Finished. 🤗"

exit 
