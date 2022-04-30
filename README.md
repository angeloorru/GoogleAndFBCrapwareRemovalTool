# GoogleAndFBCrapwareRemovalTool

### A tool written in bash that uses adb commands to remove unwanted crapware from your Android phone. **No ROOT Required!!**

<br>

## **Attention!!**

### Use this script responsibly and make sure you know what you're doing. I am not responsible for any data loss, phone malfunction or a bricked phone that you may incur if using the scripts incorrectly. Please, don't attempt to remove essential system apps and please, read the instructions below as well as the comments in the code before you start doing anything. Cheers!!

<br>

**Finally**, the script has been tested only in a Linux/Unix machine. For Win machines, please search for "how to run adb commands in Windows `PowerShell`" and modify the code accordingly.

## Pre-Requisites

- Android `adb tools` installed and globally available (https://www.lifewire.com/android-debug-bridge-adb-4149410)
- Install `App Inspector` on your Android device (https://play.google.com/store/apps/details?id=com.ubqsoft.sec01&gl=US)
- Developer options enabled on your phone (https://www.youtube.com/watch?v=CCFMai4JmeM)
- From `Developer options`, enable `USB debugging`
- Connect your phone to your computer via USB
- Enable the `Transfer files` option
- You should now see a pop up that requests to allow USB debugging. Choose yes
- To verify that your phone is connected in debuggin mode, you can type in a terminal window

```
adb devices
```

You should be able to see something that looks like this:

```
List of devices attached
AAAAA12305001234        device

```

- You are ready to run the scripts :-)

## Prepare the scripts

Before running the script, use your `App Inspector` app on your device to identify the package names of the apps you want to remove.

Once you have retrieved the names of your packages, use any text editor to edit the script file as follows:

```
appsToRemove = (
  "package name"
)

For multiple applications:

appsToRemove = (
  "package name"
  "package name"
  ...
)

Your edited file should look something like this:

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
```

These are all apps that cannot be uninstalled normally and with the latest Android OS release, they cannot also be disabled. They will run for no reason, grab data and consume precious battery life on your device.

- Save the changes you just made in your script file

**Note**: To run the script for re enabling the apps, you should also populate the `appsToReEnable` list in a similar way as showed above.

## How to run the scripts

Assuming you have downloaded the scripts in your Downloads folder:

- Open a terminal window and `cd` to your `Downloads` folder
- If you `ls`, you should see something like this:

```
ao@ao:~$ cd Downloads/
ao@ao:~/Downloads$ ls
google_fb_crapware_reenable_tool.sh  google_fb_crapware_removal_tool.sh
ao@ao:~/Downloads$
```

I've written two scripts: one to `completely remove or disable` the unwanted apps and the other one to `re enable` the apps that have been disabled.

**Note**: The script to re enable the apps will work only if the apps have been disabled and it will **not** work if the apps have been uninstalled from the device. If you want to re install the apps you've uninstalled with the script you may have to re install them manually or perform a factory reset on your device.

### Run the script to remove or disable the Apps

- From your `Downloads` directory, type in your terminal

```
bash google_fb_crapware_removal_tool.sh
```

- Now, you should be able to see the available options:

```
Device detected
What do you want to do?
Uninstall the crapware? [Enter 1]
Disable the crapware? [Enter 2]

Enter your option:
```

- Enter `1` for uninstalling the apps or `2` to just disable them
- Let the script run till it finishes
- Done

If the apps have been disabled, you should see them marked as Disabled in your app list. Settings -> Apps -> Apps Management

To run the re enabling script use the command:

```
bash google_fb_crapware_reenable_tool.sh
```

and wait till it completes

All done
