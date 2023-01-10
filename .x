packersync(){	PLUGDIR=~/.local/share/nvim/site/pack/packer/start/
for a in $@; do 
		echo '==================================================================================';
		echo BEFORE: "$(find ${PLUGDIR}|sed 's/^/\t/')"
	echo	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -u $a
		nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -u $a
		echo AFTER: "$(find ${PLUGDIR}|sed 's/^/\t/')"
		echo '==================================================================================';
done
}
packerinstall(){ packersync init0.lua init0.lua init1.lua;
}
packerupdate() { packersync init.lua; }
case "$1" in
e)	vi -p ./lua/r/packer.lua ./lua/r/plugins.lua ./lua/r/settings.lua NOTES.md init.lua
	;;
i)	# Reinstall from scratch
	sudo rm -rf /home/rap/.local/share/nvim /home/rap/.local/state/nvim/ /home/rap/.cache/nvim/ ./plugin/
	# packerinstall;
	packerupdate;
	;;
"")	packerupdate;
	;;
esac
