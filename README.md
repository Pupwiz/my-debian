# My Debian

## About

This project is work in progress. It's aim is to prepare (and keep updated)
Debian distribution tailored for my personal needs.

It contains scripts, notes, instructions and configuration files backups to:

- build custom installation/rescue image (using `simple-cdd`);

- restore my personal configuration files after installation;

- other related notes and memos.

Anyone may use it for their own needs AS IS at their own risk. Just borrow
pieces you like or make a fork and replace personal data and preference with
your own.

Keep in mind, that I'm not able to give any support regarding this project.
Carefully review all settings, check documentation and think what you are
doing. I'm not to be blamed about any damage to your system due usage of this
project.

You may use issue tracker to ask (specific) questions or give me advices about
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

## License

I'll add it later upon request. I think about "MIT" or "Public domain", but
some scripts and portion of configuration are borrowed from Debian distro or
somewhere else (all are under open-source or public domain licenses). So, not
being a lawyer, I'm not sure how to better deal with it.
