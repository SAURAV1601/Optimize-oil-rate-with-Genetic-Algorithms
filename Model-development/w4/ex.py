import numpy as np
import pandas as pd

with open('w4_cali.txt', 'r') as i, open('w4_temp.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace('\t', ' ')
        o.write(line)

w = pd.read_table('w4_temp.dat', sep=' ')
w['date'] = pd.to_datetime(w['date'])
##w['gas'] = w['gas'] * 1000
w.fillna(0, inplace=True)
##st = pd.DataFrame({'no': range(1, w.shape[0] + 1)})
##w = pd.concat([st, w], axis=1)
print(w.isnull().sum())
w.to_csv('w4_temp.dat', index=False)

with open('w4_temp.dat', 'r') as i, open('w4.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace(',', ' ')
        o.write(line)
