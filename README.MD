# premake-win-template

A template premake project for Windows console apps. Includes powershell scripts to compile and run on save. This is intented for my personal use, but feel free to use it as a starting point for your own projects.

## Requirements

- Powershell 7+
- Visual Studio 2022+
- MSBuild added to your PATH (included with Visual Studio)
    - Look under `C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin`

Premake5 is included in the repo, so you don't need to install it. If you want to use a global version of premake, replace the call to `scripts/vendor/premake5.exe` with `premake5` in `scripts/build.ps1`.

## Usage

To build and run in watch mode, run 

```powershell
.\scripts\watch_run.ps1
```

If you have multiple projects, you can specify the project like this:
```powershell
.\scripts\watch_run.ps1 -Project "unit-test"
```

Or you can set a default in `config.ps1`:

```powershell
$Config_StartProject = "unit-test"
```

All directories under `/projects` are considered projects and are auto includded in the solution.

## Scripts

All scripts assume you are running from the root of the repository.

### `build.ps1`

Builds once.

Arguments:
- `-Config` Configuration to build. Values are `Debug` and `Release`. Default is `Debug`.
- `-IDE` IDE premake will generate project files for. Default is `vs2022`.

### `run.ps1`

Arguments:
- `-Config` Configuration to run. Values are `Debug` and `Release`. Default is `Debug`.
- `-Arguments` Arguments to pass to the launcher executable. Optional.

### `watch_build.ps1`

Builds on save.

Press `R` in the terminal to rebuild without waiting for a file change.

Arguments:
- Inherits from `build.ps1`.

### `watch_run.ps1`

Build and run on save.

Press `R` in the terminal to rebuild without waiting for a file change.

Arguments:
- Inherits from `build.ps1` and `run.ps1`.

### `clean.ps1`

Removes all build files.

### `watch.ps1`

Watches for file changes and runs a command.

Press `R` in the terminal to rebuild without waiting for a file change.

Arguments:
- `-watchPath`: Path to watch for changes.
- `-command`: Command to run on change.
- `-extensions`: Extensions to watch for changes. Default is `.cpp, .hpp, .c, .h, .lua, .ps1, .bat, .rc`.
- `-ignorePaths`: Paths to ignore. Default is `.\build`.