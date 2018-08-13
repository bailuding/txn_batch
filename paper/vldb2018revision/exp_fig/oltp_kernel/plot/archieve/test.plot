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

set key font "Times,40" at graph .98,graph .95 spacing 1 width -1 samplen 1

set output 'tmp.eps'


set style data histogram
set style histogram columnstacked
set termoption enhanced


plot newhistogram '8', './data/cicada_latency.dat' using 2:xtic('cicada'), '' u 2:xtic('test'), newhistogram '16', './data/cicada_latency.dat' using 3:xtic('cicada'), '' u 3:xtic('test')
