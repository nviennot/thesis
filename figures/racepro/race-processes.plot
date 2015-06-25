set terminal pdf dashed size 2.4,1.68
set style data histograms
set style histogram rowstacked

set output "race-processes.pdf"

set xlabel "Number of processes involved"
set boxwidth 0.7
# set style fill solid border -1

unset key
set border 3
set xtics border in scale 1,0.5 nomirror scale .5
set xtics nomirror
set ytics (10, 20, 30, 40, 50) nomirror
set boxwidth 0.5 absolute
set xzeroaxis ls 1

set yrange [0:50]
set size 1,1
set ylabel "% over all process races" 

plot 'race-processes.dat' using 2:xticlabels(1) lt 2 fs solid 0.3
