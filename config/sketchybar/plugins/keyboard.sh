#!/bin/bash

LAYOUT="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep 'KeyboardLayout Name' | cut -c 34- | rev | cut -c 4- | rev)"

# specify short layouts individually.
case "$LAYOUT" in
    "U.S") SHORT_LAYOUT="US";;
    "Swedish - Pr") SHORT_LAYOUT="SE";;
    *) SHORT_LAYOUT="한";;
esac

sketchybar --set keyboard label="$SHORT_LAYOUT"
