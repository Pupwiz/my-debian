# Wi-Fi

https://wiki.debian.org/WiFi/HowToUse

    man wireless
    less /usr/share/doc/wireless-tools/README.Debian
    man interfaces
	man ifup
    man iw
    sudo iw help
    man iwlist

    sudo iw list
    sudo iw dev
    sudo ip link set wlp3s0 up
    sudo iwlist scan
	wpa_passphrase [ssid] [password]
    sudo vim /etc/network/interfaces.d/wlp3s0

    # sudo cat /etc/network/interfaces.d/wlp3s0
    # example content of the file
	# wpa-psk is a string from wpa_passhprase output
	allow-hotplug wlp3s0
	iface wlp3s0 inet dhcp
        wpa-ssid xxxx
		wpa-psk xxx...xxx

    # command to start interface (not part of file above)
    sudo ifup wlp3s0

    # if this will not help, reboot
    # after reboot either it or ifup/ifdown should work
    sudo systemctl restart networking

# Yota

    # this lists device, find it's name to create config for it
    sudo ip link

    # I've got `enp0s20u2` at previous step
    # NOTE: it may be different (and may change over time).
    sudo vim /etc/network/interfaces.d/enp0s20u2

    # sudo cat /etc/network/interfaces.d/enp0s20u2
    # example content of the file
    allow-hotplug enp0s20u2
    iface enp0s20u2 inet dhcp

    # command to start interface (not part of file above)
    sudo ifup enp0s20u2

# Switching between interfaces

    # To switch to Yota (for test) I had to disable Wi-Fi on laptop with
    # `fn+F2` keystroke # and then restart networking as follows.
    # Restart without disabling hardware lid to Wi-Fi interface went up.
    sudo systemctl restart networking
