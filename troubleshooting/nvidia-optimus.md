# Nvidia, Optimus

https://wiki.debian.org/NvidiaGraphicsDrivers

Initially I was not able to preseed nvidia driver during installation. I'll
try again, but in case it'll fail, command to install it manually:

    apt-upgrade 
    sudo apt purge nvidia-*
    sudo apt install \
        bbswitch-dkms \
        bumblebee-nvidia \
        libgl1-glvnd-nvidia-glx \
        libgl1-nvidia-glvnd-glx \
        linux-headers-amd64 \
        nvidia-driver \
        nvidia-driver-libs
    sudo adduser nick bumblebee

I was not able to just install `nvidia-driver` and `bumblebee-nvidia`, as the
article suggested, because `apt` refused to resolve dependencies.

Note, that article suggests 

    apt-upgrade 
    sudo apt install linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//') nvidia-driver

While I'm using meta package, should have the same effect, but simpler to use.

I also tried to install these packages, but it seems they are useless:

    sudo apt install  nvidia-xconfig nvidia-settings

Also I tried to run (and reboot/re-login after it):

    sudo nvidia-xconfig

But package description says it's deprecated and there is no need to do it anymore.

And this one is GUI app from Nvidia, not sure if it's useful:

    nvidia-settings

It always says that I'm not using nvidia driver, even when I do (according to X logs).

Check hardware:

    lspci -nn | egrep -i "3d|display|vga"

Check installation:

    optirun glxgears -info
    glxinfo | grep -i vendor
    optirun glxinfo | grep -i vendor

Check errors:

    systemctl status bumblebeed.service 
    less /var/log/Xorg.8.log

# Legacy driver

After migration from Stretch to Buster both newer and legacy Nvidia drivers
appear on my laptop. Don't know whether it's due automatic update, or I messed
something.  To fix it I had to remove new driver with `sudo apt purge
nvidia-driver*` and, just in case, install `sudo apt install --reinstall
nvidia-legacy-390xx-driver` again (though, it was already installed). After
that I tried to run `optirun` and found that I had to install `sudo apt install
primus`.

BTW, `nvidia-detect` for my laptop prints:

```
Detected NVIDIA GPUs:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108M [GeForce GT 635M] [10de:0de3] (rev a1)

Checking card:  NVIDIA Corporation GF108M [GeForce GT 635M] (rev a1)
Your card is only supported up to the 390 legacy drivers series.
It is recommended to install the
    nvidia-legacy-390xx-driver
```

BTW, `nvidia-settings` claims it cannot detect nvidia devices. Though, `optirun
glxinfo | grep -i vendor` says its using nvidia GPU.

TBH, I'm not sure if it's worth to install proprietary nvidia driver on my
laptop nowadays. I've never used `optirun` except for tests.

# Remove Nvidia drivers

 # apt-get purge nvidia. (don't forget the "." dot) It erases every package with "nvidia" on its name


 # /etc/init.d/gdm3 stop  (gdm3 for gnome 3)

 # apt-get install --reinstall xserver-xorg
 # apt-get install --reinstall xserver-xorg-video-nouveau

 # killall Xorg

 # reboot

Xorg should reconfigure itself, if not run a terminal and pass

# X -configure

