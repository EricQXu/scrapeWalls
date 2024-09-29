# Welcome to scrapeWalls!
## Description
I think it's obvious enough if you look at the filenames. If you're out of the loop, go watch The Friday Checkout's YouTube Video titled "Damn, Zuck did it!" at timestamp 8:08. The OP's code didn't work for me, so I re-wrote it. I also wrote a bash version to accomodate those folks with a Mac or a PC running Linux. Also, I highly recommend supporting the creator discussed in the video regardless of the situation. This repo here is only for demonstration purposes and there is no need to be so harsh on him. :)
## Installation
### Windows
Open Terminal (or Powershell if on Windows 10 or older) and execute the following commands:
1. `cd Downloads`
2. `git clone https://github.com/EricQXu/scrapeWalls` (or alternatively download scrapeMkbhdWallpapers.ps1 from the [releases page](https://github.com/EricQXu/scrapeWalls/releases/latest))
3. `cd ./scrapeWalls` (skip if you did the alternate step for step 1)
4. `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser`
5. `./scrapeMkbhdWallpapers.ps1`
6. `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Linux and macOS
 Open Terminal (or any terminal emulator of your choice) and execute the following commands:
 1. `cd Downloads`
 2. `git clone https://github.com/EricQXu/scrapeWalls` (or alternatively download scrapeMkbhdWallpapers.sh from the [releases page](https://github.com/EricQXu/scrapeWalls/releases/latest))
 3. `./scrapeWalls` (skip if you did the alternate step for step 1)
 4. `which bash`
 5. `cat scrapeMkbhdWallpapers.sh`
 6. Check if the first shebang line after #! matches your bash directory in step 3. If not, open scrapeMkbhdWallpapers.sh and edit it to match what was shown in step 3, then save it.
 7. `chmod +x scrapeMkbhdWallpapers.sh`
 8. `./scrapeMkbhdWallpapers.sh`
 
 ### Android, iOS, and iPadOS (untested)
**Note: This is untested. It may or may not work. The assetsDir and downloadDir variables in the script may need to be modified to accomodate the file structure of those mobile operating systems.**<br><br>
 If it is on Android, then download [Termux](https://github.com/termux/termux-app/releases/latest), an open-source terminal emulator for Android. Because of Google Play Store policy limitations, it is recommended to sideload the APK of the app or sourcing it from F-Droid instead of from the Play Store. Then, follow the Linux/macOS instructions guide. <br><br> If it is on iOS/iPadOS, then download [a-Shell](https://apps.apple.com/us/app/a-shell/id1473805438?uo=4) on the App Store, a jailbreak-free terminal emulator app. Then, follow the Linux/macOS intructions guide. If that doesn't work, a jailbreak may be needed. If so, first jailbreak your iDevice by following tutorials that you can find online, then install [NewTerm](https://github.com/hbang/NewTerm) or any other terminal emulator of your choice, lastly follow the Linux/macOS instructions. In theory, a jailbreak is not needed, but I have not tested this yet.

## Wallpapers Download Directory
By default, wallpapers are downloaded to /mkbhdWallpapers/assets folder under your Downloads folder. For future reference, the JSON database is downloaded to /mkbhdWallpapers folder under your Downloads folder. You can change this yourself in the script for the assetsDir and downloadDir, respectively.
