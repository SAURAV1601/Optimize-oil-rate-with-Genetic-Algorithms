import numpy as np
import pandas as pd

with open('w1-oil-loss.dat', 'r') as i, open('w1_oil_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w1-water-loss.dat', 'r') as i, open('w1_water_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w1-whft-loss.dat', 'r') as i, open('w1_whft_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w1-whfp-loss.dat', 'r') as i, open('w1_whfp_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

print('done!')
