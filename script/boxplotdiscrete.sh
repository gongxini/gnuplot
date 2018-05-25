#!/bin/bash
#author: Yigong Hu
if [ $# != 2 ] 
then
	echo "Please give the input and output path"
else
	gnuplot << EOF
	set terminal postscript eps color solid linewidth 2 "Helvetica" 10
	set output '$2/boxplot2.eps'
	set border 2 front lt black linewidth 1.000 dashtype solid
	set boxwidth 0.5 absolute
	set style fill   solid 0.50 border lt -1
	unset key
	set pointsize 0.5
	set style data boxplot
	set xtics border in scale 0,0 nomirror norotate  autojustify
	set xtics  norangelimit 
	set xtics   ()
	set ytics border in scale 1,0.5 nomirror norotate  autojustify
	set title "Distribution of energy usage of the continents, grouped by type of energy source\n" 
	set ylabel "Billion Tons of Oil Equivalent" 
	DEBUG_TERM_HTIC = 119
	DEBUG_TERM_VTIC = 119
	## Last datafile plotted: "energy_circles.dat"
	plot 'energy_circles.dat' using (1):(\$8):(0):4
quit
EOF
fi
