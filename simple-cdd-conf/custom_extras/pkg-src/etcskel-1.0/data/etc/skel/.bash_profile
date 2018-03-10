# TNL: custom .bash_profile, for very first login.
# Executes post-installation scripts, which cannot be run before first login,
# and than replaces itself with regular .bash_profile.

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

if [ -f "$HOME/.bash_profile.postinst" ]; then
    . "$HOME/.bash_profile.postinst"
    rm -f "$HOME/.bash_profile.postinst"
fi

mv -f "$HOME/.bash_profile.regular" "$HOME/.bash_profile"
. "$HOME/.bash_profile"
