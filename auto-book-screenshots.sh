#!/bin/bash

# 自動截圖腳本啟動器
# 用法: ./auto-book-screenshots.sh [--next-page "按鍵名稱"]
# 範例: ./auto-book-screenshots.sh --next-page "Right Arrow"

# 預設翻頁按鍵
NEXT_PAGE_KEY="Left Arrow"

# 解析參數
while [[ $# -gt 0 ]]; do
    case $1 in
        --next-page)
            NEXT_PAGE_KEY="$2"
            shift 2
            ;;
        -h|--help)
            echo "用法: $0 [--next-page \"按鍵名稱\"]"
            echo ""
            echo "選項:"
            echo "  --next-page \"按鍵名稱\"  指定翻頁按鍵 (預設: Left Arrow)"
            echo "  -h, --help              顯示此說明"
            echo ""
            echo "支援的按鍵名稱:"
            echo "  Left Arrow, Right Arrow, Up Arrow, Down Arrow"
            echo "  Space, Enter, Tab, Escape"
            echo "  Cmd+Left Arrow, Cmd+Right Arrow (需要加引號)"
            echo ""
            echo "範例:"
            echo "  $0                                    # 使用預設左方向鍵"
            echo "  $0 --next-page \"Right Arrow\"         # 使用右方向鍵"
            echo "  $0 --next-page \"Space\"               # 使用空白鍵"
            exit 0
            ;;
        *)
            echo "未知參數: $1"
            echo "使用 -h 或 --help 查看使用說明"
            exit 1
            ;;
    esac
done

echo "使用翻頁按鍵: $NEXT_PAGE_KEY"

# 執行 AppleScript 並傳遞參數
osascript ./auto-book-screenshots/interactive-screenshot.scpt "$NEXT_PAGE_KEY"