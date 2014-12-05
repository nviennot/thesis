set terminal pdf dashed size 3.5,1.5
set output "overhead-hist.pdf"

# set key reverse Left horizontal at 13.8,111 width 3

set yrange[0:100]

set ylabel "% of Overhead" offset +2,0
set xlabel "Controllers" offset 0,+0.8
set xtics rotate by -30 offset -1.1,0
set grid y

set rmargin 4.5

set nokey
set label 'Crowdtap' at 0,108
set label 'Diaspora' at 4,108
set label 'Discourse' at 8,108

set ytics 20

set style data histograms
set style histogram rowstacked
set style fill solid border -1
set boxwidth 1

plot 'overhead-hist.dat' using (100.*($3-$2)/$3):xtic(1) lt 1 lc 0 fs solid 0.3, \
                    '' using (100.*$2/$3):xtic(1) lt 1 lc 0 fs solid 0, \
                    '' using 0:(96):(sprintf("%1.1fms", $3)) with labels rotate right notitle
