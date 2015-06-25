set terminal pdf dashed size 2.6,3.5
set style data histograms
set style histogram rowstacked

set output "race-effects.pdf"

unset title
set border 9

unset key
set xtic border nomirror rotate by 90 offset 0,-9

unset ytics
set y2tics (5, 10, 15, 20, 25) rotate by 90 offset 0,-0.7

set boxwidth 0.7
# set size .6, 1.5

set bmargin 15

set yrange [0:25]

set y2label "% over all process races" offset -2,0

plot \
	'race-effects.dat' using 2:xticlabels(1) lt 2 fs solid 0.3
