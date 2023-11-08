
<div align="center">

<img src=".\webshortcut\icon.png" alt="image" width="225" height="auto">

# SoundSpot:

Music server toolkit to automate downloading and locally hosting your Spotify and Soundcloud songs using scripting, VirtualBox, and Navidrome. <br>
</div>

## Table of Contents
* ### 1. Info Section
* ### 2. Server Section

## -- INFO SECTION --

### Folder Structure
* ./_scripts = All scripts
* ./soundcloud-downloader = Clone of: [Soundcloud-downloader](https://github.com/flyingrub/scdl) tool.
* ./spotfify-downloader = Clone of: [Spotfify-downloader](https://github.com/spotDL/spotify-downloader) tool.
* ./upload = Where songs are sent once downloaded.
* ./uploaded_songs = Folder to backup songs that are downloaded and transfered.
* ./webshortcut = Local Web UI that you can bookmark to easily navigate to any music platform, including your own.
* **link.txt** = where you put all the links for your soundcloud and spotify songs that you wish to download.
* ``main.bat`` = Main batch file that allows you to Launch or Kill server, Transfer songs, Archieve songs, or open the Web UI.
---

### Files that need user input prior to running:
To automate everything on your specefic server / machine, we need to change some file directory configurations. <br>
Remember, Python uses double backslashes to locate a file directory.
<br><br>
Before anything, __clone the tools by Flying Grub and SpotDL__ in the main SoundSpot folder. Have them replace the currently empty placeholder folders for these tools. I do not own these tools, so they must be cloned from their rightful creators: <br>
[Soundcloud-downloader](https://github.com/flyingrub/scdl) tool.
[Spotify-downloader](https://github.com/spotDL/spotify-downloader) tool. <br><br>
__Make sure you follow the author's documentation to make sure you have the proper requirements to run these tools.__<br><br>
__archieve.py__
- source_folder (full directory location of ./upload. For example: "D:\\\visualstudio\\\vscodeprojects\\\soundspot\\\upload")
- destination_folder (full directory location of ./upload_songs. For example: "D:\\\visualstudio\\\vscodeprojects\\\soundspot\\\uploaded_songs")

__killserver.bat__
- VMName (name of the VM you are using to host your music)
- VBoxManagePath (default path should be same on your system)

__launchserver.bat__
- VMName (name of the VM you are using to host your music)
- VBoxManagePath (default path should be same on your system)

__scrapelikes.py__
- source_folder (location where this SoundSpot script is located. For example: "D:\\\visualstudio\\\vscodeprojects\\\soundspot\\\\_scripts")
- destination_folder (upload folder location. For example: "D:\\\visualstudio\\\vscodeprojects\\\Soundspot\\\upload")
- file path (where link.txt is located. For example: "D:\\\visualstudio\\\vscodeprojects\\\Soundspot\\\link.txt")

__sshtransfer.bat__
- server_address (IP address to your server. For example: 192.168.1.242)
- username (username on music server)
- home_dir (location of soundspot. For example: D:\visualstudio\vscodeprojects\soundspot\)
- source_dir (where uploaded songs are that will be qued for transfer. For example: D:\visualstudio\vscodeprojects\soundspot\upload)
- destination_dir (Navidrome music folder that was set through your docker setting. For example: /home/user/music)

__webnav.ps1__
- $websiteURL (put your directory's full path that leads to soundspot/webshortcut/shortcuts.html)

__shorcuts.html__
- Under Main Applications and Playlists, put the address of your server as well as any direct links you'd want to easily navigate to.


## -- SERVER SECTION --

### Installation and Usage With Server

1. Clone the repository: `https://github.com/AngelPerales10/Soundspot.git`
2. Navigate to the project directory
3. Collect your links and add them to link.txt
4. Configure directory links within the scripts as mentioned above
5. Set up server (explained in this section)
6. Run ```main.bat```
7. Choose to Launch or Kill server, Transfer songs, Archieve songs, or open the Web UI.
<br>
<img src=".\webshortcut\files\command.png" alt="image" width="auto" height="auto">
<br>
For more info, and more customization options on how your songs are displayed, visit the [NavidromeDocumentation](https://www.navidrome.org/docs/usage/) .

---
### Installation and Usage Without Server
Just want to download songs?
1. Clone the repository: `https://github.com/AngelPerales10/Soundspot.git`
2. Navigate to the project directory
3. Collect your links and add them to link.txt
4. Configure directory links only for ```scrapelikes.py```
5. Run that Python script.
6. Enjoy.

### Web UI Feature:
<img src=".\webshortcut\files\soundspotss.png" alt="image" width="auto" height="auto">
Code provided as a base to customize a Web UI for direct links to all music resources. Add features you wish you had better access to.

---

## Setting Up Navidrome Server



1. Select and install OS / distro that you would like to use to host your server (personally used Ubunutu Server)
2. Be sure to make a sudo user for yourself as well as update and upgrade your freshly installed server: (_commands may vary depending on your distro due to having different package managers_)
```
apt update && apt upgrade -y
```
3. Install Docker and Docker Compose
```
sudo apt install docker
```
```
sudo apt install docker-compose
```

4. Create and configure a file named `config.yaml`  to have the following settings:

[Navidrome Docker Config:](https://hub.docker.com/r/deluan/navidrome) <br>
```
version: "3"
services:
  navidrome:
    image: deluan/navidrome:latest
    ports:
      - "4533:4533"
    environment:
      # Optional: put your config options customization here. Examples:
      ND_SCANSCHEDULE: 1h
      ND_LOGLEVEL: info  
      ND_BASEURL: ""
    volumes:
      - "./data:/data"
      - "/path/to/your/music/folder:/music:ro"
```
(Just copy and past this in the config file)

5. Edit the 'volumes' path above to have the proper directory path on your machine that will host the data and music. <br>
Example: <br>
```
/home/user/data:/data 
/home/user/music/:/music:ro 
```
6. Modify music folder to allow read AND write permissions
```
sudo chmod 777 /home/youruser/music
```
7. Run Docker
```
sudo docker-compose up -d
```
8. Finished! Now just connect to your server's IP through your web browser.
<br><br>
<img src=".\webshortcut\files\naviscreenshot.png" alt="image" width="800" height="auto">
<br>

---

__Extra Tips__ <br>
To view the container to see if it's running / port number, use this command:
```
sudo docker container ls -a
```
To view what IP address is being used to connect to the server use this command:
```
ip address | grep 192
```

---

### Gone through the guide and still can't figure this out?
[Watch this video](https://www.youtube.com/watch?v=RSIvuyLDuvk)

---

## How to Connect To Server
Once your server is up and running, connect through your web broswer and type in the server's IP address followed by the port number. <br>
For example: 
```
192.168.1.242:4533
```
---

## Accessing Server Using Desktop / Phone Application
Here as some options that you can use to access your server through your phone or desktop using better looking applications instead of the Navidrome web interface: 

**Desktop:**<br>
[Sonixd](https://github.com/jeffvli/sonixd) (spotify-like display)<br>
**Phone:**<br>
Substreamer (Apple) <br>
dsub (Android) <br>

(There are many other options you can use for phone if you don't like these)

---

Credit:<br>
[FlyingGrub](https://github.com/flyingrub/) for Soundcloud Downloader<br>
[SpotDL](https://github.com/spotDL) for Spotify Downloader
