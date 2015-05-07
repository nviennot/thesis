reset
set terminal postscript eps enhanced
set style data histograms
set style histogram rowstacked

unset title
set style fill solid
set border 9

unset key
set xtic border in scale 2,0.5 nomirror rotate by 90
set xtic nomirror offset 0,-14
set xtic font "NimbusSanL-Regu, 20"
unset ytics
set y2tics (10, 20, 30) rotate by 90
set y2tics offset 0,-1
set boxwidth 0.7 absolute
set xzeroaxis ls 1
set size .6, 1.5

set bmargin 15

set yrange [0:31]

set y2label "% over all process races" offset -2,0 font "NimbusSanL-Regu, 20"

plot \
	'race-effects.dat' using 2:xticlabels(1)
