allusers
ignore noroot
ignore nogroups

noblacklist ${HOME}/books
read-only ${HOME}/books

noblacklist /home/share/books
blacklist /home/share/*

include /etc/firejail/zathura.profile
