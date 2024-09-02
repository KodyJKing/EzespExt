# premake-win-template

A template premake project for Windows console apps. Includes powershell scripts to compile and run on save.

## Requirements

- Powershell 7+
- Visual Studio 2022+
- MSBuild added to your PATH (included with Visual Studio)
    - Look under `C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin`

Premake5 is included in the repo, so you don't need to install it. If you want to use a global version of premake, replace the call to `scripts/vendor/premake5.exe` with `premake5` in `scripts/build.ps1`.

## Usage

To build once run `.\scripts\build.ps1`. 

To build and run on save run `.\scripts\watch_run.ps1`.

To build on save run `.\scripts\watch_build.ps1`.

You can write custom watch scripts by invoking `.\scripts\watch.ps1` with the desired arguments. See the `watch_run.ps1` and `watch_build.ps1` scripts for examples.
