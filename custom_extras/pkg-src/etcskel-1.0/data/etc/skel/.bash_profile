# TNL: custom .bash_profile, invokes .profile and starts X (on the first console).

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx
fi
