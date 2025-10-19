# AppleScript Key Code 參考清單 / AppleScript Key Code Reference

## 字母鍵 / Alphabet Keys
| 按鍵 / Key | Key Code | 按鍵 / Key | Key Code |
|------------|----------|------------|----------|
| A | 0 | N | 45 |
| S | 1 | M | 46 |
| D | 2 | O | 31 |
| F | 3 | P | 35 |
| G | 5 | Q | 12 |
| H | 4 | R | 15 |
| I | 34 | T | 17 |
| J | 38 | U | 32 |
| K | 40 | V | 9 |
| L | 37 | W | 13 |
| X | 7 | Y | 16 |
| Z | 6 | | |

## 數字鍵 / Number Keys
| 按鍵 / Key | Key Code | 按鍵 / Key | Key Code |
|------------|----------|------------|----------|
| 0 | 29 | 5 | 23 |
| 1 | 18 | 6 | 22 |
| 2 | 19 | 7 | 26 |
| 3 | 20 | 8 | 28 |
| 4 | 21 | 9 | 25 |

## 符號鍵 / Symbol Keys
| 按鍵 / Key | Key Code | 按鍵 / Key | Key Code |
|------------|----------|------------|----------|
| ` (Grave) | 50 | ; (Semicolon) | 41 |
| - (Minus) | 27 | ' (Quote) | 39 |
| = (Equal) | 24 | \ (Backslash) | 42 |
| [ (Left Bracket) | 33 | , (Comma) | 43 |
| ] (Right Bracket) | 30 | . (Period) | 47 |
| | | | / (Slash) | 44 |

## 功能鍵 / Function Keys
| 按鍵 / Key | Key Code | 按鍵 / Key | Key Code |
|------------|----------|------------|----------|
| F1 | 122 | F10 | 109 |
| F2 | 120 | F11 | 103 |
| F3 | 99 | F12 | 111 |
| F4 | 118 | F13 | 105 |
| F5 | 96 | F14 | 107 |
| F6 | 97 | F15 | 113 |
| F7 | 98 | F16 | 106 |
| F8 | 100 | F17 | 64 |
| F9 | 101 | F18 | 79 |
| | | F19 | 80 |
| | | F20 | 90 |

## 方向鍵 / Arrow Keys
| 按鍵 / Key | Key Code |
|------------|----------|
| ← (Left Arrow) | 123 |
| → (Right Arrow) | 124 |
| ↓ (Down Arrow) | 125 |
| ↑ (Up Arrow) | 126 |

## 修飾鍵 / Modifier Keys
| 按鍵 / Key | Key Code |
|------------|----------|
| ⌘ (Command) | 55 |
| ⇧ (Shift) | 56 |
| ⇪ (Caps Lock) | 57 |
| ⌥ (Option/Alt) | 58 |
| ⌃ (Control) | 59 |
| ⇧ (Right Shift) | 60 |
| ⌥ (Right Option/Alt) | 61 |
| ⌃ (Right Control) | 62 |
| fn (Function) | 63 |

## 特殊鍵 / Special Keys
| 按鍵 / Key | Key Code | 按鍵 / Key | Key Code |
|------------|----------|------------|----------|
| Space | 49 | Page Up | 116 |
| Tab | 48 | Page Down | 121 |
| Return/Enter | 36 | Home | 115 |
| Delete/Backspace | 51 | End | 119 |
| Forward Delete | 117 | Help | 114 |
| Escape | 53 | | |

## 數字鍵盤 / Keypad
| 按鍵 / Key | Key Code | 按鍵 / Key | Key Code |
|------------|----------|------------|----------|
| Keypad 0 | 82 | Keypad 5 | 87 |
| Keypad 1 | 83 | Keypad 6 | 88 |
| Keypad 2 | 84 | Keypad 7 | 89 |
| Keypad 3 | 85 | Keypad 8 | 91 |
| Keypad 4 | 86 | Keypad 9 | 92 |
| Keypad . (Decimal) | 65 | Keypad + | 69 |
| Keypad * (Multiply) | 67 | Keypad - | 78 |
| Keypad / (Divide) | 75 | Keypad = | 81 |
| Keypad Enter | 76 | Keypad Clear | 71 |

## 媒體鍵 / Media Keys
| 按鍵 / Key | Key Code |
|------------|----------|
| Volume Up | 72 |
| Volume Down | 73 |
| Mute | 74 |

## 使用範例 / Usage Examples

### 基本按鍵 / Basic Keys
```applescript
tell application "System Events"
    key code 36  -- Enter
    key code 53  -- Escape
    key code 49  -- Space
end tell
```

### 組合鍵 / Key Combinations
```applescript
tell application "System Events"
    -- Cmd + S
    keystroke "s" using command down
    
    -- Cmd + Shift + ]
    key code 30 using {command down, shift down}
    
    -- Ctrl + C
    keystroke "c" using control down
end tell
```

### 方向鍵 / Arrow Keys
```applescript
tell application "System Events"
    key code 123  -- Left Arrow
    key code 124  -- Right Arrow
    key code 125  -- Down Arrow
    key code 126  -- Up Arrow
end tell
```

## 注意事項 / Notes

1. **權限要求 / Permission Required**: 需要授予輔助功能權限才能使用 key code
2. **應用程式焦點 / Application Focus**: 確保目標應用程式處於前景狀態
3. **延遲時間 / Delay**: 建議在按鍵之間添加適當的延遲時間
4. **鍵盤佈局 / Keyboard Layout**: 某些 key code 可能因鍵盤佈局而有所不同

## 更新日期 / Last Updated
2025年10月19日 / October 19, 2025
