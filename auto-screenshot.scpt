-- 自動截圖腳本 - 支援快捷鍵控制
-- 使用檔案狀態控制腳本執行

-- 主執行函數
on executeKeySequence()
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
end executeKeySequence

-- 檢查控制檔案狀態
on checkControlFile(controlFile)
    try
        set fileRef to open for access controlFile
        set fileContent to read fileRef
        close access fileRef
        return fileContent
    on error
        return "stop"
    end try
end checkControlFile

-- 寫入控制檔案
on writeControlFile(controlFile, status)
    try
        set fileRef to open for access controlFile with write permission
        write status to fileRef
        close access fileRef
    on error
        -- 如果檔案不存在，創建它
        try
            set fileRef to open for access controlFile with write permission
            write status to fileRef
            close access fileRef
        end try
    end try
end writeControlFile

-- 主程式入口
on run
    -- 設定控制檔案路徑
    set controlFile to (path to desktop folder as string) & "code:mac-auto-scripts:screenshot-control.txt"
    
    -- 初始化控制檔案為停止狀態
    writeControlFile(controlFile, "stop")
    
    -- 顯示使用說明
    display dialog "自動截圖腳本已載入

快捷鍵說明：
- Cmd + Shift + 1: 開始執行
- Cmd + Shift + 0: 停止執行

腳本將持續監控控制檔案狀態" buttons {"確定"} default button "確定"
    
    -- 主執行迴圈
    repeat
        set controlStatus to checkControlFile(controlFile)
        
        if controlStatus is "start" then
            executeKeySequence()
            delay 0.5 -- 短暫延遲避免過快執行
        else if controlStatus is "stop" then
            delay 1 -- 停止時等待更長時間
        end if
    end repeat
end run