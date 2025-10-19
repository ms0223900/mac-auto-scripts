-- 互動式自動截圖腳本
-- 用戶可以選擇執行次數和翻頁按鍵
-- 
-- 腳本流程：
-- 1. Cmd + Shift + ] (截圖快捷鍵 - 固定不變)
-- 2. Cmd + s (儲存截圖)
-- 3. Enter (確認儲存)
-- 4. Esc (關閉對話框)
-- 5. 翻頁按鍵 (可透過變數配置)
-- 
-- 如何修改翻頁按鍵：
-- 1. 修改 pageTurnKey 變數 (僅用於顯示)
-- 2. 修改 pageTurnKeyCode 變數 (實際的按鍵代碼)
-- 3. 修改 pageTurnModifiers 變數 (修飾鍵組合)
-- 
-- 常用按鍵代碼參考：
-- 123 = 左方向鍵, 124 = 右方向鍵, 125 = 下方向鍵, 126 = 上方向鍵
-- 30 = ], 33 = [, 36 = Enter, 53 = Esc

on run
    -- ===== 配置區域 =====
    -- 翻頁按鍵配置 (可修改此處來改變翻頁按鍵)
    -- 
    -- 範例配置：
    -- 1. 左方向鍵 (預設)
    --    set pageTurnKey to "左方向鍵"
    --    set pageTurnKeyCode to 123
    --    set pageTurnModifiers to {}
    --
    -- 2. 右方向鍵
    --    set pageTurnKey to "右方向鍵"
    --    set pageTurnKeyCode to 124
    --    set pageTurnModifiers to {}
    --
    -- 3. Cmd + 右方向鍵
    --    set pageTurnKey to "Cmd + 右方向鍵"
    --    set pageTurnKeyCode to 124
    --    set pageTurnModifiers to {command down}
    
    set pageTurnKey to "左方向鍵"  -- 翻頁按鍵組合
    set pageTurnKeyCode to 123  -- 對應的 key code (123 = 左方向鍵)
    set pageTurnModifiers to {}  -- 修飾鍵
    
    -- ===== 用戶輸入區域 =====
    -- 獲取用戶輸入
    set userInput to display dialog "自動截圖腳本

請輸入要執行的次數：" default answer "10" buttons {"取消", "開始"} default button "開始"
    
    set repeatCount to text returned of userInput as integer
    
    -- 顯示確認訊息
    display dialog "將執行 " & repeatCount & " 次按鍵序列：

1. Cmd + Shift + ] (截圖快捷鍵)
2. Cmd + s (儲存截圖)
3. Enter (確認儲存)
4. Esc (關閉對話框)
5. " & pageTurnKey & " (翻頁按鍵)

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
            delay 0.5
            
            -- 5. 按下翻頁按鍵 (使用變數配置)
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
