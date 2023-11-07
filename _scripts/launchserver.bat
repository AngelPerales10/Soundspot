@echo off

REM Replace name with your Virtual Machine
set VMName=""

REM This path should be the same path for you as well
set "VBoxManagePath=C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

REM Open the VirtualBox VM interface for a headless VM
"%VBoxManagePath%" startvm %VMName% --type separate

REM Optional: Add a delay to allow the VM interface to fully open
timeout /t 10
