# gnuplot script to generate graphs for SCRIBE (sosp 2009)
#
# NORMALIZED PERFORMANCE
#
# generate eps
# 18 -> font size
#set term postscript eps enhanced color 22

set terminal postscript eps noenhanced color solid defaultplex "Helvetica" 24

# labels for x axis
set xtics rotate nomirror out ( \
	"apache-p" 1.5, \
	"apache-t" 4.5, \
	"mysql" 7.5, \
	"ssh-s" 10.5, \
	"ssh-c" 13.5, \
	"make" 16.5, \
	"untar" 19.5, \
	"urandom" 22.5, \
	"editor" 25.5, \
	"firefox" 28.5, \
	"acroread" 31.5, \
	"mplayer" 34.5, \
	"openoffice" 37.5 \
	)

set output "overhead.eps"

set format y "%.1f"
set ylabel "Normalized Performance"
set ylabel offset +1.2,0
set yrange [0:1.3]

set xlabel "Application"
set xlabel offset 0,+1
set xrange [0:39]

set key horizontal samplen 5
set key at 29,1.25

set grid ytics

set data style boxes
set boxwidth 0.9
set style fill solid 1.0

plot 'overhead.dat'  index 0 using 1:3  title "logging" lt 1, \
	"" index 0 using 2:4 title "replay" lt 2