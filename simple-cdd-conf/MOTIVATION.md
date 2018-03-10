**TL;DR**: below is some drivel about why I started to build custom Debian
distro, why I choose Debian in the first place, etc. These are notes for myself
to somewhat arrange my thoughts, to justify some decisions in case I'll later
need to review them. This, probably, won't give any useful info to anyone else.
Do not read it. This is my oppinion, it may change and I'm not going to argue
about it.

## Motivation

I need a distro with all my tools included as a backup, to be able to rapidly
install it at any new laptop or VM, or even remote server with ssh connection,
and continue my everyday work. I do make traditional backups, but I'm sceptical
about backups of core system - if something goes terribly wrong, I cannot trust
them. I prefer to be able to install working system from scratch and to
manually merge some settings from backup configs.

Another consideration is that I want to be able to install a fresh system to
any of my home computer or VM - with different hardware, for experiments, etc.
  
Any general distro off the shelf is either make some decisions for me, or leave
something not configured. I want a ready to use distro completely tailored for
my own needs, suitable to use with my wifi adapters and printers, prepared to
use my backup solutions and personal scripts. It should contain all I need for
everyday work, all my favorite packages, scripts and utils. All my personal
aliases, settings, memos, notes, links, bookmarks, etc. Just all I usually
install, change and copy on(to) freshly installed OS.

Creating a custom distro is an opportunity to polish my tools, revise some
decisions, check some old solutions, reorganize accustomed ways of work and
gain some new knowledge on the way.

I spent some time on research and comparison. I considered to use different
OSes, and decided to stick to vanilla Debian (not derivative, not flavour, not
another Linux). I'll elaborate on this decision below. Here I just postulate
that I want to base my custom distro on minimal vanilla Debian.  I've chosen
netinstall, though server is also good starter point.

My customized distro is not a derivative. I don't intend to promote it. It's
not going to be perfect. It's just for my own use, for my work and for
someone else, who may find it useful as a starting point for one's own
customizations. It's not need to be general as such. I'm not going to fix
someone's bugs or issues or customize it for someone else (except my family).
If someone find it useful, one may fork it and do with fork whatever one like.
I'd be glad if someone do this, though. I'd like to learn and borrow ideas,
tricks and implementations from such forks. Alas, I cannot find something ready
to use.

This is by no means bare minimal install. There are other better options for
that. This is quite minimalistic and spartan, but this is not the goal. It's
just because I like minimalistic UI, which I can use more effectively. I don't
like when something distract me from job at hands. So, I got rid from all
desktop environments effects and tools I don't know how to use. I like my
windows always fullscreen (or split), I like them switched instantly without
cool, but slow effects. I like to work on my laptop without mouse and touchpad,
just with keyboard and shortcuts.  So, my choices are: **i3wm, terminal, vim,
lynx, other cli and ncurses tools as much as possible**. Preference of
console tools allows to work with same set of programs on the any laptop,
remote server or share remote terminal sessions in tmate for pair
programming. But I still have to use some X11 apps, for my business.  Like
contemporary browsers or office tools.  Other tools like IDEs, VM managers or
Docker are specific to my job and can be huge sometimes.  So, distro going to
grow quite big (thanks modern USB sticks have plenty space).

Things I also need installed and configured:

- firewall, apparmor, ssh protection, other security options;
- my personal settings, config files, browser plugins, profiles and bookmarks;
- my locale and keyboard settings;
- printer/scanner drivers;
- my personal scripts, backup solution;
- minimum questions during installation;
- build packages from sources during setup?
- after setup: sync fresh files from backup and ready to go;

## Why Debian, why no DE, etc

I used Lubuntu for several years. This is Ubuntu with LXDE. Though I seldom
logged into LXDE, I use i3 mostly. It's just more convenient to use with
keyboard only, no other desktop environment comparable with it. From alternative
window managers I used Awesome. It was almost perfect, if not it's constant
change and need to fix configs and custom scripts. From Awesome I switched to
i3 and never looked for something else.

I prefer Unix-like systems. Hope never to work with Windows again. At least,
not until Windows will natively support Unix tools and sh/bash/zsh/... I'm not
Windows hater, but it's just inconvenient to learn several sets of similar
tools and remember all the differences. Or it rather impossible for me.

Mac OS X is almost OK, if I use its terminal and bash, and BSD tools. I don't
like its UI and don't much trust to all the Apple's things besides the kernel
and core tools. Also, GUI is slow as hell. But `brew` is nice, terminal is OK
and to run VirtualBox it is a perfect system. It has its quirks, but system
feels mostly solid. Alas, I cannot install it on my PC laptop, into VM or
remote server. Also, i3 is useless in it (it installs and runs in XQuartz, but
almost everything conflicts with host OS).  Another drawback is that some free
programs is not available on Mac OS.  Homebrew is great, but doesn't have
everything I used to on Ubuntu. And commercial soft is mostly terrible. I mean,
there is good commercial soft, but to pay for every little barely supported
thing - it's not for me.  I wish I could just run licensed Adobe or Microsoft
programs on mostly free system, if I desperately need and buy them.  Some big
ones, not all of them. Even better (in perfect future world) it'd be to merge
all good staff from all unix-like systems (BSD, Linux, Mac, Solaris) into the
free and open-source base system. And have Mac OS X's UI (Cocoa et al) or
Microsoft Windows UI as a payed option on top of it. As alternatives to free
Gnome or KDE or many others. And to be able to choose either you want free
option or commercial one for every component of your system. But it's a dream.
Currently, I use my Mac sometimes.  Because I had to bought one (most cheap of
Mac mini circa 2012) for one of my project. Project is already finished, but
Mac still I have, so I use it as a backup machine just in case of some terrible
disaster happen with my PC laptop.  Because of it's backup role, I installed
VirtualBox on it to run Debian within it and to build custom Debian images. I
should be able to do this on Mac in case my main system fails.

So, I excluded Windows and Mac OS X. QNX and Plan 9 are cool, but are not very
popular. So, almost no community, jobs, help, difficult to find answers and docs.

FreeBSD is what I want to try someday. Probably next time. Currently I need
something stable and familiar to continue my work. But this one I should try.
Unfortunately, right now some SDKs, which I need for my everyday work as a
software developer, are not available on FreeBSD. Namely, Andorid SDK and
Google Cloud SDK. Probably, there are workarounds, but currently I have no
enough time to dive into it deeper.

Linuxes. There are plenty of them. But I need most stable, maintained,
supported and popular.

Arch, Gentoo, Suse and other rolling distros are not for me. I don't trust to
rolling release model. It's simple. If I do not use my system for some time it
become outdated and breaks on upgrade. I need to constantly manage it.
Stable release has outdated packages, but with security patches. It's less
likely to break on update after a while. And I have some unattended systems I
do not want to constantly update. I'd rather setup automatic security updates
and use slightly outdated core packages. Some packages I need to be fresh,
though. I'll need some way to combine those with stable core system. FreeBSD
should be a good fit with it's ports, but I want to use Linux and achieve
something similar with it. Flatpack, Docker, Snap... Some of these should help.

I want to use KVM or VirtualBox, but not for everyday job. I mean, I cannot do
all development within VM. BTW, I tried. It's possible to run emulators in
another VM and connect to it. But it's not very convenient and feels against
mainstream flow. Sometimes I need just to use teams adopted practices, tools
and scripts quickly, without any time to change them for my own environment.
And some projects (more and more, actually) require virtualisation as part of
workflow, so it's quite difficult to run them within VM.  It's not always
possible to change existing project's workflow to use it from VM.  So, I need a
setup with stable core system and modern tools, but not in VM.

Fedora is as unstable as rolling release. Only gives you 6 months to recover
from previous disaster before a new one (while rolling releases are in the
state of the constant disaster, which is cool for those brave and strong). 

CentOS. I used it on server. It's almost what I want. But I don't know how to
solve problem of modern packages with it. I don't like to enable 3rd party
repositories. I tried to use EPELs, but it's a way strict to the dependency
hell. Once you enable it, you'll replaces good part of the core libs with
unstable ones. So, what's the point? I'd may use Fedora as well. Probably, like
with FreeBSD, I need just learn more about it.  But why? It's still Linux. If I
had to invest more time, why not into FreeBSD?

Slackware. Don't know much about it. Seems even more terse and brutal then
FreeBSD. Don't know what's possible and what I'll get with it. Documentation is
scarce as well. Community is smaller, then others. Probably, this is a good
distro, I just don't know. Still, I'd prefer to invest time into FreeBSD.

NixOS, Alpine. It's good they exists. For someone, or for docker images.  But
what's the point in the Linux without systemd nowadays? I'd better switch to
FreeBSD - it's classy and with base system / extra packages idea. And NixOS is
an interesting innovative project, but, I'm afraid, not polished enough yet
(small community, not very well known pitfalls, practices and workarounds).

Ubuntu. Short releases are as bad as Fedora. LST is better, I used it. A bit
autocratic and opportunistic, but based on the solid foundation (Debian).
Ubuntu LTS is almost perfect and I used to it, know some quirks. But it based
on barely tested branch and bring bugs of it's own on top of it. I had some
occasions, when kernel bug was fixed in Debian and reintroduced in every odd
version in Ubuntu. I don't like idea of PPA. I don't like Canonical
experiments.  In my opinion, Canonical got good stable system and make it
worse. As well, as others Debian derivatives. Why use them, when I can just use
Debian itself?  It's more stable and reliable.

So, I made a full circle and decided on Debian. As usual, it's just an opinion.
It's not even well educated choice. I just choose what I'm more familiar with,
what has reputation of security and stability, well spread and known. But I can
reuse my previous experience, scripts and configuration files on Debian. And it's
more stable, then Ubuntu. And it has many packages. And still doesn't have all
unnecessary Canonical inventions, which I don't use anyway. So, that's it. I'll
switch to Debian and will see about FreeBSD later.

## Why not just backup whole system or use version control for configs

Why, I do it. I create backups to external drive monthly and to partition more
often. I also keep my configuration under version control in file-based repo,
which I also backup to external drive.

There are some solutions to automate backups and version control of
configuration files from `/etc`, `/home`, etc. But I came to decision, that
it's not enough. 

I found, that restoring from such backups is essentially manual process. I
cannot just blindly restore system from backup in case of fuckup. Backups
themselves can contain already plagued configs. I, rather, have to install base
system, and merge configs manually. Custom distro is an attempt to automate
first part of this process - to create a usable and configured base system
with all my usual tools in usual places. After I install customized system I
can choose whether to apply changes from backups or discard them at all.

So, why not just use rolling release and constantly keep it up to date and back
it up regularly? Donno. I just think, it's required more work from my part.
Also, I think it's harder to restore system in case it breaks on update. I
rather want to reuse community efforts to keep system stable and secure. In
this trade-off between fresh and stable I rather prefer to keep base system a
bit outdated, but well tested and security-patched and more likely in a working
state. Definitely, I should try FreeBSD, but usually I'm working with
Linux-centered tools and projects. And, alas, due of systemd FreeBSD and Linux
diverge more and more. I'm not sure, that every tool I'll have to use in the
next project will be properly supported in FreeBSD. Though, it may be an
exaggeration. I'll try to make some similar customized distro for FreeBSD next
time (in case I'll have a free time for it and will not be completely happy with
current setup). 
