#!/bin/bash

# Re enable previously disabled apps using this tool
# Note that if apps have been completely removed,
# the only option for you is to reset your phone to factory settings

appsToReEnable=(
"com.facebook.system"
"com.facebook.appmanager"
"com.facebook.services"
"com.google.android.apps.nbu.files"
"com.google.android.apps.magazine"
"com.google.android.videos"
"com.google.android.apps.photos"
"com.google.android.apps.youtube.music"
"com.google.android.music" )

if [ "$(adb get-state 1)" > /dev/null ]; then

    sleep 2

    echo
    echo 'Device detected'
    echo 'Proceeding to re enabling the crapware...'
    echo

    for val in ${appsToReEnable[@]}; do
        sleep 2
        echo "Attempting to re enable the package $val"
        "$(adb shell pm enable $val)"
        sleep 1
    done

    echo
    echo '*****************************************************'
    echo 'Congratulations!! All crapware has been re enabled!!'
    echo '*****************************************************'
else
    echo
    echo
    echo '*************************************************************************'
    echo 'No device attached or USB debugging not authorised'
    echo 'Connect your device to your computer and authorise USB debugging'
    echo '*************************************************************************'

fi
