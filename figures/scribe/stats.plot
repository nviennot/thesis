# gnuplot script to generate graphs for SCRIBE (sosp 2009)
#
# STATS:  statistics about signals and memory ownership
#
# generate eps
# 18 -> font size
#set term postscript eps enhanced color 18

# set terminal postscript eps noenhanced color solid defaultplex "Helvetica" 24

set terminal pdf dashed size 5.5,2.6
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

set output "stats.pdf"
#
set format y "%.0e"
set ylabel "Count"
set ylabel offset +1.2,0
set yrange [0.1:10000000]
set logscale y

# set xlabel "Application"
# set xlabel offset 0,+1
set xrange [0:39]

set ytics 1,10,1000000
set grid ytics

set style data boxes
set boxwidth 0.9
set style fill solid 1.0

# labels to state total number of processes/threade

set multiplot

set key at 24.5,7000000
plot 'stats.dat' index 0 using 1:($3+$4) title "signal-deferred" lt 1, \
	"" index 0 using 1:3 title "signal-instant" lt 2

set key at 24.5,200000
plot 'stats.dat' index 0 using 2:($5+$6) title "memory-deferred" lt 3 fs solid 0.9, \
	"" index 0 using 2:5 title "memory-instant" lt 1 fs solid 0.3

set nomultiplot
