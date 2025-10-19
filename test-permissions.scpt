-- 測試腳本 - 檢查權限和基本功能
-- 此腳本用於測試系統權限和基本功能

on run
    -- 顯示歡迎訊息
    display dialog "Mac 自動截圖腳本測試

此腳本將測試：
1. 系統權限
2. 檔案操作
3. 按鍵模擬

點擊確定開始測試..." buttons {"確定", "取消"} default button "確定"
    
    -- 測試檔案操作
    set controlFile to (path to desktop folder as string) & "code:mac-auto-scripts:test-control.txt"
    
    try
        -- 寫入測試檔案
        set fileRef to open for access controlFile with write permission
        write "test-success" to fileRef
        close access fileRef
        
        display dialog "✅ 檔案操作測試成功！

檔案已創建：test-control.txt" buttons {"繼續"} default button "繼續"
        
        -- 測試系統權限
        try
            tell application "System Events"
                -- 嘗試獲取當前應用程式名稱
                set currentApp to name of first application process whose frontmost is true
                display dialog "✅ 系統權限測試成功！

當前應用程式：" & currentApp & "

現在將測試按鍵模擬..." buttons {"測試按鍵", "跳過"} default button "測試按鍵"
                
                -- 測試簡單按鍵
                key code 36 -- Enter 鍵
                delay 1
                
                display dialog "✅ 按鍵模擬測試成功！

所有測試都通過了！
現在可以正常使用自動截圖腳本。" buttons {"完成"} default button "完成"
                
            end tell
            
        on error permissionError
            display dialog "❌ 系統權限測試失敗！

錯誤：" & permissionError & "

解決方法：
1. 開啟「系統偏好設定」
2. 選擇「安全性與隱私」
3. 點擊「隱私權」標籤
4. 選擇「輔助功能」
5. 點擊左下角的「+」按鈕
6. 添加「終端機」應用程式
7. 確保終端機被勾選

設定完成後重新執行腳本。" buttons {"了解"} default button "了解"
        end try
        
    on error fileError
        display dialog "❌ 檔案操作測試失敗！

錯誤：" & fileError buttons {"了解"} default button "了解"
    end try
end run
