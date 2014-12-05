set terminal pdf dashed size 4,2.5
set output "throughputvsworkers.pdf"

#set autoscale fix

#set format y "%.0e"
set ylabel "Throughput [msg/s]" font "Times-Roman,14"
#set ylabel offset +1.2,0
set yrange [9:50000]

set xlabel "Number of workers" font "Times-Roman,14"
#set xlabel offset 0,+1
set xrange [1:350]
set xtics font "Times-Roman,14"
set ytics font "Times-Roman,14"

set logscale xy

set ytics (3, 10, 30, 100, 300, 1000, 3000, 10000, 30000, 50000)
set xtics (1,2,5,10,20,50,100, 200, 350)
set grid ytics
set grid xtics
# set ytics 250 font "Times-Roman,14"

#set data style boxes
#set boxwidth 0.9
# set style fill solid 1.0

# set multiplot
set key reverse top left font "Times-Roman,14"

# set boxwidth 0.6
# set style fill solid 0.5 border

set datafile missing

plot 'throughputvsworkers.dat' using 1:2 title "0ms callback"   with linespoint lt 1 ps 1 lw 4 lc 4 pt 2, \
     ''                          using 1:3 title "10ms callback"  with linespoint lt 1 ps 1 lw 4 lc 3 pt 6, \
     ''                          using 1:4 title "100ms callback" with linespoint lt 1 ps 1 lw 4 lc 2 pt 4
