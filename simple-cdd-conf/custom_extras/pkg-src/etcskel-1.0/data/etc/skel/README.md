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
  - `.password-store`;

   Keys may be required at the next steps to clone repositories with write
   access or private repositories. You may skip this step and change
   `~/.mrconfig` to use `https://` schema for read-only access. It may be
   enough for temporary VM installations, if you do not plan to make backups of
   dot files from this system, or if you want to manually setup remote servers
   for each repository later.

2. Update dot files and other projects from remote repositories.  This step
   doesn't run automatically because you may need private keys to access your
   repository or you may want to check and amend your repository settings in
   `~/.mrconfig` file. Put there URLs of your own forks or repositories. After
   that you may choose to pull all or some of those repositories to the local
   system (`man mr`).

        vim ~/.mrconfig
        cd ~
        mr -j 5 checkout

3. Create symlinks for downloaded dot files with `stow`. Your dot files will be
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

4. Re-login.

5. Execute `~/.postinst/postinst`. It will guide you through other
   semi-automated installation steps. Such as:

   - updating vim's spell files;
   - updating vim-go's binary dependencies;
   - ...

   This script depends on manual steps above, such as existance of vim plugins
   or Go environment variables. So, these steps cannot be done automatically
   during installation.


Bonus: i3 configured to use random wallpaper from the `~/Pictures/wallpapers`
directory at every login.  Only one wallpaper pre-packaged. Run script in the
folder to upload more.
