packerinstall(){
echo	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	echo;
	echo 'Plugins in ~/.local/share/nvim/site/pack/packer/start/ ==========================='
	ls -l ~/.local/share/nvim/site/pack/packer/start/
	echo '==================================================================================';
	echo; 
}
case "$1" in
e)	vi -p init.lua ./lua/r/packer.lua ./lua/r/plugins.lua ./lua/r/settings.lua
	;;
r)	# Reinstall from scratch
	rm -rfv /home/rap/.local/share/nvim ./plugin/;
	packerinstall;
	;;
"")	packerinstall;
	;;
esac
