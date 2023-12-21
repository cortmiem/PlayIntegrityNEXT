# Play integrity fix

# Download from 
https://github.com/daboynb/PlayIntegrityNEXT/releases/tag/Release

# Why this fork?
It downloads the fp from https://github.com/daboynb/autojson

# Instructions

1) Download the zip
2) Download the apk
3) Install the apk and grant root permissions
4) Flash the zip and reboot

When the FP will be banned, you will only need to open the app and then check for Play Integrity Attestation. The module will download the new PIF.json. 

# ATTENTION
Sometimes, you may need to double-check for Play Integrity Attestation if the new PIF.json was just downloaded.
It can happen if you use apps like Yasnac. Currently, I have not encountered this bug using the Google Play developer check.

# Demonstration

https://github.com/daboynb/PlayIntegrityNEXT/assets/106079917/2f5b8376-aa3e-4be1-91d7-5f003ac72499


# What does the APK do

    [ -e /data/adb/pif.json ] && (echo "rm"; rm /data/adb/pif.json) || echo "no"

    sleep 04 && if pgrep -f com.google.android.gms > /dev/null; then pkill -f com.google.android.gms; else echo "Process is not running."; fi && if pgrep -f com.google.android.gms.unstable > /dev/null; then pkill -f com.google.android.gms.unstable; else echo "Process is not running."; fi
