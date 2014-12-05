#!/bin/bash

error() {
        echo $* 1>&2
        exit 1
}


(
case "$1" in
	"x11")	echo "set terminal x11 dashed";
		echo "set grid front lt 0 lw 1, lt 0 lw 1";;
	"pdf")	echo "set terminal pdf dashed size 3,2";
		echo "set output \"out.pdf\"";;
	"svg")  echo "set term svg enhanced font 'droid sans, 18' size 1000,550";
		echo "set output \"out.svg\"";;
esac

cat <<- "EOF"
#set autoscale fix

set xtics norotate nomirror out ( \
	"Apache" 1.5, \
	"Mysql" 4.5, \
	"Make" 7.5, \
	"Firefox" 10.5, \
	"Acrobat" 13.5, \
	"OpenOffice" 16.5 \
)

#set format y "%.1f"
set format y "%.0e"
set yrange [1.0:1000000000]
set logscale y
set ylabel "Event Count"

set mytics 10
set grid ytics
set xrange [-1:19]

#set style histogram rowstacked title offset character 2, 0.25, 0
#set style histogram rows
set style data boxes

set boxwidth 0.9
set style fill solid 0.5 border

#set key below box
#set key bmargin center horizontal Right noreverse enhanced autotitles box linetype -1 linewidth 1.000
set key

set multiplot
set key at 16.8, 80000000
plot 'stats.dat' index 0 using 2:($3+$4) title "Signal Events" lt 1
set key at 16.8, 500000000
plot 'stats.dat' index 0 using 1:($5+$6) title "Shared Memory Events" lt 3
set nomultiplot

EOF
if [[ $1 == "x11" ]]; then
	cat -
fi
) | gnuplot  -xrm  'gnuplot*borderColor:white' -xrm 'gnuplot*background:black' -xrm 'gnuplot*textColor:white' -xrm 'gnuplot*axisColor:gray' || error "gnuplot failed"

if [[ $1 == "pdf" ]]; then
	acroread out.pdf
fi

if [[ $1 == "svg" ]]; then
	gwenview out.svg
fi
