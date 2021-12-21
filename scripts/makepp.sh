#!/bin/sh
set -eo pipefail

PP_DIR="~/Library/MobileDevice/Provisioning\ Profiles"

echo ">> Build Provisioning Profile... 🤞"
echo ">> Provisioning Profile Home = ${PP_DIR}"

mkdir -p "${PP_DIR}"

echo -n "${PROVISIONING_PROFILE}" | base64 --decode --output "${PP_DIR}/${PROFILE_ID}.mobileprovision"

ls -lah "${PP_DIR}"
md5 "${PP_DIR}/${PROFILE_ID}.mobileprovision"

echo ">> Build Keychain Finished. 🤗"

exit 
