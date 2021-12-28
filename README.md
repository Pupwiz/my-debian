# My Debian

## Status

Currently I use this repo only to store some configuration files and
troubleshooting notes. After several mainstream Debian upgrades my customized
build scripts seems to broke and I had no time to fix them. I myself haven't
installed this customized system from scratch for a while (just upgraded
installed system in place). This project was an interesting experiment, but it
proved to be a bit more heavy then I wanted. Currently I'm (once again)
thinking about upgrading my approach to organize system settings, configuration
files, package lists etc. Storing them under the source control with help of
tools such as `stow` and `mr` seems to be convenient. But building and
supporting customized `iso` seems to be an overkill. I'm looking onto Fedora
Silverblue, with small Anaconda installer script, which allows me to do what I
really need: customized partitioning and preset some installation options. It's
approach to transactional upgrades is also very appealing. With some small
post-install scripts I can have useful customized system. I only still had no
enough time to make it my main system for everyday use.

## About

This project is work in progress. Its aim is to prepare (and keep updated)
Debian distribution tailored for my personal needs.

It contains scripts, notes, instructions and backup of configuration files for:

- build custom installation/rescue image (using `simple-cdd`);

- restore my personal configuration files after installation;

- build some packages from sources;

- other related notes and memos.

I'm heavily use CLI tools, scripts and things like `i3`, `rofi`, `mr`, `stow`, 
`gopass` (see links below). If it's not your piece of cake, you'd, most likely, 
won't benefit from this project. But if you happened to like them too, you may 
find here some ideas (and don't hesitate to bring your own) on how to better 
organize your OS-related staff in a git project. I picked up many ideas in 
bunch of different project, articles, Google groups and Stack Overflow answers.  
Some links are below, some are in the `experiments` and `troubleshooting` 
folders.  Some are in script files. Many others I forgot to store and don't 
remember where exactly I borrowed them.

Anyone may use this project for their own needs AS IS at their own risk. Just 
borrow pieces you like or make a fork and replace personal data and preference 
with your own. Another option is to amend `.mrconfig` after OS installation to 
use your own private dotfiles and version of scripts.

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

- `troubleshooting`: notes on trying to overcome different issues, especially 
  if I don't know how to properly automate them;

- `experiments`: several topics I found interesting or promising, but not yet 
  ready for everyday use;

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
29. https://github.com/justwatchcom/gopass
30. https://www.chromium.org/administrators/linux-quick-start
31. https://www.chromium.org/administrators/policy-list-3
