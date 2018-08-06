set xlabel "  \nNumber of Threads"
set ylabel "Latency / Milliseconds"
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

set xtics font "Times,40" offset -2,-3
set ytics font "Times,40"

set key font "Times,40" at graph .98,graph .95 spacing 1 width -1 samplen 1

set output 'tmp.eps'


set style data histogram
set style histogram columnstacked
set style fill solid 0.5 border -1
set boxwidth 0.5
set key at graph 0.3,graph 0.96 Left autotitle columnheader width -1
set termoption enhanced
set xtics rotate by -45 offset 0,0

set xlabel offset 0,-2.5
set ytics 0, 100

plot \
newhistogram '{/=40 8}' lt 1, \
'./data/cicada_t8_latency.dat' using 2:key(1), \
'./data/reorder_b1_t8_latency.dat' using 2, \
newhistogram '{/=40 24}' lt 1, \
'./data/cicada_t24_latency.dat' using 2, \
'./data/reorder_b1_t24_latency.dat' using 2, \
newhistogram '{/=40 40}' lt 1, \
'./data/cicada_t40_latency.dat' using 2, \
'./data/reorder_b1_t40_latency.dat' using 2, \
newhistogram '{/=40 56}' lt 1, \
'./data/cicada_t56_latency.dat' using 2, \
'./data/reorder_b1_t56_latency.dat' using 2, \
