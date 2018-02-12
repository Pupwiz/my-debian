# How to prepare custom Debian image

## Motivation

- minimal system, starting from netinstall image;
- i3wm, no gnome/KDE/LXCDE/etc;
- all my favorite packages included;
- fast install at any PC, laptop or VM and continue my work;
- firewall, apparmor, ssh protection, other security options included;
- my personal settings, config files, browser plugins included;
- my locale and keyboard settings included;
- printer/scanner drivers;
- my personal scripts, backup solution;
- only choose partitions during installation, all other choises provided;
- build packages from sources during setup?
- after setup: sync fresh files from backup and ready to go;

## What's needed

1. Debian on PC or in VM.  I installed it in VirtualBox on Mac OS X.
   VirtualBox can be installed with 
    
    brew cask install virtualbox
    brew cask install virtualbox-extension-pack

   Note: installation was not smooth, first attempt failed, I requested to
   enable extension at security page in the system preferences panel. Next 
   attempt was successful.

   It's convenient to install 2 VM - one to build and one to test installation.

2. On Debian I installed `mc` (get used to it), one convenient feature of it is
   `F9 > Left > Shell link...` menu, where `sh://nick@10.0.2.2` could be used
   to share folders with the host (with Debian as a VirtualBox guest) - no need
   to install vbox extensions in the guest system.

3. So, on guest Debian:

    sudo apt-get install mc vim simple-cdd dh-make debconf-utils
    mkdir ~/my-cdd
    cd ~/my-cdd
    # Use mc or scp to copy files into my-cdd from this project.
    # See docs in `/usr/share/doc/simple-cdd` and `man simple-cdd`.
    # Alternatively, install `git` and use `git clone`.
    ./build

## Custom files

- `./custom_extra/cfg`: subdirectories of this dir will be `tar`'ed and stored
  at installation media directory `simple-cdd/cfg` (for example:
  `./custom_extra/cfg/foo/ -> /cdrom/simple-cdd/foo.tar`) and later unpacked to
  the target root dir; this is for general configuration (like console, grub,
  etc);
- `./custom_extra/pkg-src`: subdirectories of this dir will be converted to
  `deb` packages with `dh-make` and `dpkg-buildpackage` (script will take care
  of this);
- `./custom_extra/pkg`: temporary dir of packages, built from `pkg-src`, should
  not be put into version control;

## VirtualBox Guest Additions

In case of executing this image as a VirtualBox guest, I had an issues starting
Xorg. This is, probably, due xorg trying to load module, requiring vbox
additions.  At least, it can be cured with installation of guest additions, so
I put the script to install them into default user's profile.

So, if you cannot login into the first console after OS installation, due X
errors, use Alt+F2 to login into the second console and run script from there.
Script should be in the user's home dir: `~/install-vb-guest-additions`.

## Links

1. http://silicone.homelinux.org/2013/06/19/building-a-custom-debian-cd/
2. https://computermouth.com/tutorials/custom-debian-distro-simple-cdd/
3. https://www.debian.org/releases/stable/i386/apb.html
4. https://shrimpworks.za.net/2015/03/29/clean-and-lean-debian-install-with-i3/
5. https://virtualboxes.org/doc/installing-guest-additions-on-debian/
