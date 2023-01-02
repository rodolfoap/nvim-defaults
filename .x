case "$1" in
e)	vi -p init.lua lua/r/plugins.lua 
	;;
"")	set -x
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	;;
esac
