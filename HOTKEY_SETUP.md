# Mac 自動截圖腳本 - 快捷鍵設定指南

## 概述
此解決方案使用純 AppleScript 實現快捷鍵控制，無需外部依賴。

## 檔案說明

### 主要腳本
- `auto-screenshot.scpt` - 主執行腳本，持續監控控制檔案狀態
- `start-screenshot.scpt` - 開始腳本，將控制檔案設為 "start"
- `stop-screenshot.scpt` - 停止腳本，將控制檔案設為 "stop"
- `screenshot-control.txt` - 控制檔案（自動生成）

## 設定步驟

### 1. 啟動主腳本
```bash
osascript auto-screenshot.scpt
```

### 2. 設定系統快捷鍵

#### 方法一：使用系統偏好設定（推薦）
1. 開啟「系統偏好設定」→「鍵盤」→「快捷鍵」
2. 選擇左側的「服務」
3. 在右側找到「一般」分類
4. 勾選「執行 AppleScript」
5. 為「執行 AppleScript」設定快捷鍵：
   - `Cmd + Shift + 1` 用於開始
   - `Cmd + Shift + 0` 用於停止

**注意**：使用此方法時，需要在「執行 AppleScript」對話框中輸入對應的腳本內容。

**開始腳本內容**：
```applescript
set controlFile to (path to desktop folder as string) & "code:mac-auto-scripts:screenshot-control.txt"
try
    set fileRef to open for access controlFile with write permission
    write "start" to fileRef
    close access fileRef
    display notification "自動截圖腳本已開始執行" with title "Mac Auto Scripts"
on error
    try
        set fileRef to open for access controlFile with write permission
        write "start" to fileRef
        close access fileRef
        display notification "自動截圖腳本已開始執行" with title "Mac Auto Scripts"
    on error errorMessage
        display notification "啟動失敗: " & errorMessage with title "Mac Auto Scripts"
    end try
end try
```

**停止腳本內容**：
```applescript
set controlFile to (path to desktop folder as string) & "code:mac-auto-scripts:screenshot-control.txt"
try
    set fileRef to open for access controlFile with write permission
    write "stop" to fileRef
    close access fileRef
    display notification "自動截圖腳本已停止" with title "Mac Auto Scripts"
on error
    try
        set fileRef to open for access controlFile with write permission
        write "stop" to fileRef
        close access fileRef
        display notification "自動截圖腳本已停止" with title "Mac Auto Scripts"
    on error errorMessage
        display notification "停止失敗: " & errorMessage with title "Mac Auto Scripts"
    end try
end try
```

#### 方法二：使用 Automator 創建服務
1. 開啟 Automator
2. 選擇「快速操作」
3. 設定「服務接受」為「無輸入」
4. 添加「執行 AppleScript」動作
5. 輸入對應的腳本內容
6. 儲存為服務
7. 在系統偏好設定中為服務設定快捷鍵

### 3. 授予權限
1. 開啟「系統偏好設定」→「安全性與隱私」→「隱私權」
2. 選擇「輔助功能」
3. 添加「終端機」或「腳本編輯器」

## 使用方法

### 啟動腳本
1. 執行 `osascript auto-screenshot.scpt` 啟動主腳本
2. 使用 `Cmd + Shift + 1` 開始自動截圖
3. 使用 `Cmd + Shift + 0` 停止自動截圖

### 直接執行
```bash
# 開始
osascript start-screenshot.scpt

# 停止
osascript stop-screenshot.scpt
```

## 工作原理

1. **主腳本** (`auto-screenshot.scpt`) 持續運行，監控控制檔案
2. **控制檔案** (`screenshot-control.txt`) 儲存當前狀態：
   - `start` - 開始執行按鍵序列
   - `stop` - 停止執行
3. **快捷鍵腳本** 修改控制檔案狀態
4. **主腳本** 根據檔案狀態決定是否執行按鍵序列

## 優點

- ✅ 純 AppleScript 實現，無外部依賴
- ✅ 使用系統原生快捷鍵功能
- ✅ 簡單可靠的控制機制
- ✅ 支援狀態通知

## 注意事項

- 需要授予輔助功能權限
- 主腳本需要持續運行
- 控制檔案會自動創建在腳本目錄中
- 建議在測試環境中先驗證功能

## 故障排除

### 快捷鍵無效
1. 檢查系統偏好設定中的快捷鍵設定
2. 確認輔助功能權限已授予
3. 重新啟動腳本

### 腳本不執行
1. 檢查控制檔案是否存在
2. 確認檔案權限正確
3. 查看系統通知中的錯誤訊息

### 權限問題
1. 前往系統偏好設定 → 安全性與隱私 → 隱私權 → 輔助功能
2. 添加終端機或腳本編輯器
3. 重新執行腳本
