# rng-tools

https://wiki.archlinux.org/index.php/Rng-tools

My problem was that `rng-tools` does not use rdrand instruction set, while 
`rng-tools5` does. I had to switch to right package:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=792406

    # check CPU instruction support
    cat /proc/cpuinfo | grep -o rdrand

    # I don't know how interpret this one
    udevadm info /dev/hwrng

    systemctl status rng-tools.service

    # next command will be slow without daemon
    dd if=/dev/random of=/dev/null bs=1024 count=1 iflag=fullblock
    rngtest -c 1000 </dev/random
