# gnuplot script to generate graphs for SCRIBE (sosp 2009)
#
# SYNC POINTS:  distance between points (min, avg, max)
#
# generate eps
# 18 -> font size
#set term postscript eps enhanced color 18

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

#set format y "%.0e"
set ylabel "Interval [ms]"
set ylabel offset +1.2,0
set yrange [0.001:100000]
set logscale y

# set xlabel "Application"
# set xlabel offset 0,+1
set xrange [0.5:13.5]

set ytics 0.001,10,1000
set grid ytics

set style data boxes
set style fill solid 1.0

# labels to state total number of processes/threade

#### original graph
set output "syncpts.pdf"
set key horizontal samplen 5
set boxwidth 0.5
plot 'syncpts.dat'  index 0 using 1:4  title "max" lt 1, \
       "" index 0 using 1:3    title "avg" lt 2

#### new graphs, with sync point duration too
set output "syncpts2.pdf"
set key vertical samplen 4
set boxwidth 0.3

left(x) = x-0.15
right(x) = x+0.15
sync_time(avg,tot,time,cnt) = (time*1000*cnt/tot - avg)

plot 'syncpts.dat'  index 0 using (left($1)):4  title "interval (max)" lt 1, \
	"" index 0 using (left($1)):3 	title "interval (avg)" lt 5, \
	"" index 0 using (right($1)):(sync_time($3,$6,$7,$8))  title "length (avg)" lt 3
