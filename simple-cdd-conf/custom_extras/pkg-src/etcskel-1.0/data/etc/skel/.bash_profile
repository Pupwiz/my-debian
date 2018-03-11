# TNL: custom .bash_profile, for very first login.
# Executes post-installation scripts, which cannot be run before first login,
# and than replaces itself with regular .bash_profile.

# Run and remove all postinstall scripts.
for f in $HOME/.bash_profile.*.postinst; do
    . $f
    rm -f $f
done

# Replace initial .bash_profile with regular one for all users.
clear
echo "Root privileges required to replace one-time .bash_profile with regular one"
sudo mv -f /etc/skel/.bash_profile.regular /etc/skel/.bash_profile
sudo rm -f /etc/skel/.bash_profile.*.postinst
mv -f $HOME/.bash_profile.regular $HOME/.bash_profile

dialog \
    --backtitle "Instructions to complete installation" \
    --title "~/README.md" \
    --textbox ~/README.md 30 85
dialog --clear

# Continue as usually.
. $HOME/.bash_profile
