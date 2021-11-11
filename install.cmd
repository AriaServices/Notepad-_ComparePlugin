@echo off

set pluginver=v2.0.0
set npp_x86=%ProgramFiles(x86)%\Notepad++
set npp_x64=%ProgramFiles%\Notepad++

tasklist /fi "imagename eq notepad++.exe" | findstr notepad
if "%ERRORLEVEL%" == "0" taskkill /im notepad++.exe

:: set 32 bit version
if exist "%npp_x86%" set plugindir=%npp_x86%\plugins\ComparePlugin
if exist "%npp_x86%" set pluginsrc=ComparePlugin_%pluginver%_x86

:: set 64 bit version
if exist "%npp_x64%" set plugindir=%npp_x64%\plugins\ComparePlugin
if exist "%npp_x64%" set pluginsrc=ComparePlugin_%pluginver%_X64

:: install plugin
echo Install plugin '%pluginsrc%' to '%plugindir%'
if not exist "%plugindir%" mkdir "%plugindir%"
robocopy /MIR "%~dp0%pluginsrc%" "%plugindir%" *.* /XF install.cmd
