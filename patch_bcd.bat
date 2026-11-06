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

echo "Finish debug double-Edit"
bcdedit /store %BCD% /bootdebug {bootmgr} off
bcdedit /store %BCD% /bootdebug {default} on
bcdedit /store %BCD% /debug {default} on
bcdedit /store %BCD% /dbgsettings serial baudrate:115200 debugport:1

bcdedit /store %BCD% /set {default} testsigning on
bcdedit /store %BCD% /set {default} nointegritychecks on

bcdedit /store %BCD% /set {bootmgr} testsigning on
bcdedit /store %BCD% /set {bootmgr} nointegritychecks on

echo "Enable bootmenu"
bcdedit /store %BCD% /set "{bootmgr}" displaybootmenu off
bcdedit /store %BCD% /set "{bootmgr}" timeout 10
bcdedit /store %BCD% /deletevalue "{bootmgr}" customactions
bcdedit /store %BCD% /deletevalue "{bootmgr}" custom:54000001
bcdedit /store %BCD% /deletevalue "{bootmgr}" custom:54000002
bcdedit /store %BCD% /displayorder "{default}" "{0ff5f24a-3785-4aeb-b8fe-4226215b88c4}" "{bd8951c4-eabd-4c6f-aafb-4ddb4eb0469b}"
bcdedit /store %BCD% /set {globalsettings} booterrorux Legacy

@echo "Enum BCD"
bcdedit /store %BCD% /enum all

@echo "Finish FAT/EFI Sync"
fattools cp %BCD% %WPATH%\EFIESP.bin\EFI\Microsoft\Boot\
fattools cp %BOOTARM% %WPATH%\EFIESP.bin\EFI\Boot\

@echo "Dup the bootmgr, permit the BDS-Shell"
bcdedit /store %BCD% /set "{bootmgr}" path \efi\boot\bootarm.efi
copy %WPATH%\EFIESP\EFI\Boot\bootarm.efi %WPATH%\EFIESP\EFI\Boot\bootarm.efi.bak
rem "fattools rm %WPATH%\EFIESP.bin\EFI\Boot\bootarm.efi"
fattools cp %WPATH%\EFIESP\EFI\BOOT\bootarm.efi.bak %WPATH%\EFIESP.bin\EFI\Boot\


@PAUSE
