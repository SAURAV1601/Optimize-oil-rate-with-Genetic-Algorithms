#!/usr/bin/python
# -*- coding: utf8 -*-

import pandas as pd
import numpy as np


w = pd.read_csv('w1-cali.csv')
w.columns = ['date', 'oil', 'gas', 'water', 'glr', 'whfp', 'whft']

w['date'] = pd.to_datetime(w['date'])

print(w.info())
print(w.isnull().sum())

w.fillna(0, inplace=True)
print(w.isnull().sum())
w.to_csv('w1.dat', index=False)

