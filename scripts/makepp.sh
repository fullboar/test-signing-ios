#!/bin/sh
set -euxo pipefail

PP_DIR=~/Library/MobileDevice/Provisioning\ Profiles

echo ">> Build Provisioning Profile... 🤞"
echo ">> Provisioning Profile Home = ${PP_DIR}"

UUID=$(/usr/libexec/plistbuddy -c Print:UUID /dev/stdin <<< `echo "${PROVISIONING_PROFILE}" | base64 -d | security cms -D`)

echo "${PROVISIONING_PROFILE}" | base64 -d >${UUID}.mobileprovision

#install profiles, will trigger xcode to install the profile
open "${UUID}.mobileprovision"

# wait for xcode to process the request
sleep 10

# shut down xcode (optional)
kill -TERM $(ps aux | grep 'Xcode' | awk '{print $2}')

ls -lah "${PP_DIR}"

# UUID=$(/usr/libexec/plistbuddy -c Print:UUID /dev/stdin <<< `echo "${PROVISIONING_PROFILE}" | base64 -d | security cms -D`)
# echo "${PROVISIONING_PROFILE}" | base64 -d >${UUID}.mobileprovision
# md5 "${UUID}.mobileprovision"
# mkdir -p "${PP_DIR}"
# cp ${UUID}.mobileprovision "${PP_DIR}/"

echo ">> Build Provisioning Profile. 🤗"

exit 
