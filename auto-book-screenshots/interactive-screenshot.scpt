-- 互動式自動截圖腳本
-- 用戶可以選擇執行次數，翻頁按鍵透過命令行參數指定
-- 
-- 腳本流程：
-- 1. Cmd + Shift + ] (截圖快捷鍵 - 固定不變)
-- 2. Cmd + s (儲存截圖)
-- 3. Enter (確認儲存)
-- 4. Esc (關閉對話框)
-- 5. 喚醒 App (僅在 --wake-app 時執行)
-- 6. 翻頁按鍵 (透過命令行參數指定)
-- 
-- 使用方式：
-- ./auto-book-screenshots.sh --next-page "Right Arrow"
-- ./auto-book-screenshots.sh --next-page "Space"
-- ./auto-book-screenshots.sh --next-page "Cmd+Right Arrow"
-- ./auto-book-screenshots.sh --wake-app
-- ./auto-book-screenshots.sh --next-page "Right Arrow" --wake-app
-- 
-- 支援的按鍵名稱：
-- Left Arrow, Right Arrow, Up Arrow, Down Arrow
-- Space, Enter, Tab, Escape
-- Cmd+Left Arrow, Cmd+Right Arrow, Cmd+Up Arrow, Cmd+Down Arrow

on run argv
    -- ===== 參數解析 =====
    -- 從命令行參數獲取翻頁按鍵和喚醒 App 設定
    set pageTurnKeyName to "Left Arrow"  -- 預設值
    set wakeApp to false  -- 預設值
    
    if (count of argv) > 0 then
        set pageTurnKeyName to item 1 of argv
    end if
    
    if (count of argv) > 1 then
        set wakeApp to (item 2 of argv) is "true"
    end if
    
    -- ===== 按鍵映射 =====
    -- 將按鍵名稱轉換為對應的 key code 和修飾鍵
    set pageTurnKey to pageTurnKeyName
    set pageTurnKeyCode to 123  -- 預設左方向鍵
    set pageTurnModifiers to {}  -- 預設無修飾鍵
    
    -- 按鍵名稱到 key code 的映射
    if pageTurnKeyName is "Left Arrow" then
        set pageTurnKeyCode to 123
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Right Arrow" then
        set pageTurnKeyCode to 124
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Up Arrow" then
        set pageTurnKeyCode to 126
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Down Arrow" then
        set pageTurnKeyCode to 125
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Space" then
        set pageTurnKeyCode to 49
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Enter" then
        set pageTurnKeyCode to 36
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Tab" then
        set pageTurnKeyCode to 48
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Escape" then
        set pageTurnKeyCode to 53
        set pageTurnModifiers to {}
    else if pageTurnKeyName is "Cmd+Left Arrow" then
        set pageTurnKeyCode to 123
        set pageTurnModifiers to {command down}
    else if pageTurnKeyName is "Cmd+Right Arrow" then
        set pageTurnKeyCode to 124
        set pageTurnModifiers to {command down}
    else if pageTurnKeyName is "Cmd+Up Arrow" then
        set pageTurnKeyCode to 126
        set pageTurnModifiers to {command down}
    else if pageTurnKeyName is "Cmd+Down Arrow" then
        set pageTurnKeyCode to 125
        set pageTurnModifiers to {command down}
    else
        -- 未知按鍵，使用預設值並顯示警告
        display dialog "⚠️ 警告：未知的按鍵名稱 '" & pageTurnKeyName & "'

將使用預設的左方向鍵。" buttons {"確定"} default button "確定"
        set pageTurnKeyCode to 123
        set pageTurnModifiers to {}
    end if
    
    -- ===== 用戶輸入區域 =====
    -- 獲取用戶輸入
    set userInput to display dialog "自動截圖腳本

請輸入要執行的次數：" default answer "10" buttons {"取消", "開始"} default button "開始"
    
    set repeatCount to text returned of userInput as integer
    
    -- 顯示確認訊息
    set clickStatus to ""
    if wakeApp then
        set clickStatus to "6. 喚醒 App (啟用喚醒功能)
"
    end if
    
    display dialog "將執行 " & repeatCount & " 次按鍵序列：

1. Cmd + Shift + ] (截圖快捷鍵)
2. Cmd + s (儲存截圖)
3. Enter (確認儲存)
4. Esc (關閉對話框)
5. " & pageTurnKey & " (翻頁按鍵)
" & clickStatus & "
點擊確定開始執行..." buttons {"確定", "取消"} default button "確定"
    
    -- 執行按鍵序列
    set counter to 1

    delay 2
    
    repeat repeatCount times
        tell application "System Events"
            -- 1. 按下 Cmd + Shift + ] (截圖快捷鍵 - 固定不變)
            key code 30 using {command down, shift down}
            delay 0.5
            
            -- 2. 按下 Cmd + s
            keystroke "s" using command down
            delay 0.5
            
            -- 3. 按下 Enter
            key code 36
            delay 1
            
            -- 4. 按下 Esc
            key code 53
            delay 1

            -- 5. 條件性喚醒 App (僅在啟用時執行)
            if wakeApp then
                repeat 2 times
                    do shell script "cliclick c:."
                    delay 0.2
                end repeat
                delay 0.5
            end if
            
            -- 6. 按下翻頁按鍵 (使用變數配置)
            key code pageTurnKeyCode using pageTurnModifiers
            delay 1
            
            -- 可選：添加短暫延遲避免過快執行
            delay 1
        end tell
        
        -- 顯示進度
        display notification "已執行 " & counter & "/" & repeatCount & " 次" with title "Mac Auto Scripts"
        set counter to counter + 1
    end repeat
    
    -- 顯示完成訊息
    display dialog "✅ 自動截圖腳本執行完成！

已成功執行 " & repeatCount & " 次按鍵序列。" buttons {"完成"} default button "完成"
end run
