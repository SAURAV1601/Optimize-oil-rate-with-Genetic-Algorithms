import numpy as np

from penalty_function import Penalty

# Python program to implement Runge Kutta method 
# A sample differential equation "dy / dx = (x - y)/2" 
def dP(qg, ql, Pwh): 
	P = Penalty(1750, 640, 4600, 2.875 / 12, 1.08, 1.4764, 1.5, 53, 1.07, 0.8, 0.002)
	return P.differential(qg, ql, Pwh)


# Finds value of y for a given x using step size h 
# and initial value y0 at x0. 
def rungeKutta(P0, x, h, qg, ql): 
	# Count number of iterations using step size or 
	# step height h 
	# n = (int)((x - x0)/h)
	n = 10 
	# Iterate for number of iterations 
	y = P0
	for i in range(1, n + 1): 
		"Apply Runge Kutta Formulas to find next value of y"
		k1 = h * dP(qg, ql, y) 
		k2 = h * dP(qg, ql, y + 0.5 * k1) 
		k3 = h * dP(qg, ql, y + 0.5 * k2) 
		k4 = h * dP(qg, ql, y + k3) 

		# Update next value of y 
		y = y + (1.0 / 6.0)*(k1 + 2 * k2 + 2 * k3 + k4) 

		# Update next value of x 
		# z = z + h 
	return y 

# Driver method 
P0 = 100
x  = 2
h  = 0.05
qg = 0.7154
ql = 0.040105

print('The value of y at x is: ', rungeKutta(P0, x, h, qg, ql))

# This code is contributed by Prateek Bhindwar 
