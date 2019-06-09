#!/usr/bin/python
# -*- coding: utf8 -*-

import pandas as pd

import warnings
warnings.filterwarnings("ignore")

import matplotlib.pyplot as plt

plt.style.use('ggplot')

w1 = pd.read_csv('w1-cali.csv')

labels = ['7-2016', '10-2016', '1-2017', '4-2017', '7-2017', '10-2016',
          '1-2018', '4-2018', '7-2018', '10-2018', '1-2019']
tickvals = ['7/1/2016', '10/1/2016', '1/1/2017', '4/1/2017', '7/1/2017', '10/1/2017',
            '1/1/2018', '4/1/2018', '7/1/2018', '10/1/2018', '1/1/2019']

plt.figure(figsize=(11, 6))
plt.plot(w1['date'], w1['whfp'], label="whfp (psi)")
plt.plot(w1['date'], w1['whft'], label="whft (deg C)")
plt.plot(w1['date'], w1['wct'], label="wct (%bbl/bbl)")
plt.plot(w1['date'], w1['bhp'], label="bhp (psi)")
plt.plot(w1['date'], w1['gl_rate'], label="$Q_g$ (Mcf/d)")
plt.plot(w1['date'], w1['q_oil'], label="$Q_l$ (stb/d)")
plt.xticks(tickvals, labels)
plt.xlabel('Ngày')
plt.ylabel('Giá trị')
plt.legend(loc='best')
##plt.savefig('before-process.png', dpi=300)
plt.show()


