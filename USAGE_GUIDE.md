# Mac 自動截圖腳本 - 使用指南

## 🎉 成功！腳本已可正常執行

經過測試，您的自動截圖腳本現在可以正常運作了！

## 📁 可用的腳本

### 📚 自動翻書截圖腳本 (`auto-book-screenshots/`)

#### 1. `simple-screenshot.scpt` - 固定次數版本
**功能**: 執行 10 次翻書截圖序列
**使用方法**:
```bash
osascript auto-book-screenshots/simple-screenshot.scpt
```

#### 2. `interactive-screenshot.scpt` - 互動式版本
**功能**: 用戶可選擇執行次數的翻書截圖
**使用方法**:
```bash
osascript auto-book-screenshots/interactive-screenshot.scpt
```

### 🔧 系統測試腳本

#### 3. `test-permissions.scpt` - 權限測試
**功能**: 測試系統權限和基本功能
**使用方法**:
```bash
osascript test-permissions.scpt
```

## 🔧 按鍵序列說明

### 📚 自動翻書截圖序列
腳本會依序執行以下按鍵：

1. **Cmd + Shift + ]** (key code 30) - 截圖
2. **Cmd + s** - 保存
3. **Enter** (key code 36) - 確認
4. **Esc** (key code 53) - 取消當下截圖
5. **左方向鍵** (key code 123) - 翻頁

### 📝 腳本差異說明
- **interactive-screenshot.scpt**: 使用正確的按鍵順序 (符合 PRD.md)
- **simple-screenshot.scpt**: 使用舊版按鍵順序 (左方向鍵在前)

## ✅ 測試結果

- ✅ 系統權限正常
- ✅ 檔案操作正常
- ✅ 按鍵模擬正常
- ✅ 腳本執行成功

## 🚀 快速開始

### 📚 自動翻書截圖（推薦使用互動式版本）
```bash
osascript auto-book-screenshots/interactive-screenshot.scpt
```

### 🔧 固定次數版本
```bash
osascript auto-book-screenshots/simple-screenshot.scpt
```

## 📋 注意事項

1. **權限要求**: 需要授予終端機輔助功能權限
2. **執行環境**: 確保目標應用程式（如電子書閱讀器）處於活動狀態
3. **按鍵順序**: 腳本會按固定順序執行按鍵
4. **延遲設定**: 每個按鍵間有 1 秒延遲，開始前有 2 秒準備時間
5. **腳本選擇**: 建議使用 `interactive-screenshot.scpt` 以獲得更好的控制

## 🔧 故障排除

### 如果遇到權限錯誤
1. 開啟「系統偏好設定」→「安全性與隱私」→「隱私權」
2. 選擇「輔助功能」
3. 添加「終端機」應用程式
4. 確保被勾選

### 如果按鍵無效
1. 確保目標應用程式處於前台
2. 檢查應用程式是否支援該按鍵組合
3. 嘗試手動執行相同按鍵序列

## 🎯 使用建議

1. **測試環境**: 先在測試環境中驗證腳本行為
2. **執行次數**: 建議從小次數開始測試（如 3-5 次）
3. **監控執行**: 執行時注意系統行為和截圖品質
4. **備份資料**: 執行前備份重要資料
5. **應用程式準備**: 確保電子書閱讀器已開啟並處於正確頁面
6. **腳本選擇**: 使用 `interactive-screenshot.scpt` 可自定義執行次數

## 📞 支援

如果遇到問題，可以：
1. 執行 `test-permissions.scpt` 檢查權限
2. 檢查系統通知中的錯誤訊息
3. 確認目標應用程式狀態

## 📚 相關文件

- **PRD.md**: 產品需求文件，定義按鍵序列
- **key-code-reference.md**: 完整的 AppleScript key code 參考清單
- **rules.md**: 開發規則和最佳實踐

---

**恭喜！您的自動翻書截圖腳本已經可以正常使用了！** 🎉📚
