case "$1" in
e)	vi -p ./neovim ./setup 		;;
v)	sudo ./neovim			;;
s)	./setup				;;
"")	cat .x				;;
esac
