# Keybindings Reference Card

> Quick reference for tmux-i3-workflow keybindings

## Modifier Key

All keybindings use **Alt** (Meta) as the modifier key, matching i3wm's `$mod` behavior.

```
Modifier: Alt (M-)
No prefix mode - direct key binding
```

---

## Navigation

### Pane Focus

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + h` | Focus Left | Move focus to pane on the left |
| `Alt + j` | Focus Down | Move focus to pane below |
| `Alt + k` | Focus Up | Move focus to pane above |
| `Alt + l` | Focus Right | Move focus to pane on the right |

### Window Switching

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + 1` | Window 1 | Switch to window 1 |
| `Alt + 2` | Window 2 | Switch to window 2 |
| `Alt + 3` | Window 3 | Switch to window 3 |
| `Alt + 4` | Window 4 | Switch to window 4 |
| `Alt + 5` | Window 5 | Switch to window 5 |
| `Alt + 6` | Window 6 | Switch to window 6 |
| `Alt + 7` | Window 7 | Switch to window 7 |
| `Alt + 8` | Window 8 | Switch to window 8 |
| `Alt + 9` | Window 9 | Switch to window 9 |
| `Alt + 0` | Window 10 | Switch to window 10 |

---

## Pane Management

### Creation & Layout

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + Enter` | New Pane | Create new pane (auto layout) |
| `Alt + s` | Horizontal Split | Switch to main-horizontal layout |
| `Alt + v` | Vertical Split | Switch to main-vertical layout |
| `Alt + z` | Zoom Toggle | Toggle pane fullscreen |

### Layout Preview

```
main-vertical (Alt+v):      main-horizontal (Alt+s):
┌──────────┬──────┐        ┌──────────────────────┐
│          │      │        │                      │
│  Main    │ Pane │        │        Main          │
│  (60%)   │(40%) │        │        (60%)         │
│          │      │        ├──────────────────────┤
│          │      │        │   Pane  │   Pane    │
└──────────┴──────┘        │  (40%)  │   (40%)   │
                            └─────────────────────┘
```

### Resize Mode

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + r` | Enter Resize | Enter resize mode |

**Inside Resize Mode:**

| Keybinding | Action |
|------------|--------|
| `h` | Resize pane left (+5) |
| `j` | Resize pane down (+5) |
| `k` | Resize pane up (+5) |
| `l` | Resize pane right (+5) |
| `H` | Resize pane left (+10) |
| `J` | Resize pane down (+10) |
| `K` | Resize pane up (+10) |
| `L` | Resize pane right (+10) |
| `Escape` | Exit resize mode |
| `Enter` | Exit resize mode |

### Closing

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + Shift + q` | Kill Pane | Close current pane (with confirmation) |

---

## Pane Movement

### Swap Panes

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + Shift + h` | Swap Left | Swap with pane on the left |
| `Alt + Shift + j` | Swap Down | Swap with pane below |
| `Alt + Shift + k` | Swap Up | Swap with pane above |
| `Alt + Shift + l` | Swap Right | Swap with pane on the right |

### Move to Window

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + Shift + 1` | Move to Window 1 | Move current pane to window 1 |
| `Alt + Shift + 2` | Move to Window 2 | Move current pane to window 2 |
| `Alt + Shift + 3` | Move to Window 3 | Move current pane to window 3 |
| `Alt + Shift + 4` | Move to Window 4 | Move current pane to window 4 |
| `Alt + Shift + 5` | Move to Window 5 | Move current pane to window 5 |
| `Alt + Shift + 6` | Move to Window 6 | Move current pane to window 6 |
| `Alt + Shift + 7` | Move to Window 7 | Move current pane to window 7 |
| `Alt + Shift + 8` | Move to Window 8 | Move current pane to window 8 |
| `Alt + Shift + 9` | Move to Window 9 | Move current pane to window 9 |
| `Alt + Shift + 0` | Move to Window 10 | Move current pane to window 10 |

---

## Session Management

### Session Switcher

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + d` | Session Popup | Open fuzzy session switcher |

### Zoxide Integration

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + o` | Zoxide Popup | Open zoxide directory picker |

### Session Persistence

Sessions are automatically saved every 15 minutes and restored when tmux starts.

---

## Copy Mode

### Enter/Exit

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + [` | Enter Copy | Enter copy mode |
| `q` | Exit Copy | Exit copy mode |

### Navigation (Copy Mode)

| Keybinding | Action |
|------------|--------|
| `h/j/k/l` | Move cursor |
| `w` | Word forward |
| `b` | Word backward |
| `0` | Line start |
| `$` | Line end |
| `Ctrl+u` | Half page up |
| `Ctrl+d` | Half page down |
| `Ctrl+b` | Full page up |
| `Ctrl+f` | Full page down |
| `g` | Go to top |
| `G` | Go to bottom |

### Selection & Yank

| Keybinding | Action | Description |
|------------|--------|-------------|
| `v` | Visual Start | Start visual selection |
| `V` | Visual Line | Select entire line |
| `Ctrl+v` | Visual Block | Block selection |
| `y` | Yank | Copy to system clipboard |
| `Enter` | Yank | Copy to system clipboard |

### Paste

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Alt + p` | Paste | Paste from tmux buffer (FR-23) |

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│                    tmux-i3-workflow                          │
├─────────────────────────────────────────────────────────────┤
│  NAVIGATION          │  PANE MGMT         │  SESSION        │
│  ─────────────       │  ────────────      │  ──────────     │
│  Alt+h/j/k/l  Focus  │  Alt+Enter  New    │  Alt+d  Switch  │
│  Alt+0-9      Window │  Alt+s/v    Layout │  Alt+o  Zoxide  │
│                      │  Alt+z      Zoom   │                 │
│  PANE MOVE           │  Alt+r      Resize │  CLOSE          │
│  ──────────          │  Alt+Shift+q Kill  │  ──────         │
│  Alt+Shift+hjkl Swap │                    │  Alt+Shift+q    │
│  Alt+Shift+0-9  Move │                    │                 │
└─────────────────────────────────────────────────────────────┘
```

---

## Tips

1. **Quick Window Switch**: Use `Alt+1` through `Alt+9` for instant window access
2. **Zoom Focus**: Press `Alt+z` to focus on a single pane, press again to restore
3. **Resize Quickly**: `Alt+r` then hold `h/j/k/l` for continuous resizing
4. **Session Jump**: `Alt+d` shows all sessions with fuzzy search
5. **Project Jump**: `Alt+o` uses zoxide for smart project switching
