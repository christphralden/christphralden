#!/usr/bin/env osascript

-- Get the current state of the autohide menu bar setting
tell application "System Events"
    set autohideStatus to autohide menu bar of dock preferences
end tell

-- Toggle the autohide setting
if autohideStatus is false then
    -- Enable autohide if currently disabled
    tell application "System Events"
        set autohide menu bar of dock preferences to true
    end tell
    display notification "Menu bar auto-hide enabled." with title "Menu Bar"
else
    -- Disable autohide if currently enabled
    tell application "System Events"
        set autohide menu bar of dock preferences to false
    end tell
    display notification "Menu bar auto-hide disabled." with title "Menu Bar"
end if
