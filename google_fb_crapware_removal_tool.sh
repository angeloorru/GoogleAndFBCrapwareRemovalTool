#!/bin/bash

# List of system apps to remove/disable
# It's possible that names can be different.
# For instance com.facebook can be named com.meta etc...
# In this case you need to use an app called Application Inspector to
# identify the correct name of the app you want to remove and add it to the list below.
# From the list below, you can remove the apps that you want to keep and remove only those that you want

appsToRemove=(
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
    echo 'What do you want to do?'
    echo 'Uninstall the crapware? [Enter 1]'
    echo 'Disable the crapware? [Enter 2]'
    echo
    read -p "Enter your option: " option

    if [ "$option" == 1 ] ; then
        echo 'Option 1 selected'
        echo 'Proceeding to uninstall the crapware...'

        for val in ${appsToRemove[@]}; do
            sleep 1
            echo
            echo "Attempting to remove the package $val"
            "$(adb shell pm uninstall -k --user 0 $val)"
            echo
            sleep 1
        done
        echo
        echo '*********************'
        echo 'Congratulations!! All crapware is removed!!'
        echo '*********************'

    elif [ "$option" == 2 ]; then
        echo 'Option 2 selected'
        echo 'Proceeding to disable the crapware...'

        for val in ${appsToRemove[@]}; do
            sleep 1
            echo
            echo "Attempting to disable the package $val"
            "$(adb shell pm disable-user --user 0 $val)"
            echo
            sleep 1
        done

        echo
        echo '***********************************************'
        echo 'Congratulations!! All crapware is disabled!!'
        echo '***********************************************'
    else
        echo "Don't be silly :-)"
        exit 1
    fi
else
    echo
    echo
    echo '*************************************************************************'
    echo 'No device attached or USB debugging not authorised'
    echo 'Connect your device to your computer and authorise USB debugging'
    echo '*************************************************************************'

fi



