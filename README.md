# My Debian

## About

This project is work in progress. Its aim is to prepare (and keep updated)
Debian distribution tailored for my personal needs.

It contains scripts, notes, instructions and backup of configuration files for:

- build custom installation/rescue image (using `simple-cdd`);

- restore my personal configuration files after installation;

- build some packages from sources;

- other related notes and memos.

Anyone may use it for their own needs AS IS at their own risk. Just borrow
pieces you like or make a fork and replace personal data and preference with
your own.

Keep in mind, that I'm not able to give any support regarding this project.
Carefully review all settings, check documentation and think what you are
doing. I'm not to be blamed about any damage to your system due usage of this
project.

You may use issue tracker to ask (specific) questions or give me advises about
how to better achieve something, but don't anticipate answers. You'll faster
find answers to general questions in the documentation or online. I'm not an
expert. I'm in the same learning position as you are. You may send me
occasional PRs, if you feel like it. Or just support your own fork.

Notice that `master` branch may be at broken state any time, use tags when
they are available.

## Directories

- `simple-cdd-conf`: scripts and configuration files for `simple-cdd` Debian
  tool to create customized Debian installation image;

- `dotfiles`: backup of my dot files, to be used with `myrepos` and `stow` to
  sync into home folder;

- `apt-repo`: scripts and configs to prepare custom apt repository for packages
  I prefer to build from sources;

## Instructions

### Build iso image, write to USB and install from it

[More details](simple-cdd-conf/README.md).

### Steps after installation

[More details](simple-cdd-conf/custom_extras/pkg-src/etcskel-1.0/data/etc/skel/README.md).

## License

I'll add it later upon request. I think about "MIT" or "Public domain", but
some scripts and portion of configuration are borrowed from Debian distro or
somewhere else (all are under open-source or public domain licenses). So, not
being a lawyer, I'm not sure how to better deal with it.

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
17. https://www.gnu.org/software/stow/
18. http://myrepos.branchable.com/
19. https://github.com/aspiers/kitenet-mr/blob/master/lib/stow
20. https://github.com/gerardbm/dotfiles
21. https://github.com/gerardbm/vimrc
22. https://d-i.alioth.debian.org/doc/internals/ch03.html
23. https://ubuntuforums.org/showthread.php?t=1411273
24. https://github.com/bfritz/remote-script-partitioner
25. https://askubuntu.com/questions/566315/virtualbox-boots-only-in-uefi-interactive-shell/573672#573672
26. http://www.bog.pp.ru/hard/UEFI.html
27. https://wiki.debian.org/BuildingTutorial#Installing_and_testing_the_modified_package
28. https://wiki.debian.org/apt-src
