set xlabel 'Number of Connections'
set ylabel 'Latency / Milliseconds'
# set styles
set style line 1 lc rgb "#009900" lw 3 lt 1 pt 1 ps 2
set style line 2 lc rgb "#CC6633" lw 3 lt 1 pt 2 ps 2
set style line 3 lc rgb "#33CCFF" lw 3 lt 1 pt 3 ps 2
set style line 4 lc rgb "#DA70D6" lw 2.5 lt 1 pt 4 ps 2
set style line 5 lc rgb "#FFA500" lw 2.5 lt 1 pt 5 ps 2
set style line 6 lc rgb "#FF0000" lw 2.5 lt 1 pt 6 ps 2
set style line 7 lc rgb "#F0E68C" lw 2.5 lt 1 pt 7 ps 2
set style line 8 lc rgb "#9ACD32" lw 2.5 lt 1 pt 8 ps 2
set style line 9 lc rgb "#2E8B57" lw 2.5 lt 1 pt 9 ps 2

# set terminals
set terminal postscript eps noenhanced color font 'Times' size 5inch,3.5inch

# set margin
set lmargin at screen 0.15
set rmargin at screen 1
set tmargin at screen 1
set bmargin at screen 0.2

# set font sizes
set xlabel font "Times,40" offset 0,-1
set ylabel font "Times,40" offset -2.5,0

set xtics font "Times,40" offset 0,-1
set ytics font "Times,40"

set key font "Times,40" at graph .98,graph .98 spacing 1 width -1.5 samplen 1.5

set output 'tmp.eps'


set style data linespoints
set xtics 5,5,30 offset 0,-3.5
set xlabel offset 0,-5.5

set key maxrows 3 at graph 0.38,graph 0.96 width -2 Left


set yrange [0:]
set xrange [:30]
set xtics 5 offset 0,-3

plot \
'data/hekaton_nobatch_latency.dat' \
using 1:2 title 'nobatch' ls 1, \
'data/hekaton_normal_latency.dat' \
using 1:2 title 'batch' ls 2, \
'data/hekaton_reorder_latency.dat' \
using 1:2 title 'reorder' ls 3, \
