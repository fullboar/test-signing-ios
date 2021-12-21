#!/bin/sh
set -euxo pipefail

PP_DIR="~/Library/MobileDevice/Provisioning\ Profiles"

echo ">> Build Provisioning Profile... 🤞"
echo ">> Provisioning Profile Home = ${PP_DIR}"

mkdir -p "${PP_DIR}"

uuid=$(/usr/libexec/plistbuddy -c Print:UUID /dev/stdin <<< `echo "${PROVISIONING_PROFILE}" | base64 -d | security cms -D`)
echo "${PROVISIONING_PROFILE}" | base64 -d >"${PP_DIR}/${uuid}.mobileprovision"
md5 "${PP_DIR}/${uuid}.mobileprovision"

echo ">> Build Provisioning Profile. 🤗"

exit 
