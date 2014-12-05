set terminal pdf dashed size 4,2.5
set output "crowdtap-deps-cdf.pdf"
# vs: set ft=plot

# set title "Crowdtap Dependencies" font "Times-Roman,14"
set xlabel "Number of Dependencies" # font "Times-Roman,8"
set ylabel "Fraction of Messages w/ deps >= x" # font "Times-Roman,8"

set logscale xy # log log sur les deux axes
set xrange[1:10000]
set yrange[0.0001:1.5]

# set ytics "0.1" 0.1 "0.2" 0.8
set ytics ( "0.0" 0.0001, "0.001" 0.0011, "0.01" 0.0101, "0.1" 0.1001, "1.0" 1.0001 )

set label 1 "5" at 6.2, 0.0136 font "Times-Roman,7"
set label 2 "54" at 35, 0.0065 font "Times-Roman,7"
set label 3 "79" at 80, 0.0136 font "Times-Roman,7"
set label 4 "300" at 300, 0.0131 font "Times-Roman,7"
set arrow from 1,0.0101 to 10000,0.0101 nohead lt 2 lc rgb "black" lw 2
set label 11 "8" at 7.8, 0.0015 font "Times-Roman,7"
set label 12 "248" at 135, 0.00075 font "Times-Roman,7"
set label 13 "678" at 370, 0.00075 font "Times-Roman,7"
set label 14 "1270" at 1300, 0.0015 font "Times-Roman,7"
set arrow from 1,0.0011 to 10000,0.0011 nohead lt 2 lc rgb "black" lw 2

set key top right

plot "crowdtap-deps-cdf.dat" using 1:(0.0001+$2) t "w/ ro w/o tracked" with linespoints, \
     "crowdtap-deps-cdf.dat" using 1:(0.0001+$3) t "w/ ro w/ tracked" with linespoints, \
     "crowdtap-deps-cdf.dat" using 1:(0.0001+$4) t "w/o ro w/o tracked" with linespoints, \
     "crowdtap-deps-cdf.dat" using 1:(0.0001+$5) t "w/o ro w/ tracked" with linespoints
