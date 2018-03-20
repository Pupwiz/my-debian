# Links

1. http://domas.monkus.lt/posts/2015-02-17-overlayroot/
2. http://blog.dustinkirkland.com/2012/08/introducing-overlayroot-overlayfs.html
3. https://spin.atomicobject.com/2015/03/10/protecting-ubuntu-root-filesystem/
4. https://julien.danjou.info/blog/2013/cloud-init-utils-debian
5. https://anonscm.debian.org/cgit/collab-maint/cloud-initramfs-tools.git/
6. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732788
7. https://www.coshx.com/blog/2016/06/16/wheres-my-overlay/

# Note 1

overlayfs appears in the /proc/filesystems after manual modprobe:

cat /proc/filesystems
sudo /sbin/modprobe overlay
cat /proc/filesystems

overlayroot package is commented out in debian sources, I tried to build it from sources,
it installs, but won't make any difference. Probably, because kernel module is not loaded
by default at the boot time. Is there any way to load it?

https://askubuntu.com/questions/123766/is-is-possible-to-modprobe-a-module-from-the-boot-loader

# Note 2

It'd be nice to have a read-only root partition. But what about /boot as well?
Also, it protects from unintentional damage of the root partition by buggy scripts,
but easily bypassed by malicious person/code - it's enough to find and remount
underlying partition.

