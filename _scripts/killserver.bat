@echo off
set VMName=""
set "VBoxManagePath=C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

REM Stop the Virtual Machine
"%VBoxManagePath%" controlvm %VMName% acpipowerbutton

REM Wait for the virtual machine to shut down
timeout /t 10

REM You can add other commands or operations here
