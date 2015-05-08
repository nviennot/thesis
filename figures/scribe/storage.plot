# gnuplot script to generate graphs for SCRIBE (sosp 2009)
#
# STORAGE GROWTH (and breakdown)  KB/s
#
# generate eps
# 18 -> font size
#set term postscript eps enhanced color 22

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

set output "storage.pdf"

#set format y "%.1f"
set ylabel "Storage Growth (KB/s)"
set ylabel offset +1.2,0
set yrange [0:2000]
#set logscale y

# set xlabel "Application"
# set xlabel offset 0,+1
set xrange [0:39]

set key right

set grid ytics
set style data boxes
set boxwidth 0.9
set style fill solid 1.0

plot 'storage.dat'  index 0 using 1:3  title "syscalls" lt 1, \
	"" index 0 using 1:6  title "memory" lt 5, \
	"" index 0 using 1:5  title "input data" lt 3, \
	"" index 0 using 2:4  title "compressed" lt 4 fs solid 0.3

	
