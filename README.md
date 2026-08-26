# ⚡ QuickOff

> A compact, modern power menu widget for Windows 10 and 11 — no install required.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-0078D4?logo=windows)](https://github.com/your-username/quickoff)
[![No Install](https://img.shields.io/badge/Install-None%20Required-brightgreen)]()
[![Version](https://img.shields.io/badge/Version-1.0.0-orange)]()

---

## What is QuickOff?

QuickOff is a lightweight floating power menu that sits in the corner of your screen. One double-click gives you instant access to Hibernate, Sleep, Shut Down, Restart, Lock, and Sign Out — with a delay timer and abort button built in.

It runs entirely on tools already built into Windows (`mshta.exe`, `shutdown`, `rundll32`). No installer, no admin rights, no dependencies.

---

## Features

- **6 power actions** — Hibernate, Sleep, Shut Down, Restart, Lock PC, Sign Out
- **Delay timer** — schedule any action N seconds ahead
- **Abort button** — cancel a running countdown or pending shutdown at any time
- **Confirm overlay** — prevents accidental triggers
- **Draggable window** — reposition anywhere on screen
- **Autostart on login** — optional, set up via `setup.bat` (no admin needed)
- **CLI mode** — drive any action from a terminal or Task Scheduler script
- **Zero dependencies** — pure `.bat` + `.hta`, ships with Windows since XP

---

## Getting Started

### 1. Download

Go to the [Releases](../../releases) page and download the latest `QuickOff.zip`.

### 2. Extract

Unzip to any folder, e.g. `C:\Tools\QuickOff\`.

### 3. Run

Double-click **`QuickOff.hta`** — the widget appears in the bottom-right corner.

### 4. (Optional) Autostart on login

Run **`setup.bat`** and choose **[1] Enable autostart**.  
To remove it later, run `setup.bat` again and choose **[2] Disable autostart**.

---

## CLI Usage

Use `launch.bat` to trigger actions directly from a terminal or script:

```bat
launch.bat              Open the GUI widget
launch.bat h            Hibernate immediately
launch.bat s            Sleep immediately
launch.bat off          Shut down immediately
launch.bat off 60       Shut down after 60 seconds
launch.bat r            Restart immediately
launch.bat r 120        Restart after 120 seconds
launch.bat l            Lock PC
launch.bat lo           Sign Out
launch.bat abort        Cancel any scheduled shutdown / restart
```

---

## Files

| File | Description |
|------|-------------|
| `QuickOff.hta` | The GUI widget — double-click to open |
| `launch.bat` | CLI launcher for scripting and terminal use |
| `setup.bat` | Enable or disable autostart on Windows login |
| `LICENSE` | MIT License |
| `CHANGELOG.md` | Version history |

---

## Compatibility

| Windows Version | Status |
|-----------------|--------|
| Windows 11 | ✅ Supported |
| Windows 10 | ✅ Supported |
| Windows 8 / 8.1 | ✅ Should work |
| Windows 7 | ✅ Should work |

QuickOff uses `mshta.exe` (Microsoft HTML Application Host), which is built into every version of Windows since XP.

---

## How Autostart Works

`setup.bat` adds one registry value to:

```
HKCU\Software\Microsoft\Windows\CurrentVersion\Run
```

This is the standard per-user autostart location. No elevated permissions are needed, and it only affects your own Windows account. To remove it, run `setup.bat` and choose option 2.

---

## Contributing

Pull requests are welcome. Please open an issue first to discuss any major changes.

1. Fork the repo
2. Create your branch (`git checkout -b feature/your-feature`)
3. Commit your changes
4. Open a pull request

---

## License

[MIT](LICENSE) — free to use, modify, and distribute.
