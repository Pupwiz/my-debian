alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'
alias lsl="ls -lhFA | less"

alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

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
			date -d"$3$itz"
			;;

		to)
			TZ=$2 date -d"$3$tzl"
			;;
		in)
			TZ=$2 date
			;;
		*)
			echo -e $usage
			return 1
			;;

	esac
}

alias now='date; tz-convert in "Europe/Moscow"; tz-convert in "Asia/Jerusalem"'
alias tz-convert-to-msk='tz-convert to "Eurpoe/Moscow"'
alias tz-convert-from-msk='tz-convert from "Europe/Moscow"'
alias tz-convert-to-ist='tz-convert to "Asia/Jerusalem"'
alias tz-convert-from-ist='tz-convert from "Asia/Jerusalem"'
