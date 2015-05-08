# gnuplot script to generate graphs for SCRIBE (sosp 2009)
#
# DELAYS:  both deferred signals and deferred page ownership
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

#set format y "%.0e"
set ylabel "Delay [ms]"
set ylabel offset +1.2,0
set yrange [0.001:100000]
set logscale y

# set xlabel "Application"
# set xlabel offset 0,+1
set xrange [0:39]

set ytics 0.001,10,1000
set grid ytics

set style data boxes
set boxwidth 0.9
set style fill solid 1.0

# labels to state total number of processes/threade

#
# original plot
set output "delays.pdf"
set multiplot

set key at 18,90000
plot 'delays.dat'  index 0 using 1:5  title "signal (max)" lt 4, \
	"" index 0 using 1:4 title "signal (avg)" lt 2, \
	"" index 0 using 1:3 title "signal (min)" lt 3

set key at 38,90000
plot 'delays.dat'  index 0 using 2:8 title "memory (max)" lt 1 fs solid 0.4, \
	"" index 0 using 2:7 title "memory (avg)" lt 2 fs solid 0.4, \
	"" index 0 using 2:6 title "memory (min)" lt 3 fs solid 0.4

set nomultiplot

#
# new plot
set output "delays2.pdf"
set multiplot

newavg(avg,inst,defer) = (avg * defer) / (inst + defer) 

set key at 24,90000
plot 'delays.dat'  index 1 using 1:4  title "signal (max)" lt 1, \
	"" index 1 using 1:3 title "signal (defer)" lt 3, \
	"" index 1 using 1:(newavg($3,$5,$6)) title "signal (avg)" lt 5

set key at 38,90000
plot 'delays.dat'  index 1 using 2:8 title "memory (max)" lt 1 fs solid 0.4, \
	"" index 1 using 2:7 title "memory (defer)" lt 3 fs solid 0.4, \
	"" index 1 using 2:(newavg($7,$9,$10)) title "memory (avg)" lt 5 fs solid 0.4

set nomultiplot
