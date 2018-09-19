import os

def create_stack_latency_file(cwd, basename):
  filename, ext = os.path.splitext(basename)
  outfile = os.path.join(cwd, filename + '_stack.dat')
  print('create stack latency file:', outfile)
  with open(os.path.join(cwd, basename)) as f:
    lines = f.readlines()
    with open(outfile, 'w') as out:
      prev = 0.0
      header = True
      for line in lines:
        if header:
          out.write(line)
          header = False
        else:
          tokens = line.split()
          out.write(tokens[0] + ' ' + str(float(tokens[1]) - prev) + '\n')
          prev = float(tokens[1])

          
cwd = os.getcwd()

for file in os.listdir(cwd):
  if 'latency' in file and 'latency_stack' not in file and file.endswith('.dat'):
    # Find all latency data file 
    # where it does not have a stack latency data file.
    basename = os.path.basename(file)
    filename, ext = os.path.splitext(basename)
    if os.path.isfile(os.path.join(cwd, filename + '_stack.dat')):
      continue
    
    # Parse the file.
    create_stack_latency_file(cwd, basename)
    