#!/bin/bash
#Program:
#	

var=0
while getopts "ioh" OPTION
do
	case $OPTION in
		i)
			var=$(($var + 1))
			;;
		o)
			var=$(($var + 2))
			;;
		h)
			echo 'usage: ./uva.sh [options] [uva question number]'
			echo 'Options:'
			echo '	-i	use [uva question number].in as input file.'
			echo '	-o	use [uva question number].out as output file.'
			echo '	-h	help(this page).'
			exit 0
			;;
	esac
done

shift $(($OPTIND - 1))

case $var in
	0)
		./$*
		;;
	1)
		./$* < $*.in
		;;
	2)
		./$* > $*.out
		;;
	3)
		./$* < $*.in > $*.out
		;;
	*)
		echo 'error in options, try "./uva.sh -h" for help.'
esac
