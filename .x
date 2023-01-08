packersync(){
for a in $@; do 
		echo '==================================================================================';
	echo	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -u $a
		nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -u $a
		echo;
		echo 'Plugins in ~/.local/share/nvim/site/pack/packer/start/ ==========================='
		ls -l ~/.local/share/nvim/site/pack/packer/start/
		echo '==================================================================================';
		echo;
done
}
packerinstall(){ packersync init0.lua init0.lua init1.lua;
}
packerupdate() { packersync init.lua; }
case "$1" in
e)	vi -p ./lua/r/packer.lua ./lua/r/plugins.lua ./lua/r/settings.lua NOTES.md init.lua
	;;
i)	# Reinstall from scratch
	sudo rm -rf /home/rap/.local/share/nvim ./plugin/ /home/rap/.cache/nvim/
	packerinstall;
	packerupdate;
	;;
"")	packerupdate;
	;;
esac
