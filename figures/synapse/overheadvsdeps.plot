set terminal pdf dashed size 6,3.0
set output "overheadvsdeps.pdf"

#set autoscale fix

#set format y "%.0e"
set ylabel "Publisher Overhead [ms] (log)" font "Times-Roman,14" offset 0.8,-1
#set ylabel offset +1.2,0
set yrange [3:230]

set tmargin 0

set xlabel "Number of Dependencies" font "Times-Roman,14" offset 0,0.8
#set xlabel offset 0,+1
set xrange [1:1000]
set xtics font "Times-Roman,14"
set ytics font "Times-Roman,14"

set logscale xy

set ytics (1,3,5,7,10,20,30,50,70,100,200,300,1000,3000)
set xtics (1,2,5,10,20,50,100,200,500,1000,2000,5000,10000) offset 0,0.3
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

plot 'overheadvsdeps.dat' using 1:6 title "MySQL"       with linespoint lt 1 ps 1 lw 4 lc 4 pt 2, \
     ''                     using 1:5 title "PostgreSQL"  with linespoint lt 1 ps 1 lw 4 lc 2 pt 4, \
     ''                     using 1:7 title "TokuMX"      with linespoint lt 1 ps 1 lw 4 lc 1 pt 6, \
     ''                     using 1:4 title "MongoDB"     with linespoint lt 1 ps 1 lw 4 lc 7 pt 1, \
     ''                     using 1:3 title "Cassandra"   with linespoint lt 1 ps 1 lw 4 lc 3 pt 8, \
     ''                     using 1:2 title "Ephemeral"   with linespoint lt 1 ps 1 lw 4 lc 5 pt 10
