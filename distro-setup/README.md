# Distro setup toolbox

This is a simple Bash script collection to install some basic utilities to make a default system more useful. 

## Distro dependent

Each script is designed to a specific distro. Some of them already have some tools, others don't. One good example is that Atomic distros already come with Flatpak preinstalled, while others more robust don't.

### archinstall.sh

Contains (for now) a laboratory to a future migration to Arch Linux

## agnostic.sh

The binaries & tools that do not require a specific distro nor a single package manager. This includes extra packages managers as well, such Brew and Flatpak

### brew.sh

Install Brew Package manager main binaries and some useful cli tools, currently: 

- OneDrive CLI 
- Composer PHP Package Manager
- GitHub CLI
- Yarn
- Atuin + Starship plugins

### flatpak.sh

Install Flatpak binaries from many categories, mostly system tools, some note taking apps and my personal choice of desktop tools. **Some** of them are: 

#### Tools
- Zen Browser
- Calibre 
- Betterbird
- AddWater to Firefox

#### Note taking

- Obsidian
- Iotas
- Buffer

#### System

- Mission Center, Flatseal, Warehouse, Extension Manager and Menu Editor
- PDF, ZIP and Emoji tools
- GearLever AppImage manager
- Pika Backup
- Develpment tools (tunneling, formatter, etc)
