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


@echo "TO BDS"
bcdedit /store %BCD% /set "{bootmgr}" path \efi\boot\bootarm.efi.bak

copy %WPATH%\EFIESP\EFI\Boot\bootarm.efi %WPATH%\EFIESP\EFI\Boot\bootarm.efi.bak
fattools rm %WPATH%\EFIESP.bin\EFI\Boot\bootarm.efi
fattools cp %WPATH%\EFIESP\EFI\Boot\bootarm.efi.bak %WPATH%\EFIESP.bin\EFI\Boot\

@PAUSE