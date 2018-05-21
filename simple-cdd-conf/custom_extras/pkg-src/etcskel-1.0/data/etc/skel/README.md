# Custom Debian setup

Welcome to the custom Debian setup!

Below are manual steps required to complete installation.

This instruction can be found in the file `~/README.md` on the installed system.

Visit [project's Github page](https://github.com/nikolay-turpitko/my-debian)
for more information and sources.

## Manual steps to complete installation

1. Restore from backup your keys and passwords into:

  - `.ssh`;
  - `.gnupg`;

   Keys may be required at the next steps to clone repositories with write
   access or private repositories. You may skip this step and change
   `~/.mrconfig` to use `https://` schema for read-only access. It may be
   enough for temporary VM installations, if you do not plan to make backups of
   dot files from this system, or if you want to manually setup remote servers
   for each repository later.

   Sample command to restore parts from tar backup:

        sudo tar -C /home/nick \
                 --strip-components=3 \
                 -xvf /backup/tar/2018-04-05/vbx-files.tar.gz \
                 files/home/nick/.ssh \
                 files/home/nick/.gnupg

2. Update dot files and other projects from remote repositories.  This step
   doesn't run automatically because you may need private keys to access your
   repository or you may want to check and amend your repository settings in
   `~/.mrconfig` file. Put there URLs of your own forks or repositories. After
   that you may choose to pull all or some of those repositories to the local
   system (`man mr`). Don't forget `ssh-add`, or you'll have to enter password
   many times.

        vim ~/.mrconfig
        cd ~
        ssh-add
        mr update

3. Check installation logs and resolve issues. You may need to manually execute
   some failed command from postinstallation script, if they fail due network
   issues, for example. For example, GPG keys or 3rd party repositories may be
   temporary unavailable during installation. Use project, obtained on previous
   step to find postinstallation script.

	sudo less /var/log/installer/syslog
	less ~/Projects/my-debian/simple-cdd-conf/profiles/nick-i3-deb.postinst

4. Create symlinks for downloaded dot files with `stow`. Your dot files will be
   stored in the git repository in the `~/Projects/my-debian/dotfiles` folder.
   You may change them there and commit to the local repository. If you
   amended your `~/.mrconfig` to use your own forks/repositories, you will be
   able to push your changes to the remote repository for backup. Make sure you
   do not put sensitive information in your dot files. Store your keys/passwords
   separately. Example of creating and then deleting symlinks from one of `stow`
   "package" (`man stow`):

        stow --no-folding -d ~/Projects/my-debian/dotfiles -t ~ mutt
        stow --no-folding -D -d ~/Projects/my-debian/dotfiles -t ~ mutt

   To apply stow to all "packages" within folder use script `~/bin/stow-all`:

        stow-all

   Notice that command above will "adopt" existing files (in `stow` terminology),
   which means they'll be moved into local working copy of the repository. You
   may need to resolve conflicts manually, using git commands.

   NB: to put sentence above in other words, you may want to do `git checkout 
   -- [some files]` from console, because you local copy of the file may not be 
   replaced, but put into project folder instead. It's up to you what version
   you'd prefer. In particular, check GPG and Midnight Commander settings.

5. Depending on your workflow, you may need to update all repositories again
   after previous steps. For example, you may replace bootstrapped copy of 
   `.mrconfig` with your own, stored in the private repo. In this case, you'd
   manually edit/replace bootstrapped copy at step 2 for `mr` to checkout all
   your private repos, one of which could contain your own copy of `.mrconfig`.
   So, at step 4 you'd resolve repository conflicts and choose to use yours 
   copy of `.mrconfig`. After that, you may want to issue command to update
   you repositories again. This a bit complicated at first glance, but allows
   to keep diverged version of `.mrconfig` under private version control.

        mr update

6. Re-login.

7. Execute `~/.postinst/postinst`. It will guide you through other
   semi-automated installation steps. Such as:

   - updating vim's spell files;
   - updating vim-go's binary dependencies;
   - installing custom Go packages;
   - setup weechat and bitlbee;
   - setup alternatives;
   - install HP printer;
   - ...

   This script depends on manual steps above, such as existance of vim plugins
   or Go environment variables. So, these steps cannot be done automatically
   during installation.

   **Note**: scripts contain manual steps and print some instructions into 
   console.
   Check output, don't ignore it. Some tasks as connecting printer or copying
   code from SMS cannot be done automatically.

   **Note**: there were occasions when I had connection problems to some
   repositories or servers, required to setup software, due incorrect routes at
   my ISP side. For such cases I added option to run scripts via torsocks. Just
   invoke it like this: `~/.postinst/postinst torify`.

   **Note**: my scripts and configuration heavily dependent on `gopass` tool 
   and it's ability to store and extract structured pieces of metadata, stored
   along with passwords. I wouldn't be able to put all this scripts and configs 
   into public repo without tool like it. You may want to use your own tool 
   (and will need to heavily refactor all related scripts and configs - related 
   to mail client, chat, wifi, vpn etc), or you may want to adopt `gopass` 
   usage (and my conventions of storing metadata, like field names) and migrate 
   all or some of your passwords to it. Or you may choose to skip this step at 
   all and manually install all things you need.

Bonus: i3 configured to use random wallpaper from the `~/Pictures/wallpapers`
directory at every login.  Only one wallpaper pre-packaged. Run script in the
folder to upload more.
