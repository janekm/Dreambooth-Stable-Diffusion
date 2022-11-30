import shutil
import glob
import os
import sys

in_dir = sys.argv[1] if len(sys.argv) > 1 else "jpgsout"
out_dir = sys.argv[2] if len(sys.argv) > 2 else  "jpgscap"
txt_files = glob.glob(in_dir+'/*.txt')

if len(sys.argv) > 3:
    prefix = sys.argv[3]
else:
    prefix = ""
for txt_file in txt_files:
    with open(txt_file, 'r') as f:
        captions = f.readline().replace('/', ' ')
        f.close()
        shutil.copy(os.path.join(in_dir, os.path.basename(txt_file).replace('.txt', '.png')), os.path.join(out_dir, captions + '.png'))