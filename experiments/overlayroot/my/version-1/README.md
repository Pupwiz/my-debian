I found these solution: https://yulistic.gitlab.io/2016/05/overlayroot-not-working-with-custom-kernel/

Which I converted into patch to debian sources and tested.

It works on VirtualBox, Debian 9 (4.9.82-1+deb9u3).

Main changes:

- uncomment package definition;
- overlayfs -> overlay;
- add "workdir" option;
