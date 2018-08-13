import os
import sys
import re
import shutil
import subprocess
from subprocess import Popen, PIPE, STDOUT
from time import localtime, strftime

def draw(plotout, pdfout):
    # call gnuplot
    p = Popen('gnuplot ' + plotout, shell=True, stdin=PIPE, \
                stdout=PIPE, stderr=STDOUT)
    print('plot ' + plotout + ' to ' + pdfout)
    if re.match('.*Cannot find or open file.*', str(p.stdout.read())):
        print('missing files: skip plotting ' + pdfout)
        print(str(p.stdout.read()))
        return
    # convert eps to pdf     
    os.system('ps2pdf tmp.eps tmp.pdf')
    # only save the last page in case of replot
    #os.system('pdftk tmp.pdf cat end output last.pdf')
    # crop the pdf
    r = subprocess.check_output('pdfcrop tmp.pdf crop.pdf', shell=True)
    print('plot ' + pdfout)
    shutil.copy2('crop.pdf', pdfout)
    sys.stdout.flush()

#figure_name = 'abort'
figure_names = ['latency_r0.5_t28', 'tps_r0.5_t28', 'tps_r0.5_z0.99']
dir = os.getcwd()

for figure_name in figure_names:
    plotout = os.path.join(dir, 'plot', figure_name + '.plot')
    pdfout = os.path.join(dir, 'pdf', figure_name + '.pdf')
    draw(plotout, pdfout)