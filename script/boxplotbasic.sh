#!/bin/bash
#author: Yigong Hu
#Usage: drawing a basic boxplot graph with a give input file
if [ $# != 2 ] 
then
	echo "Please give the input and output path"
else
	gnuplot << EOF
	set terminal postscript eps color solid linewidth 2 "Helvetica" 10
	set output '$2/boxplot1.eps'
	set border 2 front  lt black linewidth 1.000 dashtype solid
	set boxwidth 0.5 absolute
	set style fill   solid 0.5 border lt -1
	unset key
	set grid
	set pointsize 0.5
	set style data boxplot
	set xtics border out scale 0,0 nomirror rotate  autojustify
	set xtics norangelimit
	set xtics   ("A" 1.00000, "B" 2.00000)
	set ytics border in scale 1,0.5 nomirror norotate  autojustify
	DEBUG_TERM_HTIC = 119
	DEBUG_TERM_VTIC = 119
	## Last datafile plotted: "silver.dat"
	plot '$1' using (1):2, '' using (2):(\$3)
quit
EOF
fi
