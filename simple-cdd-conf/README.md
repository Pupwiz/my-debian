# Simple-cdd configuration for custom Debian iso image with X11, i3 and software development tools.

## Status

## Motivation

This is my custom configuration of `simple-cdd` Debian tool. It's for my own
use - to create custom Debian installer iso image tailored for my personal
needs.  It contains packages, scripts and configs I usually put into any
freshly installed personal (desktop/laptop/VM) system for everyday use. It
should produce a completely usable system, ready to use after just adding some
personal data from backups into it. This is also a place where I'm going to
store my OS-specific settings under version control. It's not for general
public, I'm not going to support it via issue tracking etc. But I'm going to
put it into the public repository, so that anyone could fork it or borrow from
it. This solutions carefully picked up all over the internet and belong to
public domain.

[More motivation](MOTIVATION.md), which is mostly random notes for myself and
should be skipped by other people.

## How to use it

Fork and tailor for your own needs.

Image contains these profiles:

- `nick-i3-deb`: main profile, required to install custom packages and configs;
  other profiles are based on it and their installation could be broken without
  this profile;
- `vbox`: adds customizations for VirtualBox guest environment, as installation
  of VirtualBox Guest additions at first login;
- `laptop`: adds customizations for my laptop, as disk partitioning schema or
  packages to work with my laptop's hardware;

If no profile is selected during installation, then default netinstall will occur.

## What's needed

1. Debian on PC or in VM.  I installed it (from netinstall image) in VirtualBox
   on Mac OS X.
   
   VirtualBox can be installed with 
    
    brew cask install virtualbox
    brew cask install virtualbox-extension-pack

   Note: installation was not smooth, first attempt failed, I requested to
   enable extension at security page in the system preferences panel. Next 
   attempt was successful.

   It's convenient to use 2 VM - one to build and one to test installation.

2. On Debian I installed `mc` (get used to it), one convenient feature of it is
   `F9 > Left > Shell link...` menu, where `sh://nick@10.0.2.2` could be used
   to share folders with the host (with Debian as a VirtualBox guest) - no need
   to install vbox extensions in the guest system (but with them copying is
   much faster).

3. So, on guest Debian:

    sudo apt-get install mc vim build-essential debconf-utils dh-make dosfstools fakeroot mtools simple-cdd
    mkdir ~/my-cdd
    cd ~/my-cdd
    # Use mc or scp to copy files into my-cdd from this project.
    # See docs in `/usr/share/doc/simple-cdd` and `man simple-cdd`.
    # Alternatively, install `git` and use `git clone`.
    ./build

4. It requires several minutes to create an image within VM on my Mac mini.
   When it finish, the image will be in the `images` subfolder.
   This image can be used to install VM or can be used to make a bootable USB
   stick.

## Custom files

- `profiles`: contains custom profiles;
- `images`: is created by `simple-cdd` and contains result image;
- `tools`: contains customized script (part of the build), which copies custom extras;
- `build`: builds custom packages and than runs `simple-cdd` to create an image;
- `nick-i3-deb.conf`: config file for `simple-cdd`;
- `./custom_extras/cfg`: subdirectories of this dir will be `tar`'ed and stored
  at installation media directory `simple-cdd/cfg` (for example:
  `./custom_extras/cfg/foo/ -> /cdrom/simple-cdd/foo.tar`) and later unpacked to
  the target root dir; this is for general configuration (like console, grub,
  etc);
- `./custom_extras/pkg-src`: subdirectories of this dir will be converted to
  `deb` packages with `dh-make` and `dpkg-buildpackage` (script will take care
  of this);
- `./custom_extras/pkg`: temporary dir of packages, built from `pkg-src`, should
  not be put into version control;

## VirtualBox Guest Additions

In case of executing this image as a VirtualBox guest, I had an issues starting
Xorg. This is, probably, due xorg trying to load module, requiring vbox
additions. I created a script to start vbox guest additions at first login,
which should run automatically, but if something goes wrong, you may switch to
the second console with Alt+F2 and use it to install them manually.

Script will be in `/etc/skel/.bash_profile.postinst`.

## Make installation USB stick

Conveniently, `simple-cdd` creates an image suitable to be "burn" to the USB
drive with just terminal tools. I haven't try to do it in Linux yet, only on
Mac OS X.

Both Mac OS X and Linux can use similar method, so if it works on Mac, it
should work on Linux as well.

    # For Linux:
    sudo dd bs=4M if=input.iso of=/dev/sdX conv=fdatasync
    # For Mac OS X:
    sudo dd if=inputfile.img of=/dev/diskX bs=4m && sync

To check correct device name on Linux, I'd use `lsblk` (and `punmount sdX` to
unmount it). With Mac OS X it was not so trivial.  When I inserted my USB stick
into it, it complained that it cannot read it, and gives 3 buttons to choose.
Correct one was to "Ignore".  My USB had EXT4 partitions, so it could not be
mounted in Mac OS X. I had to open "Disk Utility" GUI app, to find out correct
device name.  Console app (`diskutil list`) did not show it, probably, I don't
know how to use it properly.

Note: `dd` is awfully slow! I used
[trick](http://daoyuan.li/solution-dd-too-slow-on-mac-os-x/) to complete
operation faster (notice `rdisk1` instead of `disk1`):

    sudo dd if=debian-9.3-amd64-CD-1.iso of=/dev/rdisk1 bs=4m && sync

It was a lot faster, than my first attempt with `disk1` (and produced working
bootable USB stick).  Another hint: `Ctrl+T` in the terminal shows some
progress of the `dd` command.

[This link](https://askubuntu.com/questions/220652/is-dd-command-taking-too-long)
suggests, that for Ubuntu (and Debian, I suppose) `dd` is also slow. Answerer
recommends to use `pv` instead. I've also seen suggestions to use even `cut`,
but haven't tested them yet.

## Links

1. file:///usr/share/simple-cdd/README (and profile samples)
2. http://silicone.homelinux.org/2013/06/19/building-a-custom-debian-cd/
3. https://computermouth.com/tutorials/custom-debian-distro-simple-cdd/
4. https://www.debian.org/releases/stable/i386/apb.html
5. https://shrimpworks.za.net/2015/03/29/clean-and-lean-debian-install-with-i3/
6. https://askubuntu.com/questions/598943/how-to-de-uglify-i3-wm
7. https://virtualboxes.org/doc/installing-guest-additions-on-debian/
8. https://askubuntu.com/questions/372607/how-to-create-a-bootable-ubuntu-usb-flash-drive-from-terminal
9. https://askubuntu.com/a/377561
10. https://askubuntu.com/questions/220652/is-dd-command-taking-too-long
11. http://daoyuan.li/solution-dd-too-slow-on-mac-os-x/
12. https://askubuntu.com/questions/542327/how-do-i-preseed-partman-recipe-two-disks
13. https://github.com/xobs/debian-installer/blob/master/doc/devel/partman-auto-recipe.txt
14. https://wikitech.wikimedia.org/wiki/PartMan/Auto
15. https://github.com/justwatchcom/gopass/blob/master/docs/setup.md
16. https://coderwall.com/p/d3uo3w/git-gpg-know-thy-commits
