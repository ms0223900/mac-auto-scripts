-- 互動式自動截圖腳本
-- 用戶可以選擇執行次數

on run
    -- 獲取用戶輸入
    set userInput to display dialog "自動截圖腳本

請輸入要執行的次數：" default answer "10" buttons {"取消", "開始"} default button "開始"
    
    set repeatCount to text returned of userInput as integer
    
    -- 顯示確認訊息
    display dialog "將執行 " & repeatCount & " 次按鍵序列：

1. Cmd + Shift + ]
2. Cmd + s
3. Enter
4. Esc
5. 左方向鍵

點擊確定開始執行..." buttons {"確定", "取消"} default button "確定"
    
    -- 執行按鍵序列
    set counter to 1

    delay 2
    
    repeat repeatCount times
        tell application "System Events"
            -- 1. 按下 Cmd + Shift + ]
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
            delay 0.5
            
            -- 5. 按下左方向鍵
            key code 123
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
