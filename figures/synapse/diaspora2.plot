set terminal pdf dashed size 7.5,2.2 font 'Times-Roman,16'
set tmargin at screen 0.99
set lmargin at screen 0.075
set rmargin at screen 0.99
set output 'diaspora2.pdf'
set object 1 rect from 0.0,0.6 to 54.982421875,1.4 fc ls 4 fs pattern 7 bo -1
set object 2 rect from 60.8828125,0.6 to 110.959228515625,1.4 fc ls 3 fs pattern 6 bo -1
set object 3 rect from 119.140625,0.6 to 211.684326171875,1.4 fc ls 4 fs pattern 7 bo -1
set object 4 rect from 221.745361328125,0.6 to 313.7412109375,1.4 fc ls 3 fs pattern 6 bo -1
set object 5 rect from 340.276611328125,0.20000000000000007 to 355.926513671875,0.4000000000000001 fc ls 4 fs pattern 7 bo -1
set object 6 rect from 340.3203125,0.0 to 363.984130859375,0.2 fc ls 3 fs pattern 6 bo -1
set object 7 rect from 355.606689453125,-0.2 to 390.755615234375,0.0 fc ls 4 fs pattern 7 bo -1
set object 8 rect from 363.818603515625,-0.4 to 393.822998046875,-0.2 fc ls 3 fs pattern 6 bo -1
set ytics axis nomirror rotate by 45 offset 0,0.2
set yrange [-0.5:2.3]
set mytics 0.1
set ytics ("Mailer" 0,"Diaspora" 1)
set xlabel 'Time [ms]' offset 0,0.4
set xrange [0.0:397.76122802734375]
set grid xtics
set label '0' at 0,-0.7 center
set label '30' at 30,-0.7 center
set label '60' at 60,-0.7 center
set label '90' at 90,-0.7 center
set label '120' at 120,-0.7 center
set label '150' at 150,-0.7 center
set label '180' at 180,-0.7 center
set label '210' at 210,-0.7 center
set label '240' at 240,-0.7 center
set label '270' at 270,-0.7 center
set label '300' at 300,-0.7 center
set label '330' at 330,-0.7 center
set label '360' at 360,-0.7 center
set label '390' at 390,-0.7 center
set xtics ('' 0,'' 30,'' 60,'' 90,'' 120,'' 150,'' 180,'' 210,'' 240,'' 270,'' 300,'' 330,'' 360,'' 390)
set object 9 rect from 7.8764599609375,1.5 to 360.19361816406246,2.2 front fs solid 0 noborder
set object 10 rect from 7.8764599609375,1.7 to 27.567609863281252,2 front fc ls 4 fs pattern 7 bo -1
set label 'User 1 context' at 29.536724853515626,1.85 front
set object 11 rect from 122.6102267252604,1.7 to 142.30137662760416,2 front fc ls 3 fs pattern 6 bo -1
set label 'User 2 context' at 144.27049161783853,1.85 front
set object 12 rect from 237.3439934895833,1.7 to 257.0351433919271,2 front fc ls 1 fs pattern 5 bo -1
set label 'Disconnected' at 259.0042583821615,1.85 front
set nokey
set object 200 rect from 0,-0.4 to 330,0.4 fc ls 1 fs pattern 5 bo -1 noborder

set object rect from 22,0.85 to 36,1.2  fs solid 0 noborder
set label "①" at 22,1 font 'Times-Roman,26'

set object rect from 80,0.85 to 94,1.2  fs solid 0 noborder
set label "②" at 80,1 font 'Times-Roman,26'

set object rect from 157,0.85 to 171,1.2  fs solid 0 noborder
set label "③" at 157,1 font 'Times-Roman,26'

set object rect from 260,0.85 to 275,1.2  fs solid 0 noborder
set label "④" at 260,1 font 'Times-Roman,26'

set object rect from 260,0.85 to 275,1.2  fs solid 0 noborder
set label "⑤" at 340,0.6 font 'Times-Roman,26'

set object rect from 260,0.85 to 275,1.2  fs solid 0 noborder
set label "⑥" at 370,0.2 font 'Times-Roman,26'
plot -5
