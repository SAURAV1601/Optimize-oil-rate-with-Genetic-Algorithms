import numpy as np

from math import pi
from math import sqrt

class Penalty(object):
	"""
	"""
	def __init__(self, reservoir_pressure, reservoir_temperature,
				 well_depth, tubing_diameter, Co, Ud, water_oil_ratio,
				 oil_density, water_specific_gravity, 
				 gas_specific_gravity, friction_factor,
				 water_density        = 62.37,
				 acceleration_gravity = 32.16,
				 standard_pressure    = 14.7,
				 standard_temperature = 520):
		self.Pr         = reservoir_pressure
		self.Tr         = reservoir_temperature
		self.D          = tubing_diameter
		self.L          = well_depth
		self.Co         = Co
		self.Ud         = Ud
		self.wor        = water_oil_ratio
		self.rho_oil    = oil_density
		self.sg_water   = water_specific_gravity
		self.sg_gas     = gas_specific_gravity
		self.f          = friction_factor
		self.rho_water  = water_density
		self.g          = acceleration_gravity
		self.Psc        = standard_pressure
		self.Tsc        = standard_temperature
		self.A          = self.cross_section_area()
		self.rho_gas    = self.rho_gas()
		self.rho_liquid = self.rho_liquid()
		
	def rho_gas(self):
		'''
		'''
		return 28.97 * self.sg_gas * self.Pr / (10.73 * self.Tr)

	def rho_liquid(self):
		'''
		'''
		return (self.rho_oil + self.wor * self.rho_water) / (self.wor + 1)

	def cross_section_area(self):
		'''
		'''
		return pi * self.D ** 2 / 4

	def slip_gas(self, qg):
		'''
		'''
		v = self.Psc * self.Tr * qg / (self.Tsc * self.Pr * self.A)
		return v

	def slip_liquid(self, ql):
		'''
		'''
		return ql / self.A

	def gas_holdup(self, qg, ql):
		'''
		'''
		yg = self.slip_gas(qg) / \
			(self.Co * (self.slip_gas(qg) + self.slip_liquid(ql)) + self.Ud)

		return yg

	def mixture_density(self, qg, ql):
		'''
		'''
		mix = self.gas_holdup(qg, ql) * self.rho_gas + \
				(1 - self.gas_holdup(qg, ql) * self.rho_liquid)

		return mix

	def u_scaled(self, qg, ql):
		return (self.slip_gas(qg) + self.slip_liquid(ql)) / \
											sqrt(self.g * self.D)

	def rho_scaled(self, qg, ql):
		'''
		'''
		return self.mixture_density(qg, ql) * self.L * self.g / self.Pr

	def qg_scaled(self, qg):
		'''
		'''
		return qg / (self.L * self.D * sqrt(self.g * self.D))

	def alpha(self):
		'''
		'''
		return 4 * self.Tr * self.Psc / (pi * self.Tsc * self.Pr)

	def differential(self, qg, ql, Pwh):
		'''
		'''
		dP = (self.rho_scaled(qg, ql) + \
				2 * self.f * self.rho_scaled(qg, ql) * \
					(self.u_scaled(qg, ql) ** 2)) / \
				(1 + self.alpha() * self.rho_scaled(qg, ql) * \
					self.qg_scaled(qg) / (Pwh / self.Pr) ** 2)

		return dP

# P = Penalty(1750, 640, 4600, 2.875 / 12, 1.08, 1.4764, 1.5, 53, 1.07, 0.8, 0.002)

# print(P.differential(5, 5, 100))



