#!/bin/bash
#author: Yigong Hu
#Usage: drawing a liner graph with a give input file
#$1: input data file path
#$2: output file path
if [ $# != 2 ] 
then
	echo "Please give the input and output path"
else
	gnuplot << EOF
	set terminal postscript eps color solid linewidth 2 "Helvetica" 10
	set output '$2/histograms.eps'
	set bar 1.000000 front
	set style circle radius graph 0.02, first 0.00000, 0.00000 
	set style ellipse size graph 0.05, 0.03, first 0.00000 angle 0 units xy
	set key inside right top vertical Right noreverse noenhanced autotitle nobox
	set style textbox transparent margins  1.0,  1.0 border
	unset logscale
	set datafile missing '-'
	set style data linespoints
	set xtics border in scale 1,0.5 nomirror rotate by -45  autojustify
	set xtics  norangelimit 
	set xtics   ()
	unset paxis 1 tics
	unset paxis 2 tics
	unset paxis 3 tics
	unset paxis 4 tics
	unset paxis 5 tics
	unset paxis 6 tics
	unset paxis 7 tics
	set title "US immigration from Europe by decade" 
	set paxis 1 range [ * : * ] noreverse nowriteback
	set paxis 2 range [ * : * ] noreverse nowriteback
	set paxis 3 range [ * : * ] noreverse nowriteback
	set paxis 4 range [ * : * ] noreverse nowriteback
	set paxis 5 range [ * : * ] noreverse nowriteback
	set paxis 6 range [ * : * ] noreverse nowriteback
	set paxis 7 range [ * : * ] noreverse nowriteback
	set colorbox vertical origin screen 0.9, 0.2, 0 size screen 0.05, 0.6, 0 front  bdefault
	x = 0.0
	i = 23
	## Last datafile plotted: "immigration.dat"
	plot '$1' using 2:xtic(1) title columnheader(2), for [i=3:22] '' using i title columnheader(i)
	quit
EOF
fi
