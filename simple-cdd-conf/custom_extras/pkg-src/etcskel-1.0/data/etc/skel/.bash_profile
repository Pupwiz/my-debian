# TNL: custom .bash_profile, for very first login.
# Executes post-installation scripts, which cannot be run before first login,
# and than replaces itself with regular .bash_profile.

# Run and remove all postinstall scripts.
for f in "$HOME/.bash_profile.*.postinst"; do
    . "$f"
    rm -f "$f"
done

# Replace initial .bash_profile with regular one for all users.
mv -f "/etc/skel/.bash_profile.regular" "/etc/skel/.bash_profile"
mv -f "$HOME/.bash_profile.regular" "$HOME/.bash_profile"

# Continue as usually.
. "$HOME/.bash_profile"
