include /etc/firejail/lynx.profile
include ${HOME}/.config/firejail/browser.profile

whitelist ${HOME}/.lynx_bookmarks.html
whitelist ${HOME}/Projects/my-debian/dotfiles/lynx/.lynx_bookmarks.html
whitelist ${HOME}/.lynxrc
whitelist ${HOME}/Projects/my-debian/dotfiles/lynx/.lynxrc

