set xlabel 'Number of Threads'
set ylabel 'Abort Rate / %'
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
set lmargin at screen 0.1
set rmargin at screen 1
set tmargin at screen 1
set bmargin at screen 0.1

# set font sizes
set xlabel font "Times,40" offset 0,-5.5
set ylabel font "Times,40" offset -3.5,0

set xtics font "Times,40" offset 0,-3
set ytics font "Times,40"

set key font "Times,40" at graph .98,graph .95 spacing 1 width -1 samplen 1

set output 'tmp.eps'


set style data linespoints
set xtics 8, 8, 56
set ytics 0, 10, 50
set yrange [0:50]

set key maxrows 5 at graph 0.35,graph 0.95 Left width -1

plot \
'./data/cicada_abort.dat' \
using 1:2 title 'cicada' ls 1, \
'./data/reorder_b1_abort.dat' \
using 1:2 title 'rc' ls 6, \

