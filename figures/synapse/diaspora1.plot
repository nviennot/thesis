set terminal pdf dashed size 9,2.5 font 'Times-Roman,16'
set tmargin at screen 0.99
set lmargin at screen 0.115
set rmargin at screen 0.99
set output 'diaspora1.pdf'
set object 1 rect from 0.0,2.6 to 68.799560546875,3.4 
set object 2 rect from 19.2890625,2.6 to 48.02880859375,3.4 fc ls 4 fs pattern 2 bo -1
set object 3 rect from 23.539306640625,2.6 to 28.200927734375,3.4 
set object 4 rect from 32.673583984375,2.6 to 42.11767578125,3.4 
set object 5 rect from 56.472900390625,1.6 to 103.302001953125,2.4 fc ls 3 fs pattern 6 bo -1
set object 6 rect from 56.483154296875,0.6 to 135.369140625,1.4 fc ls 3 fs pattern 6 bo -1
set object 7 rect from 57.031982421875,1.6 to 101.784912109375,2.4 
set object 8 rect from 57.42724609375,0.6 to 133.2919921875,1.4 
set object 9 rect from 112.013916015625,0.6 to 132.955810546875,1.4 fc ls 4 fs pattern 2 bo -1
set object 10 rect from 112.8701171875,0.6 to 119.273681640625,1.4 
set object 11 rect from 121.634521484375,0.6 to 130.5400390625,1.4 
set object 12 rect from 136.66650390625,2.6 to 139.88623046875,3.4 fc ls 3 fs pattern 6 bo -1
set object 13 rect from 137.462646484375,2.6 to 138.866455078125,3.4 
set object 14 rect from 138.58447265625,-0.4 to 141.87939453125,0.4 fc ls 3 fs pattern 6 bo -1
set object 15 rect from 139.2978515625,-0.4 to 140.673828125,0.4 
set ytics axis nomirror rotate by 45 offset 0,0.2
set yrange [-0.5:4.3]
set mytics 0.1
set ytics ("Spree" 0,"Semantic\nanalyser" 1,"Mailer" 2,"Diaspora" 3)
set xlabel 'Time [ms]' offset 0,0
set xrange [0.0:143.2981884765625]
set grid xtics
set label '0' at 0,-1.0 center
set object 16 rect from 11.0,-2 to 12.0,4.5 fs solid 1.0 noborder
set arrow from 10.0,-0.7 to 10.0,4.5 nohead ls 5 lc 0 lw 4
set arrow from 13.0,-0.7 to 13.0,4.5 nohead ls 5 lc 0 lw 4
set label '60' at 20,-1.0 center
set label '75' at 35,-1.0 center
set label '90' at 50,-1.0 center
set label '105' at 65,-1.0 center
set label '120' at 80,-1.0 center
set label '135' at 95,-1.0 center
set object 17 rect from 106.0,-2 to 107.0,4.5 fs solid 1.0 noborder
set arrow from 105.0,-0.7 to 105.0,4.5 nohead ls 5 lc 0 lw 4
set arrow from 108.0,-0.7 to 108.0,4.5 nohead ls 5 lc 0 lw 4
set label '2640' at 110,-1.0 center
set label '2655' at 125,-1.0 center
set label '2670' at 140,-1.0 center
set xtics ('' 0,'' 20,'' 35,'' 50,'' 65,'' 80,'' 95,'' 110,'' 125,'' 140)
set object 18 rect from 2.837587890625,3.5 to 138.9733642578125,4.2 front fs solid 0 noborder
set object 19 rect from 2.837587890625,3.7 to 9.9315576171875,4 front 
set label 'Application/DB' at 10.640954589843751,3.85 front
set object 20 rect from 49.113917073567706,3.7 to 56.207886800130204,4 front fc ls 4 fs pattern 2 bo -1
set label 'Synapse publish' at 56.917283772786455,3.85 front
set object 21 rect from 95.39024625651041,3.7 to 102.48421598307291,4 front fc ls 3 fs pattern 6 bo -1
set label 'Synapse subscribe' at 103.19361295572917,3.85 front
set nokey
set object rect from 22,0.85 to 36,1.2  fs solid 0 noborder
set label "①" at 2.5,2.95 font 'Times-Roman,26'

set object rect from 80,0.85 to 94,1.2  fs solid 0 noborder
set label "②" at 70,1.95 font 'Times-Roman,26'

set object rect from 157,0.85 to 171,1.2  fs solid 0 noborder
set label "③" at 70,0.95 font 'Times-Roman,26'

set object rect from 260,0.85 to 275,1.2  fs solid 0 noborder
set label "④" at 130,2.95 font 'Times-Roman,26'

set object rect from 260,0.85 to 275,1.2  fs solid 0 noborder
set label "⑤" at 132,0 font 'Times-Roman,26'
plot -5
