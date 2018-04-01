Goal: mount /, /boot, /var, /backup read-only.

Actually, it's more simple to use existing package and mount them not
completely read-only, but as overlay file system - most data is read-only,
changes leave in tmpfs and discarded during reboot.

Other partitions as /home should be normally writable.

When necessary, "sudo overlayroot-chroot" allows to temporary remount partitions
as read-write and chroot into writable root partition.

Caveats:

- Debian package is pretty old, even disabled (commented out) in the sources.
  I created a patch to re-enable it and submit to Debian:
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=860915, where it have had no
  attention yet.

- I tried to install package from Ubuntu on Debian; it works. Though, I had to
  amend configuration, because it was not possible to mount some partitions
  read-only and others read-write: https://github.com/nikolay-turpitko/cloud-initramfs-tools.
  Submitted patch to Ubuntu (link on Github in README) and forked and patched
  on Github.

- Have to install it from sources, patched package for Ubuntu onto Debian.
  Need to handle logs, it's better persist them.

- Not clear how to deal with /var. It's better to make it read-only, so that
  some apps (apt, for instance) won't leave system in inconsistent state, when
  modifications in /var persisted, while in / and /boot were not. At the same
  time, there are many programs unusable without read-write access to /var
  (logs, docker, ...).

- It conflicts with unattended updates. There is a hook in apt, which can be
  used to remount partition in read-write mode, but I was not able to combine
  it with `overlayroot-chroot`.

- Often `overlayroot-chroot` exits leaving root partition in rw mode. 

Current state: decided to postpone it.

# Links

1. http://domas.monkus.lt/posts/2015-02-17-overlayroot/
2. http://blog.dustinkirkland.com/2012/08/introducing-overlayroot-overlayfs.html
3. https://spin.atomicobject.com/2015/03/10/protecting-ubuntu-root-filesystem/
4. https://julien.danjou.info/blog/2013/cloud-init-utils-debian
5. https://anonscm.debian.org/cgit/collab-maint/cloud-initramfs-tools.git/
6. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732788
7. https://www.coshx.com/blog/2016/06/16/wheres-my-overlay/
8. https://yulistic.gitlab.io/2016/05/overlayroot-not-working-with-custom-kernel/
9. https://askubuntu.com/questions/123766/is-is-possible-to-modprobe-a-module-from-the-boot-loader
10. https://manpages.debian.org/jessie/initramfs-tools/initramfs-tools.8.en.html
11. https://wiki.debian.org/ReadonlyRoot#Make_apt-get_remount_.2F_if_needed
