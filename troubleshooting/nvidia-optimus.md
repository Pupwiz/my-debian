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

