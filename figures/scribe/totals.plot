# gnuplot script to generate graphs for SCRIBE (sosp 2009)
#
# TOTALS (statistics)
#
# generate eps
# 18 -> font size
#set term postscript eps enhanced color 22

# set terminal postscript eps noenhanced color solid defaultplex "Helvetica" 24
set terminal pdf dashed size 5.5,2.6

# labels for x axis
set xtics rotate nomirror out ( \
	"apache-p" 1, \
	"apache-t" 2, \
	"mysql" 3, \
	"ssh-s" 4, \
	"ssh-c" 5, \
	"make" 6, \
	"untar" 7, \
	"urandom" 8, \
	"editor" 9, \
	"firefox" 10, \
	"acroread" 11, \
	"mplayer" 12, \
	"openoffice" 13 \
	)

set output "totals.pdf"

#set format y "%.1f"
set ylabel "Average count"
set ylabel offset +1.2,0
set yrange [0:70]

# set xlabel "Application"
# set xlabel offset 0,+1
set xrange [0.5:13.5]

set grid ytics
set style data boxes
set boxwidth 0.5
set style fill solid 1.0

plot 'totals.dat'  index 0 using 1:2  title "threads" lt 1, \
	"" index 0 using 1:3 title "processes" lt 5
	
