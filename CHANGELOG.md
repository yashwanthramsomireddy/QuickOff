# Changelog

All notable changes to QuickOff will be documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).  
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.1.1] — 2026-08-26

### Fixed
- **Critical bug**: `doAction()` called `hideOv()` before saving `pending`, causing `pending` to be cleared to `""` before the action check — meaning every button silently did nothing after confirming. Fixed by capturing `pending` into a local variable before calling `hideOv()`.
- **Lock not working**: wrapped `rundll32.exe user32.dll,LockWorkStation` in `cmd /c` for reliable execution from WScript.Shell context.
- **Sleep reliability**: same `cmd /c` wrapper applied to `powrprof.dll,SetSuspendState`.
- **Window not draggable**: drag handler re-added to `#top-gap` area (was lost when title bar was removed in v1.1.0).

---

## [1.1.0] — 2026-08-26

### Changed
- Complete UI redesign — pitch black (`#080808`) minimal theme
- Layout changed from 2-column card grid to compact single-column list (icon left, label right)
- Removed title/drag bar entirely — window chrome stripped to zero (`BORDER="none"`, no caption)
- Close button is now a small floating circle (top-right corner, always accessible)
- Version badge replaces app name label — ultra-subtle `QUICKOFF` text top-left
- Button height reduced to 36px — coloured left-border accent on hover instead of card fill
- Window height reduced from 480px to 306px — significantly more compact
- Confirm overlay simplified — shorter text, smaller footprint
- Abort row slimmed to single line with inline status
- Dividers between every action for clear visual separation

### Fixed
- Removed unused drag-bar VBScript handler

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
