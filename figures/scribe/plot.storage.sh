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
	"svg")  echo "set term svg enhanced font 'droid sans, 18' size 1000,500";
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

set label 1 "59 KB/s" at 0.03, 63 center
set label 2 "71 KB/s" at 1.03, 75 center
set label 3 "29 KB/s" at 2.03, 33 center
set label 4 "31 KB/s" at 3.03, 35 center
set label 5 "33 KB/s" at 4.03, 37 center
set label 6 "39 KB/s" at 5.03, 43 center

set format y "%.1f"
set ylabel "Storage Growth (KB/s)"
#set ylabel offset +1.3,0
set yrange [0:80]

#set xlabel "Application"
#set xlabel offset 0,+1

set grid ytics
set ytics 20

set style histogram rowstacked title offset character 2, 0.25, 0
set style histogram rows
set style data histograms

set boxwidth 0.6
set style fill solid 0.5 border

#set key below box
#set key bmargin center horizontal Right noreverse enhanced autotitles box linetype -1 linewidth 1.000
#set key
set nokey

#plot 'overhead.dat' using 3 title "Recording Performance"
plot 'storage.dat' using 4 title "Recording Performance" lt 5

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
