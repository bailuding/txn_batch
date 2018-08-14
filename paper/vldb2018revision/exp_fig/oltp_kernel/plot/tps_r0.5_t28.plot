set xlabel 'Zipfian Theta'
set ylabel 'Throughput (M) / Second'
# set styles
set style line 1 lc rgb "#00FFFF" lw 2.5 lt 1 pt 1 ps 2
set style line 2 lc rgb "#1E90FF" lw 2.5 lt 1 pt 2 ps 2
set style line 3 lc rgb "#8A2BE2" lw 2.5 lt 1 pt 3 ps 2
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
set xlabel font "Times,40" offset 0,-8.5
set ylabel font "Times,40" offset -3.5,0

set xtics font "Times,40" offset 0,-6
set ytics font "Times,40"

set key font "Times,40" at graph .98,graph .27 spacing 1 width -1 samplen 1

set output 'tmp.eps'

set style data linespoints
set xtics ("0.4" 1, "0.6" 2, "0.8" 3, "0.9" 4, "0.95" 5, "0.99" 6)
set xrange[1:6]
set yrange[0:4.5]
set ytics 0, 1, 4

set key maxrows 2 at graph 0.99,graph 0.97 Left width -1.5 spacing 0.8

plot \
'./data/reorder_b1_r0.5_t28_tps.dat' \
using 1:3 title 'rc' ls 6, \
'./data/cicada_r0.5_t28_tps.dat' \
using 1:3 title 'cicada' ls 1, \
'./data/silo_t28_tps.dat' \
using 1:3 title 'silo' ls 8, \
'./data/tictoc_t28_tps.dat' \
using 1:3 title 'tictoc' ls 3, \
'./data/ermia_t28_tps.dat' \
using 1:3 title 'ermia' ls 2, \

