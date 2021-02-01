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
echo Downloading...
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2902/920/coroutil-1.12.1-1.2.37.jar -OutFile coroutil-1.12.1-1.2.37.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2596/867/weather2-1.12.1-2.6.12.jar -OutFile weather2-1.12.1-2.6.12.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2679/314/desirepaths-1.12.1-1.2.8.jar -OutFile desirepaths-1.12.1-1.2.8.jar"
powershell -Command "Invoke-WebRequest https://coros.us/mods/modsystem/dl/skylanterns-1.12.1-1.0.1.jar -OutFile skylanterns-1.12.1-1.0.1.jar"

powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2916/310/obfuscate-0.4.2-1.12.2.jar -OutFile obfuscate-0.4.2-1.12.2.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2749/993/furniture-6.3.1-1.12.2.jar -OutFile furniture-6.3.1-1.12.2.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2967/287/vehicle-mod-0.44.1-1.12.2.jar -OutFile vehicle-mod-0.44.1-1.12.2.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2854/400/guns-0.15.3-1.12.2.jar -OutFile guns-0.15.3-1.12.2.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2564/790/device-mod-0.4.1-1.12.2.jar -OutFile device-mod-0.4.1-1.12.2.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2864/603/backpacked-1.4.2-1.12.2.jar -OutFile backpacked-1.4.2-1.12.2.jar"

powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2799/213/SereneSeasons-1.12.2-1.2.18-universal.jar -OutFile SereneSeasons-1.12.2-1.2.18-universal.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2715/506/BiomesOPlenty-1.12.2-7.0.1.2441-universal.jar -OutFile BiomesOPlenty-1.12.2-7.0.1.2441-universal.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2644/656/FamiliarFauna-1.12.2-1.0.11.jar -OutFile FamiliarFauna-1.12.2-1.0.11.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3105/281/DynamicTrees-1.12.2-0.9.21.jar -OutFile DynamicTrees-1.12.2-0.9.21.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3092/963/DynamicTreesBOP-1.12.2-1.4.4.jar -OutFile DynamicTreesBOP-1.12.2-1.4.4.jar"

powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2894/304/mcw-bridges-1.0.4-mc1.12.2.jar -OutFile mcw-bridges-1.0.4-mc1.12.2.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2879/573/mcw-roofs-1.0.2-mc1.12.2.jar -OutFile mcw-roofs-1.0.2-mc1.12.2.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3137/850/railstuff-0.2.5.jar -OutFile railstuff-0.2.5.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3150/983/trafficcontrol-0.3.5.jar -OutFile trafficcontrol-0.3.5.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3173/796/Xaeros_Minimap_21.1.0_Forge_1.12.jar -OutFile Xaeros_Minimap_21.1.0_Forge_1.12.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3173/808/XaerosWorldMap_1.11.8_Forge_1.12.jar -OutFile XaerosWorldMap_1.11.8_Forge_1.12.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2577/418/rebindnarrator-1.0.jar -OutFile rebindnarrator-1.0.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3015/79/AdvancedRocketry-1.12.2-1.7.0-232-universal.jar -OutFile AdvancedRocketry-1.12.2-1.7.0-232-universal.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/2954/91/Gems+and+Crystals-1.12.2-1.2.7.4.jar -OutFile Gems+and+Crystals-1.12.2-1.2.7.4.jar"
powershell -Command "Invoke-WebRequest https://media.forgecdn.net/files/3169/324/anvilpatch-1.0.1.jar -OutFile anvilpatch-1.0.1.jar"
goto done

:win7
if not exist %appdata%/.minecraft/ goto noMC
exit
call :start
echo Downloading...
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://www.example.com/package.zip', 'package.zip')"
goto done

:start
if not exist %appdata%/.minecraft/mods/ mkdir %appdata%/.minecraft/mods/
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
