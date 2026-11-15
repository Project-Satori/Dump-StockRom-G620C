@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

net session >nul 2>&1
if not "%errorlevel%"=="0" (
    echo ask for Admin...
    powershell -NoProfile -Command "try { Start-Process -FilePath '%~f0' -Verb RunAs -ErrorAction Stop } catch { exit 1 }"
    if errorlevel 1 (
        echo [Cancelled] no Admin
        pause
    )
    exit /b
)

set WPATH=%~dp0
set BCD=%WPATH%\EFIESP\EFI\Microsoft\Boot\BCD
set BOOTARM=%WPATH%\EFIESP\EFI\BOOT\bootarm.efi
set DBG2_TAB=%WPATH%\PLAT\ACPI\dbg2.acp

echo "Finish debug double-Edit"
bcdedit /store %BCD% /bootdebug {bootmgr} off
bcdedit /store %BCD% /bootdebug {default} off
bcdedit /store %BCD% /debug {default} on
rem "bcdedit /store %BCD% /dbgsettings serial baudrate:115200 debugport:1"

bcdedit /store %BCD% /dbgsettings usb targetname:KDUSB01

rem "bcdedit /store %BCD% /dbgsettings net HOSTIP:169.254.255.255 PORT:50000 KEY:1.2.3.4"
rem "bcdedit /store %BCD% /set {dbgsettings} dhcp off"
bcdedit /store %BCD% /set {default} dbgtransport kdusb.dll
bcdedit /store %BCD% /set {dbgsettings} busparams 2

bcdedit /store %BCD% /set {default} testsigning on
bcdedit /store %BCD% /set {default} nointegritychecks on

bcdedit /store %BCD% /set {bootmgr} testsigning on
bcdedit /store %BCD% /set {bootmgr} nointegritychecks on

echo "Enable bootmenu"
bcdedit /store %BCD% /set "{bootmgr}" displaybootmenu off
bcdedit /store %BCD% /set "{bootmgr}" timeout 5
bcdedit /store %BCD% /deletevalue "{bootmgr}" customactions
bcdedit /store %BCD% /deletevalue "{bootmgr}" custom:54000001
bcdedit /store %BCD% /deletevalue "{bootmgr}" custom:54000002
bcdedit /store %BCD% /displayorder "{default}" "{0ff5f24a-3785-4aeb-b8fe-4226215b88c4}" "{bd8951c4-eabd-4c6f-aafb-4ddb4eb0469b}"

echo "Enable MISC"
bcdedit /store %BCD% /set {globalsettings} booterrorux Legacy
bcdedit /store %BCD% /set {globalsettings} chargethreshold 0

@echo "Enum BCD"
bcdedit /store %BCD% /enum {globalsettings}
bcdedit /store %BCD% /enum {dbgsettings}

@echo "Finish ACPI/BCD/BOOTARM.efi Sync"
rem "fattools cp %DBG2_TAB% %WPATH%\PLAT.bin\ACPI\"
fattools cp %BCD% %WPATH%\EFIESP.bin\EFI\Microsoft\Boot\
fattools cp %BOOTARM% %WPATH%\EFIESP.bin\EFI\Boot\



@PAUSE
