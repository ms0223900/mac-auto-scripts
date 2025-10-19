-- 簡化版自動截圖腳本 - 執行固定次數
-- 此腳本執行 10 次按鍵序列，無需持續監控

on run
    -- 顯示開始訊息
    display dialog "自動截圖腳本

將執行 10 次按鍵序列：
1. 左方向鍵
2. Cmd + Shift + ]
3. Cmd + s
4. Enter

點擊確定開始執行..." buttons {"開始", "取消"} default button "開始"
    
    -- 執行 10 次按鍵序列
    set counter to 1
    repeat 10 times
        tell application "System Events"
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
        end tell
        
        -- 顯示進度
        display notification "已執行 " & counter & "/10 次" with title "Mac Auto Scripts"
        set counter to counter + 1
    end repeat
    
    -- 顯示完成訊息
    display dialog "✅ 自動截圖腳本執行完成！

已成功執行 10 次按鍵序列。" buttons {"完成"} default button "完成"
end run