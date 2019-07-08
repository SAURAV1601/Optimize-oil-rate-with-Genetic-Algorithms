import numpy as np
import pandas as pd

with open('w2-oil-loss.dat', 'r') as i, open('w2_oil_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w2-water-loss.dat', 'r') as i, open('w2_water_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w2-whft-loss.dat', 'r') as i, open('w2_whft_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w2-whfp-loss.dat', 'r') as i, open('w2_whfp_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

print('done!')
