# Play integrity fix

# Download from 
https://github.com/daboynb/PlayIntegrityNEXT/releases/tag/Release

# Why this fork?
It downloads the fp from https://github.com/daboynb/autojson

# Demonstration

https://github.com/daboynb/PlayIntegrityNEXT/assets/106079917/2f5b8376-aa3e-4be1-91d7-5f003ac72499


# What does the APK do

    [ -e /data/adb/pif.json ] && (echo "rm"; rm /data/adb/pif.json) || echo "no"

    sleep 04 && if pgrep -f com.google.android.gms > /dev/null; then pkill -f com.google.android.gms; else echo "Process is not running."; fi && if pgrep -f com.google.android.gms.unstable > /dev/null; then pkill -f com.google.android.gms.unstable; else echo "Process is not running."; fi