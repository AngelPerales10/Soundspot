@echo off
set server_address=
set username=
set home_dir=D:\locationofsoundspot\soundspot\
set source_dir=D:\locationofsoundspot\soundspot\upload
set destination_dir=/home/yourusername/music

scp %source_dir%\*.mp3 %username%@%server_address%:%destination_dir%
