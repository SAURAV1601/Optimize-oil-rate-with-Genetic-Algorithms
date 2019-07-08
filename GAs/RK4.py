from penalty_function import Penalty

def dPdz(qg, ql, z, P): 
	'''
	'''
	equation = Penalty(815, 595, 7000, 2.875 / 12, 1.08, 
						1.4764, 1, 54.6, 1.01, 595, 0.65, 0.002, 1)
	return equation.differential(qg, ql, z, P)

# Finds value of y for a given x using step size h 
# and initial value y0 at x0. 
def rungeKutta(z0, P0, z, h, qg, ql): 
	'''
	'''
	# n = (int)((z - z0) / h) 
	# n = 1000000
	y = P0 
	# for i in range(1, n + 1):
	while True:
		
		k1 = h * dPdz(qg, ql, z0, y) 
		k2 = h * dPdz(qg, ql, z0 + 0.5 * h, y + 0.5 * k1) 
		k3 = h * dPdz(qg, ql, z0 + 0.5 * h, y + 0.5 * k2) 
		k4 = h * dPdz(qg, ql, z0 + h, y + k3) 

		# Update next value of y 
		y = y + (1.0 / 6.0)*(k1 + 2 * k2 + 2 * k3 + k4) 

		# Update next value of z
		z0 = z0 + h

		if z0 >= z:
			break

	return y 

# Driver method 
z0 = 0
P0 = 100 / 790
z  = 1
h  = 0.5
qg = 0.72367
ql = 0.042929
print('The value of P at z is:', rungeKutta(z0, P0, z, h, qg, ql))
