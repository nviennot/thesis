# vs: set ft=plot

set xrange[-0.5:6.5]
set yrange[1:150000]

set title "Crowdtap Dependencies"
set xlabel "Number of Dependencies"
set ylabel "Number of messages"

# Select histogram data
set style data histogram
# Give the bars a plain fill pattern, and draw a solid line around them.
set style fill pattern 4

set xtic rotate by -45 scale 0 font ",8"

set key top right
set logscale y

set style histogram clustered
plot for [COL=2:5] 'crowdtap-deps-hist.dat' using COL:xticlabels(1) title columnheader
