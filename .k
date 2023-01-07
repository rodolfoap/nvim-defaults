case "$1" in
a)	# Remove all
	rm -rfv /home/rap/.local/share/nvim ./plugin/;
	;;
"")	git clean -xdf
	cat .k
	;;
esac
