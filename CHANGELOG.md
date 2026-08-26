# Changelog

All notable changes to QuickOff will be documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).  
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] — 2026-08-26

### Added
- Floating dark power menu widget (`QuickOff.hta`) for Windows 10 and 11
- Six power actions: Hibernate, Sleep, Shut Down, Restart, Lock PC, Sign Out
- Delay timer — schedule any action by a custom number of seconds
- Countdown display in the status bar with live tick
- Abort button — cancels any active countdown or pending `shutdown /s /r` command
- Confirm overlay — every action prompts before executing
- Draggable window — click and drag the title bar to reposition
- Auto-position on launch — snaps to bottom-right of the screen
- CLI launcher (`launch.bat`) supporting all six actions plus delay and abort
- Setup script (`setup.bat`) for enabling and disabling autostart on Windows login via the `HKCU` Run registry key (no admin required)
- MIT License
- README with usage guide, compatibility table, and contributing instructions
- CHANGELOG

### Technical
- IE-compatible layout using HTML tables (CSS Grid is not supported in the HTA / mshta.exe engine)
- HTML entity icons instead of emoji (emoji rendering is broken in the IE rendering engine used by mshta.exe)
- VBScript `WScript.Shell` bridge for running system commands from JavaScript
- Pure Windows built-ins only: `mshta.exe`, `shutdown`, `rundll32`, `reg`

---

<!-- Add future releases above this line -->
