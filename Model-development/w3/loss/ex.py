import numpy as np
import pandas as pd

with open('w3-oil-loss.dat', 'r') as i, open('w3_oil_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w3-water-loss.dat', 'r') as i, open('w3_water_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w3-whft-loss.dat', 'r') as i, open('w3_whft_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

with open('w3-whfp-loss.dat', 'r') as i, open('w3_whfp_loss.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)

print('done!')
