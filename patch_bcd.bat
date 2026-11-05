@echo off

set WPATH=%~dp0
set BCD=%WPATH%\EFIESP\EFI\Microsoft\Boot\BCD
set BOOTARM=%WPATH%\EFIESP\EFI\BOOT\bootarm.efi

bcdedit /store %BCD% /bootdebug {bootmgr} on
bcdedit /store %BCD% /debug {default} on
bcdedit /store %BCD% /dbgsettings serial baudrate:115200 debugport:1

bcdedit /store %BCD% /set {default} testsigning on
bcdedit /store %BCD% /set {default} nointegritychecks on

bcdedit /store %BCD% /set {bootmgr} testsigning on
bcdedit /store %BCD% /set {bootmgr} nointegritychecks on
@echo "Finish BCD Edit"

bcdedit /store %BCD% /enum {bootmgr} 
bcdedit /store %BCD% /enum {default} 
bcdedit /store %BCD% /enum {dbgsettings} 
@echo Enum BCD Edit"


fattools cp %BCD% %WPATH%\EFIESP.bin\EFI\Microsoft\Boot\
@echo "Finish FAT Sync
fattools cp %BOOTARM% %WPATH%\EFIESP.bin\EFI\Boot\
@echo "Finish EFI Sync

@PAUSE