import os
import shutil
import re

# Helper function to copy files given metrics.
def copy_helper(src_dir, dst_dir, exp_name, figure_type, metrics):
  for subdir in os.listdir(src_dir):
    if re.match(exp_name + '\.' + figure_type + '.*', subdir):
      print('exp ' + exp_name + ': ' + subdir)
      for m in metrics:
        for file in os.listdir(src_dir + '/' + subdir):
          if re.match('.*' + m + '\.pdf', file):
            # copy and rename the file
            srcfile = src_dir + '/' + subdir + '/' + file
            # if the file has Z in its name, extract the Z parameter.
            param = ''
            if re.match('.*Z.*', file):
              pos = file.find('Z')
              param = file[pos: pos + 4] + '_'
            dstfile = dst_dir + '/' + param + m + '.pdf'
            print('copy ' + srcfile + ' to ' + dstfile)
            shutil.copy(srcfile, dstfile)
            break
      break

# Copy pdfs from the snapshot to the experiment figure folder.
def copy_lp(src_dir, dst_dir, exp_name):
  metrics = ['tps', 'latency']
  copy_helper(src_dir, dst_dir, exp_name, 'lp', metrics)
  
def copy_hist(src_dir, dst_dir, exp_name):
  metrics = ['percent95_latency', 'percent100_latency']
  copy_helper(src_dir, dst_dir, exp_name, 'hist', metrics)

src_dir = '0_pdf_snapshot'
# Copy figures for greedy, bsize, reorder, basic, and restart.
exp_names = ['greedy', 'bsize', 'reorder', 'basic', 'restart', 'small_bank', 'load']
for exp_name in exp_names:
  dst_dir = exp_name
  copy_lp(src_dir, dst_dir, exp_name)
  copy_hist(src_dir, dst_dir, exp_name)
