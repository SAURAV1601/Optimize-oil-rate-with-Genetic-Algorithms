import numpy as np
import pandas as pd

with open('w1.dat', 'r') as i, open('w1_before_process.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

print('done!')
