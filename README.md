# Mac Auto Scripts

一個用於 macOS 的自動化腳本集合，主要提供自動截圖和按鍵模擬功能。

## 📚 Auto Book Screenshots

**自動翻書截圖工具** - 專為電子書閱讀器設計的自動化腳本

### 功能 / Features
- 自動執行翻書截圖流程
- 支援自定義執行次數
- 提供進度通知
- 完整的按鍵序列自動化

### 按鍵序列 / Key Sequence
1. **Cmd + Shift + ]** - 截圖
2. **Cmd + s** - 保存
3. **Enter** - 確認
4. **Esc** - 取消當下截圖
5. **左方向鍵** - 翻頁

### 使用方法 / Usage

#### 互動式版本（推薦）
```bash
osascript auto-book-screenshots/interactive-screenshot.scpt
```

#### 固定次數版本
```bash
osascript auto-book-screenshots/simple-screenshot.scpt
```

## 📁 專案結構 / Project Structure

```
mac-auto-scripts/
├── auto-book-screenshots/          # 自動翻書截圖腳本
│   ├── interactive-screenshot.scpt # 互動式版本
│   ├── simple-screenshot.scpt      # 固定次數版本
│   └── docs/
│       └── PRD.md                  # 產品需求文件
├── key-code-reference.md           # AppleScript key code 參考
├── USAGE_GUIDE.md                  # 詳細使用指南
├── rules.md                        # 開發規則
└── test-permissions.scpt           # 權限測試腳本
```

## ⚡ 快速開始 / Quick Start

1. **授予權限** / Grant Permissions
   - 系統偏好設定 → 安全性與隱私 → 隱私權 → 輔助功能
   - 添加「終端機」應用程式

2. **執行腳本** / Run Script
   ```bash
   osascript auto-book-screenshots/interactive-screenshot.scpt
   ```

3. **輸入次數** / Enter Count
   - 在彈出對話框中輸入要執行的次數
   - 點擊「開始」按鈕

## 📋 需求 / Requirements

- macOS 系統
- 輔助功能權限
- 目標應用程式（如電子書閱讀器）處於活動狀態

## 🔧 技術細節 / Technical Details

- **語言**: AppleScript
- **執行環境**: macOS System Events
- **按鍵模擬**: 使用 key code 和 keystroke
- **延遲設定**: 每個按鍵間 1 秒延遲，開始前 2 秒準備時間

## 📖 更多資訊 / More Information

- 詳細使用說明請參考 [USAGE_GUIDE.md](USAGE_GUIDE.md)
- 完整的 key code 參考請查看 [key-code-reference.md](key-code-reference.md)
- 開發規則請參考 [rules.md](rules.md)

---

**讓自動化提升您的工作效率！** 🚀
