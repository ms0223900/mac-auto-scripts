tell application "System Events"
    # repeat 10 times
        -- 1. 按下左方向鍵
        key code 37
        
        -- 2. 按下 Cmd + Shift + ]
        key code 30 using {command down, shift down}
	delay 1
        
        -- 3. 按下 Cmd + s
	keystroke "s" using command down
	delay 1
        
        -- 4. 按下 Enter
        key code 36
	delay 1
        
        -- 可選：添加短暫延遲避免過快執行
        delay 1
    # end repeat
end tell
