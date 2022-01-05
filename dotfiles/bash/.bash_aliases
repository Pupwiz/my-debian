alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'
alias lsl="ls -lhFA | less"

alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias suspend='sudo systemctl suspend'
alias hybrid-sleep='sudo systemctl hybrid-sleep'
alias logout='i3-msg "exit"'

function tz-convert() {
	usage=" \n \
	Usage: tz-convert from|to|in <tz> [<HH:MM>] \n \
	\n \
        from - converts from timezone tz to local time \n \
        to - converts from local time to timezone tz \n \
	in - show current time in timezone tz (provided time ignored) \n"
	if [ -z "$2" ] || ( [ -z "$3" ] && [ "$1" != "in" ] ); then
		echo -e $usage
		return 1
	fi
	itz="UTC$(TZ="$2" date +%z)"
	tzl="UTC$(date +%z)"
	case $1 in
		from)
			date -R -d"$3$itz"
			;;

		to)
			TZ=$2 date -R -d"$3$tzl"
			;;
		in)
			TZ=$2 date -R
			;;
		*)
			echo -e $usage
			return 1
			;;

	esac
}

alias now='date -R; tz-convert in "Europe/Moscow"; tz-convert in "Asia/Jerusalem"'
alias tz-convert-to-msk='tz-convert to "Europe/Moscow"'
alias tz-convert-from-msk='tz-convert from "Europe/Moscow"'
alias tz-convert-to-ist='tz-convert to "Asia/Jerusalem"'
alias tz-convert-from-ist='tz-convert from "Asia/Jerusalem"'

alias cal='ncal -y -M'
alias wthr='weather unbb uudd'
alias wttr='curl wttr.in/barnaul'

# usage: cat file.list | apt-get-all
alias apt-get-all='grep -v '^#' | xargs sudo apt-get install -y'
alias apt-upgrade='sudo apt-upgrade'

alias hdd-info='sudo hdd-info'
alias kbdlight-toggle='sudo kbdlight-toggle'
alias myvpn='sudo VPN_SERVER_IP="$(gopass NET/vpn-vdsina.ru vpn-server-ip)" myvpn'

alias calcurse="calcurse --directory ~/Projects/todo/calcurse/"
alias weechat='WEECHAT_PASSPHRASE=$(gopass show -o email-and-im/weechat) command weechat'
alias tw='/usr/bin/task'
