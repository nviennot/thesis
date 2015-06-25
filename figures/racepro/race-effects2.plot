set terminal pdf dashed size 2.9,2.1
set style data histograms
set style histogram rowstacked

set output "race-effects2.pdf"

unset title
set border 3

unset key
set xtic nomirror rotate by -30
set ytic nomirror

set boxwidth 0.7

set yrange [0:25]

set ylabel "% over all process races" 

plot 'race-effects.dat' using 2:xticlabels(1) lt 2 fs solid 0.3
