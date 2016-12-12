# Github Release Asset Downloader

ghradl is a bash script for downloading release assets from Github repositories. You can also use it to list available assets on releases.

## Github Release Assets

A release in Github is an overloaded term. Github calls every git tag in a repository a release. In addition to the tagged release, you can create a [Github release](https://help.github.com/articles/about-releases/) which allows you to publish additional info and assets about it. Release assets are useful on projects that compile to a platform for example since it allows maintainers to publish pre-compiled binaries.

## Install

Clone this repository and either add `ghradl/bin` to your path or call the `ghradl` script directly to use it.

## Dependencies

- [jq](https://stedolan.github.io/jq/)
- curl

## Usage Examples

List all assets of the latest release:

```sh
$ ghradl -l electron electron

Release: electron v1.4.12
Tag: v1.4.12
Assets:
electron-api.json
electron-v1.4.12-darwin-x64-dsym.zip
electron-v1.4.12-darwin-x64-symbols.zip
electron-v1.4.12-darwin-x64.zip
electron-v1.4.12-linux-arm-symbols.zip
electron-v1.4.12-linux-arm.zip
electron-v1.4.12-linux-armv7l-symbols.zip
electron-v1.4.12-linux-armv7l.zip
electron-v1.4.12-linux-ia32-symbols.zip
electron-v1.4.12-linux-ia32.zip
electron-v1.4.12-linux-x64-symbols.zip
electron-v1.4.12-linux-x64.zip
electron-v1.4.12-mas-x64-dsym.zip
electron-v1.4.12-mas-x64-symbols.zip
electron-v1.4.12-mas-x64.zip
electron-v1.4.12-win32-ia32-pdb.zip
electron-v1.4.12-win32-ia32-symbols.zip
electron-v1.4.12-win32-ia32.zip
electron-v1.4.12-win32-x64-pdb.zip
electron-v1.4.12-win32-x64-symbols.zip
electron-v1.4.12-win32-x64.zip
ffmpeg-v1.4.12-darwin-x64.zip
ffmpeg-v1.4.12-linux-arm.zip
ffmpeg-v1.4.12-linux-armv7l.zip
ffmpeg-v1.4.12-linux-ia32.zip
ffmpeg-v1.4.12-linux-x64.zip
ffmpeg-v1.4.12-mas-x64.zip
ffmpeg-v1.4.12-win32-ia32.zip
ffmpeg-v1.4.12-win32-x64.zip
SHASUMS256.txt
```

Filter down to the assets you want:

```sh
$ ghradl -la "electron.*linux" electron electron

Release: electron v1.4.12
Tag: v1.4.12
Assets:
electron-v1.4.12-linux-arm-symbols.zip
electron-v1.4.12-linux-arm.zip
electron-v1.4.12-linux-armv7l-symbols.zip
electron-v1.4.12-linux-armv7l.zip
electron-v1.4.12-linux-ia32-symbols.zip
electron-v1.4.12-linux-ia32.zip
electron-v1.4.12-linux-x64-symbols.zip
electron-v1.4.12-linux-x64.zip
```

Download them to a directory:

```sh
$ ghradl -a "electron.*linux" -o ~/Downloads/electron electron electron
$ ls ~/Downloads/electron/
electron-v1.4.12-linux-arm-symbols.zip    electron-v1.4.12-linux-ia32-symbols.zip
electron-v1.4.12-linux-arm.zip            electron-v1.4.12-linux-ia32.zip
electron-v1.4.12-linux-armv7l-symbols.zip electron-v1.4.12-linux-x64-symbols.zip
electron-v1.4.12-linux-armv7l.zip         electron-v1.4.12-linux-x64.zip
```

See `ghradl -h` for more options.

## My Use Case

I keep [GPMDP](https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-) updated on Ubuntu with [ghradl and another install script](https://github.com/samiconductor/ghradl-use-case).
