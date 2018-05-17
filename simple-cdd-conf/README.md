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

## Steps to build an image

There are several options how to build image:

- You may use existing Debian host and run `./build` on it.
- You may run it in the VirtualBox as described below.
- You may run it in the Docker container on Mac/Linux.

### Docker variant

Docker variant should be faster and more convenient, as it does not require
manual intervention.

Just execute script `./build-in-docker`.

Be prepared to wait ~20-30 minutes first time, or even more, while it downloads
all required packages. Keep `./tmp` folder (it contains cache) in case you'll
need to rebuild it later. Next time it'll take much less (~5-10 min).

Result goes into `./images`.

### VirtualBox variant

1. Debian on PC or in VM is required.  I installed it (from netinstall image)
   in VirtualBox on Mac OS X.
   
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
drive with just terminal tools. I haven't try to do it in Linux yet (this
particular image), only on Mac OS X.

Both Mac OS X and Linux can use similar method, so if it works on Mac, it
should work on Linux as well (though, [Ubuntu offers convenient GUI tool just
for it](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu#0)).
BTW, Ubuntu has [tutorial for Mac](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-macos#0),
which might work with this image too, but I have not tried it myself.

    # For Linux (replace X with the letter of the disk):
    lsblk
    pumount sdX
    sudo dd bs=4M if=debian-9.4-amd64-DVD-1.iso of=/dev/sdX conv=fdatasync

    # For Mac OS X (replace X with the number of the disk):
    diskutil list
    diskutil unmountDisk /dev/diskX
    sudo dd if=debian-9.4-amd64-DVD-1.iso of=/dev/rdiskX bs=4m && sync

With Mac OS X this process can be quite painful.  When Mac detects USB stick
and shows dialog with 3 buttons, complaining that it cannot use it, correct one
is to "Ignore".  If `diskutil list` doesn't show disk, "Disk Utility" GUI app
might help.

Note: `dd` is awfully slow! I used
[trick](http://daoyuan.li/solution-dd-too-slow-on-mac-os-x/) to complete
operation faster (notice `rdiskX` instead of `diskX`).  It was a lot faster,
than my first attempt with `disk1` (and produced working bootable USB stick).
Another hint: `Ctrl+T` in the terminal shows some progress of the `dd` command.

[This link](https://askubuntu.com/questions/220652/is-dd-command-taking-too-long)
suggests, that for Ubuntu (and Debian, I suppose) `dd` is also slow. Answerer
recommends to use `pv` instead. I've also seen suggestions to use even `cut`,
but haven't tested them yet.

See also [this](https://gist.github.com/jordelver/3139365) and
[this](https://apple.stackexchange.com/questions/270514/macos-sierra-dd-to-usb-is-very-slow-and-cant-seem-to-use-dev-rdisk/270562).

__UPDATE__: Trick above (with raw disk) worked for me once, before some Mac OS
X updates. Today I tried to use it again and it did not work, left some binary
garbage in the text files. Old USB stick, I used with it before, it won't write
again at all (some IO errors). I ended up with `dd .. of=/dev/diskX`.

FYI: it took ~2.5 hours to complete on Mac OS X without raw disk trick with
image size ~1G.

## Installation

Installation starts in a usual way from USB stick or `iso` image mounted to VM.

Choose "Install" or "Graphical Install" in the installer's menu to start
preseeded installation.

Most answers will be preseeded from the profile. Still, you'll need to answer
(or confirm default answer) on some questions. Namely:

- keyboard shortcut to switch keyboard language layout;
- user login, real name and password;
- custom profiles to install.

Note, that there will be no question about timezone. If you need, either amend
preseed file manually or change timezone after installation completes.

Custom profiles allow to choose partitioning scheme, packages and some options
depending on target environment (VM/laptop).

You should always chose to install `nick-i3-deb` profile (only basic system
will be installed without it, without any customizations; also, post-install
automation will not work).

You may choose one of `laptop` or `vbox` profiles. They just install different
sets of packages. For example, `laptop` will install hardware-related packages
and `vbox` will automatically start installation of VirtualBox Additions on
first boot.

You should choose one of `partman-*` profiles. Without any of these profiles
preseeded installation will most likely fail to partition disks. There is no
way to bypass `partman-auto` script during installation and without any
preseeded configuration it usually hangs in the menu loop - returns to the
partitioning menu after any of your choice and make no further progress.

`partman-sda-atomic` profile is to install system into single root partition on
`sda` drive (no separate partitions for `/home` etc). It is usually useful in
companion with `vbox` profile.

`partman-2-disk` profile is to be used on laptop with 2 disks: SDD being `sda`
and `HDD` being `sdb`. It creates separate `efi`, `boot` and `root` partitions
on the SDD and `swap`, `tmp`, `home` and `backup` partitions on the HDD. It
uses LVM partitions where it makes sense and formats all partitions.

`partman-2-disk-keep` profile is not actually a `partman-auto` invocation, but
my custom workaround to bypass `partman-auto` with it's limitation and preserve
existing `home` and `backup` partitions. Script assumed that existing
partitions were previously created with `partman-2-disk` scenario (partitions
and LVM names are hardcoded). It is very basic and does not support any other
partitioning scheme. It mounts all partitions for installer be able to continue
and erases their content (except `home`). It also preserves `/etc/fstab`. So,
to use it partitions and `/etc/fstab` should not be corrupted. Though it will
not erase content of `home`, but it will run post-installation script on it.
To be on the safe side, it's better to backup all data. Main use case of this
scenario is to completely reinstall system (for example - clean upgrade)
without need to restore all the data from external backup drive afterward. So,
all `/`, `/boot`, `/var`, etc will be erased.  Also, keep in mind that
post-install scripts are written in assumption of clean install and may not
work as expected on the altered `home` directory. My tests shows, that Debian
refuses to copy skeleton files into existing user's directory.  So, scripts
will not run on first boot after installation (and, probably, for good). You
may want to run them (or some portions of them) manually, copying them from
`/etc/skel`. For example, VirtualBox Addons installation will not be started
automatically in this case. And, because of that, Xorg may fail to start due
lack of driver.  To repair it, you may need to login via `tty2` (Alt-F2), and
run scripts from there.  Yet another caveat: you may need to fix `/etc/fstab`
after installation, as line will be added by script to fix issue with `apt`
unable to find cdrom.

Currently I do not need any other partitioning scheme. To add a new one use
existing ones as an example.

### Installation options (combinations of profiles)

To put it simple, here are my usual combinations of profiles for various needs.

#### VirtualBox, general use

Default settings for Debian in vbox - one disk, bios.

Profiles: `nick-i3-deb` + `vbox` + `partman-sda-atomic`.

#### VirtualBox, closer laptop emulation

This is to test installer and other related scripts before deploy them to laptop.

Settings in vbox - based on default for Debian, but with EFI enabled and 2
disks.  First disk is SSD (250G on laptop, 230G in vbox), second one is HDD
(1TB on laptop, 900G in vbox). Just to be sure that it all will fit onto real
hardware, I make vbox disks a bit smaller (to avoid errors due measurement
units nonsense).

Profiles: `nick-i3-deb` + `vbox` + `partman-2-disk`.
Or, to preserve existing partitions: `nick-i3-deb` + `vbox` + `partman-2-disk-keep`.

#### Laptop

Profiles: `nick-i3-deb` + `laptop` + `partman-2-disk`.
Or, to preserve existing partitions: `nick-i3-deb` + `laptop` + `partman-2-disk-keep`.

## After installation

On the first boot after installation completes additional post-installation
script will be automatically executed. It will amend bash profile files and
install VirtualBox Additions, etc.

Some steps are not automated. Like restoring secrets from backup. But
post-installation script is provided to complete installation semi-manually.

You will find instructions to complete configuration with some mamual steps in
the `~/README.md` after you boot to installed system. You may preview these
instructions [here](custom_extras/pkg-src/etcskel-1.0/data/etc/skel/README.md).

