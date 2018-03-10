# Custom Debian setup

Welcome to the custom Debian setup!

Visit [project's Github page](https://github.com/nikolay-turpitko/my-debian)
for more information and sources.

## Manual steps to complete installation

1. Update dotfiles and other projects from remote repositories.  This step
   doesn't run automatically because you may need to check and amend your
   repository settings in `~/.mrconfig` file. Put there URLs of your own forks
   or repositories. After that you may choose to pull all or some of those
   repositories to the local system (`man mr`).

    vim ~/.mrconfig
    cd ~
    mr -j 5 checkout

2. Create symlinks for downloaded dotfiles with `stow`. Your dotfiles will be
   stored in the git repository in the `~/Projects/my-debian/dotfiles` folder.
   You may change them there and commit to the local repository. If you
   amended your `~/.mrconfig` to use your own forks/repositories, you will be
   able to push your changes to the remote repository for backup. Make sure you
   do not put sensitive information in your dotfiles. Store your keys/passwords
   separately. Example of creating and then deleting symlinks from one of `stow`
   "package" (`man stow`):

    stow --no-folding -d ~/Projects/my-debian/dotfiles -t ~ mutt
    stow --no-folding -D -d ~/Projects/my-debian/dotfiles -t ~ mutt

   To apply stow to all "packages" within folder use script `~/stow-all`.

3. Restore from backup your keys and passwords into:

  - `.ssh`;
  - `.gnupg`;
  - `.password-store`;

TODO

Bonus: i3 configured to use random wallpaper from dir `~/Pictures/wallpapers`
at every login.  Only one wallpaper pre-packaged. Run script in the folder to
upload more.
