#!/bin/bash
gnuplot << EOF
set terminal postscript
set output 'test.eps'
plot "test.dat" with lines
quit
EOF
