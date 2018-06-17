allusers
ignore noroot
ignore nogroups

noblacklist ${HOME}/family
read-only ${HOME}/family
noblacklist ${HOME}/books
read-only ${HOME}/books

noblacklist /home/share/family
noblacklist /home/share/books
blacklist /home/share/*

include /etc/firejail/feh.profile
