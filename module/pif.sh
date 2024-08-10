#!/system/bin/sh
TARGET_FILE="/data/adb/pif.json"
TEMP_FILE="/data/adb/pif.json.tmp"
URL="https://prox.planetarian.dev/https://raw.githubusercontent.com/cortmiem/autojson/main/pif.json"
LOG_FILE="/data/adb/pif.log"

log_date() {
    echo "$(date '+%Y-%m-%d %H:%M:%S')"
}

echo "$(log_date) - Ready." > "$LOG_FILE"
/data/adb/modules/playintegrityfix/curl --max-time 30 --retry 5 --retry-delay 5 -o "$TEMP_FILE" "$URL"
if [ -s "$TEMP_FILE" ]; then
    echo "$(log_date) - Downloaded file." >> "$LOG_FILE"
    if [ -f "$TARGET_FILE" ]; then
        echo "$(log_date) - Existing file found." >> "$LOG_FILE"
        cmp "$TEMP_FILE" "$TARGET_FILE" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            mv "$TEMP_FILE" "$TARGET_FILE"
            echo "$(log_date) - File updated." >> "$LOG_FILE"
        else
            rm "$TEMP_FILE"
            echo "$(log_date) - No changes detected." >> "$LOG_FILE"
        fi
    else
        mv "$TEMP_FILE" "$TARGET_FILE"
        echo "$(log_date) - File created." >> "$LOG_FILE"
    fi
else
    rm "$TEMP_FILE"
    echo "$(log_date) - Failed." >> "$LOG_FILE"
fi
