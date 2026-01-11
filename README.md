# Wardialer
A real deal wardialer patterned around 1985 for the Apple IIe


# WARDIAL VS Code Keybinding

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

