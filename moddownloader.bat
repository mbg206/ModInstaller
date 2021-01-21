@echo off
set /p modResponse=Would you like to install the mods for the server? (Type y/n)
if %modResponse%==y goto download
exit

:download
for /f "tokens=4-7 delims=[.] " %%i in ('ver') do (if %%i==Version (set v=%%j.%%k) else (set v=%%i.%%j))
if %v%==6.2 goto win8
if %v%==6.3 goto win8
if %v%==10.0 goto win8
if %v%==6.1 goto win7
echo Your operating system is not supported! Press any key to exit.
pause >nul
exit

:win8
if not exist %appdata%/.minecraft/ goto noMC
call :start
echo Downloading (mod).
powershell -Command "Invoke-WebRequest http://www.example.com/package.zip -OutFile package.zip"
goto done

:win7
if not exist %appdata%/.minecraft/ goto noMC
call :start
echo Downloading (mod).
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://www.example.com/package.zip', 'package.zip')"
goto done

:start
if not exist %appdata%/.minecraft/mods/ mkdir %appdata%/.minecraft/mods/
mkdir oldMods
cd oldMods
move %appdata%/.minecraft/mods/* %cd%
cd %appdata%/.minecraft/mods/
cls
exit /b 0

:done
cls
echo Done. Press any key to exit.
pause >nul
exit

:noMC
echo You do not have Minecraft! Press any key to exit.
pause >nul
exit