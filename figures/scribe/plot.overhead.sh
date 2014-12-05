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
set autoscale fix

set xtics norotate nomirror out ( \
	"Apache" 0, \
	"Mysql" 1, \
	"Make" 2, \
	"Firefox" 3, \
	"Acrobat" 4, \
	"OpenOffice" 5 \
)

set label 1 "0.8%"  at 0.03, 1.05 center
set label 2 "2.2%"  at 1.03, 1.07 center
set label 3 "6.8%"  at 2.03, 1.11 center
set label 4 "3.4%"  at 3.03, 1.08 center
set label 5 "6.1%"  at 4.03, 1.11 center
set label 6 "14.6%" at 5.03, 1.19 center

set format y "%.1f"
set ylabel "Normalized Performance"
#set ylabel offset +1.3,0
set yrange [0:1.3]

#set xlabel "Application"
#set xlabel offset 0,+1

set grid ytics
set ytics 0.2

set style histogram rowstacked title offset character 2, 0.25, 0
set style histogram rows
set style data histograms

set boxwidth 0.6
set style fill solid 0.5 border

#set key below box
#set key bmargin center horizontal Right noreverse enhanced autotitles box linetype -1 linewidth 1.000
#set key
set nokey

plot 'overhead.dat' using 3 title "Recording Performance" lt 1

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
