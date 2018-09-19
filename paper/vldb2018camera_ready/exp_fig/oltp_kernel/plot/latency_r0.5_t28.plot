set xlabel "  \nSkew Parameter of Zipfian Distribution"
set ylabel "Latency / Millisecond"
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
set bmargin at screen 0.22

# set font sizes
set xlabel font "Times,40" offset 0,-5.5
set ylabel font "Times,40" offset -3.5,0

set xtics font "Times,30" offset -2,-4
set ytics font "Times,40"

set key font "Times,40" at graph .98,graph .95 spacing 1 width -1 samplen 1

set output 'tmp.eps'


set style data histogram
set style histogram columnstacked
set style fill solid 0.5 border -1
set boxwidth 0.5
set key at graph 0.2,graph 0.96 Left autotitle columnheader width -1
set termoption enhanced
set xtics rotate by -90 offset 0,0

set xlabel offset 0,-3
set ytics 0, 0.2, 1.4
set yrange [0:1.3]

plot \
newhistogram '{/=40 0.4}' lt 1, \
'./data/reorder_b1_t28_z0.4_latency_stack.dat' using ($2/1000), \
'./data/cicada_t28_z0.4_latency_stack.dat' using ($2/1000):key(1), \
'./data/silo_t28_z0.4_latency_stack.dat' using ($2/1000), \
'./data/tictoc_t28_z0.4_latency_stack.dat' using ($2/1000), \
newhistogram '{/=40 0.6}' lt 1, \
'./data/reorder_b1_t28_z0.6_latency_stack.dat' using ($2/1000), \
'./data/cicada_t28_z0.6_latency_stack.dat' using ($2/1000), \
'./data/silo_t28_z0.6_latency_stack.dat' using ($2/1000), \
'./data/tictoc_t28_z0.6_latency_stack.dat' using ($2/1000), \
newhistogram '{/=40 0.8}' lt 1, \
'./data/reorder_b1_t28_z0.8_latency_stack.dat' using ($2/1000), \
'./data/cicada_t28_z0.8_latency_stack.dat' using ($2/1000), \
'./data/silo_t28_z0.8_latency_stack.dat' using ($2/1000), \
'./data/tictoc_t28_z0.8_latency_stack.dat' using ($2/1000), \
newhistogram '{/=40 0.9}' lt 1, \
'./data/reorder_b1_t28_z0.9_latency_stack.dat' using ($2/1000), \
'./data/cicada_t28_z0.9_latency_stack.dat' using ($2/1000), \
'./data/silo_t28_z0.9_latency_stack.dat' using ($2/1000), \
'./data/tictoc_t28_z0.9_latency_stack.dat' using ($2/1000), \
newhistogram '{/=40 0.95}' lt 1, \
'./data/reorder_b1_t28_z0.95_latency_stack.dat' using ($2/1000), \
'./data/cicada_t28_z0.95_latency_stack.dat' using ($2/1000), \
'./data/silo_t28_z0.95_latency_stack.dat' using ($2/1000), \
'./data/tictoc_t28_z0.95_latency_stack.dat' using ($2/1000), \
newhistogram '{/=40 0.99}' lt 1, \
'./data/reorder_b1_t28_z0.99_latency_stack.dat' using ($2/1000), \
'./data/cicada_t28_z0.99_latency_stack.dat' using ($2/1000), \
'./data/silo_t28_z0.99_latency_stack.dat' using ($2/1000), \
'./data/tictoc_t28_z0.99_latency_stack.dat' using ($2/1000), \
