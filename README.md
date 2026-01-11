# Wardialer
A real deal wardialer patterned around 1985 for the Apple IIe, heavily inspired by the Hayes Hackamatic I found while searching for these sorts of historical oddities. It's designed so that one can build and test locally, currently on a Windows machine, using AppleWin as the emulator and AppleCommander (ac/acx) as the tooling to help insert the code into a disk. Once complete the DSK file can be copied to something like a FloppyEmu to run on real steel hardware or even copied to a real diskette if you'd like.

This one is designed around a Hayes 300/1200 connected via a Super Serial Card in slot 2 of the Apple IIe machine, AppleWin as the emulator looks the same as this setup does in the real world. It's possible a future version might use one of the Hayes internal modems but, for now, it's done via AT commands across the SSC.

## VS Code Tasks (Build & Run)

This project uses **VS Code Tasks** to standardize building and running WARDIAL on Windows.
Open the project root directly in VS Code (`c:\projects\wardialer`).

### Prerequisites
- Windows
- Visual Studio Code
- `env.cmd`, `build.cmd`, and `run.cmd` located in the project root

The `env.cmd` script **must run first** to establish required environment variables.
Each task runs all commands in a **single `cmd.exe` session** to preserve environment state.

---

### Build Task

**Task name:** `Build: WARDIAL`  
**Shortcut:** `Ctrl + Shift + B` (default build task)

**Behavior:**
1. Launches `cmd.exe`
2. Executes `env.cmd`
3. Executes `build.cmd`

**Purpose:**
- Builds all project artifacts
- Safe to run repeatedly
- Does not execute the application

---

### Run Task (Build First)

**Task name:** `Run: WARDIAL (build first)`  
**Invocation:**
- Command Palette → `Tasks: Run Task`
- Select `Run: WARDIAL (build first)`

**Behavior:**
1. Executes `env.cmd`
2. Executes `build.cmd`
3. Executes `run.cmd`
4. All steps execute sequentially in the same shell

**Purpose:**
- Ensures the project is built before execution
- Guarantees a consistent runtime environment
- Preferred way to run WARDIAL from VS Code

---

### Notes on Environment Handling

VS Code tasks do **not** share environment state across tasks.
For this reason, `env.cmd`, `build.cmd`, and `run.cmd` are explicitly chained using `call`
within a single `cmd.exe` invocation.

Do not split these steps into separate tasks expecting environment variables to persist.

---

# VSCode Keybinding

This project remaps **Ctrl+F5** to run the WARDIAL build + run task.

Binding:
- Key: Ctrl+F5
- Command: workbench.action.tasks.runTask
- Task: Run: WARDIAL (build first)

Location:
- User-level keybindings file
  `C:\Users\<user>\AppData\Roaming\Code\User\keybindings.json`

Reason:
- VS Code does not support workspace-scoped keybindings.
- This ensures env.cmd → build.cmd → run.cmd runs in one shell.

