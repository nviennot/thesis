reset
set terminal postscript eps enhanced "NimbusSanL-Regu, 32"
set style data histograms
set style histogram rowstacked

set xlabel "Number of packages per race by %"
set boxwidth 0.8
set style fill solid border -1

unset key
set border 2
set xtics border in scale 1,0.5 nomirror scale .5
set xtics nomirror
set ytics (10, 20, 30, 40, 50) nomirror
set boxwidth 0.5 absolute
set xzeroaxis ls 1

set yrange [0:55]

plot \
	'race-packages.dat' using 2:xticlabels(1)

