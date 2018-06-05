allusers
ignore noroot

noblacklist ${HOME}/music
read-only ${HOME}/music
noblacklist ${HOME}/.config
noblacklist ${HOME}/.config/cmus
blacklist ${HOME}/*

noblacklist /home/share/music
blacklist /home/share/*

include /etc/firejail/cmus.profile
