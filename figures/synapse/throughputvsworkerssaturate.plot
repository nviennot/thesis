set terminal pdf dashed size 4,2.0
set output "throughputvsworkerssaturate.pdf"

set tmargin 0
#set autoscale fix

#set format y "%.0e"
set ylabel "Throughput [msg/s] (log)" font "Times-Roman,14"
#set ylabel offset +1.2,0
set yrange [5:7000]

set xlabel "Number of Synapse Workers" font "Times-Roman,14" offset 0,0.8
#set xlabel offset 0,+1
set xrange [1:400]
set xtics font "Times-Roman,14" offset 0,0.3
set ytics font "Times-Roman,14"

set logscale xy

set ytics (2, 5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 30000, 50000)
set xtics (1,2,5,10,20,50,100,200,400)
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

plot 'throughputvsworkerssaturate.dat' using 1:2 title "Weak Delivery"   with linespoint lt 1 ps 1 lw 4 lc 4 pt 2, \
     ''                          using 1:3 title "Causal Delivery"  with linespoint lt 1 ps 1 lw 4 lc 2 pt 4, \
     ''                          using 1:5 title "Global Delivery" with linespoint lt 1 ps 1 lw 4 lc 3 pt 8
