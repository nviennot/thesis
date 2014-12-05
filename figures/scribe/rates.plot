# rates (signals/page faults)
#
# generate eps
# 18 -> font size
#set term postscript eps enhanced color 18

#set terminal postscript eps enhanced color solid defaultplex "Helvetica" 24
set terminal eps enhanced 

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

set output "rates.pdf"
#
set format y "%g ns"
set ylabel "avg time (ns)"
set ylabel offset +1.2,0

set autoscale fix

set xlabel "Application"
set xlabel offset 0,+1
set xrange [0:39]

set grid ytics

set data style boxes
set boxwidth 0.9
set style fill solid 1.0


avg_wait(avg_wait_time, num_wait, num_no_wait) = (avg_wait_time * num_wait) / (num_wait + num_no_wait)
ms_to_ns(x) = x*1000;

plot 'rates.dat' index 0 using 1:(avg_wait(ms_to_ns($4),$11,$10)) title "signal avg wait" lt 1
plot 'rates.dat' index 0 using 2:(avg_wait(ms_to_ns($7),$13,$12)) title "mem avg wait" lt 2

set format y "%g"
set ylabel "fault per sec"
plot 'rates.dat' index 0 using 1:(($12+$13)/$14) title "fault per sec" lt 1
