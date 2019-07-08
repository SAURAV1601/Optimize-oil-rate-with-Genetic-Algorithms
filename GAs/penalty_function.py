import numpy as np

from math import pi
from math import sqrt

class Penalty(object):
	"""
	"""
	def __init__(self, reservoir_pressure, reservoir_temperature,
				 well_depth, tubing_diameter, Co, Ud, water_oil_ratio,
				 oil_density, water_specific_gravity, tubing_temperature,
				 gas_specific_gravity, friction_factor, Z_factor,
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
		self.gc         = acceleration_gravity
		self.Psc        = standard_pressure
		self.Tsc        = standard_temperature
		self.Twh        = tubing_temperature
		self.Z          = Z_factor
		self.A          = self.cross_section_area()
		self.rho_gas    = self.gas_density()
		self.rho_liquid = self.liquid_density()
		
	def gas_density(self):
		'''
		'''
		return 28.97 * self.sg_gas * self.Pr / (10.73 * self.Tr)

	def liquid_density(self):
		'''
		'''
		return (self.rho_oil + self.wor * self.rho_water) / (self.wor + 1)

	def cross_section_area(self):
		'''
		'''
		return pi * self.D ** 2 / 4

	def superficial_gas(self, qg, P):
		'''
		'''
		return (self.Z * self.Psc * self.Twh * qg) / (self.Tsc * P * self.A)

	def superficial_liquid(self, ql):
		'''
		'''
		return ql / self.A

	def gas_holdup(self, qg, ql, P):
		'''
		'''
		Vmix = self.superficial_liquid(ql) + self.superficial_gas(qg, P)

		return self.superficial_gas(qg, P) / (self.Co * Vmix + self.Ud)

	def mix_density(self, qg, ql, P):
		'''
		'''
		mix = self.gas_holdup(qg, ql, P) * self.rho_gas + \
				(1 - self.gas_holdup(qg, ql, P) * self.rho_liquid)

		return mix

	def velocity_scaled(self, qg, ql, P):
		'''
		'''
		Vmix = self.superficial_liquid(ql) + self.superficial_gas(qg, P)

		return Vmix / sqrt(self.g * self.D)

	def density_scaled(self, qg, ql, P):
		'''
		'''
		mix = self.mix_density(qg, ql, P)

		return mix * self.L * self.g / (self.gc * self.Pr)

	def gas_rate_scaled(self, qg):
		'''
		'''
		return qg / (self.L * self.D * sqrt(self.g * self.D))

	def alpha(self):
		'''
		'''
		return 4 * self.Twh * self.Psc / (pi * self.Tsc * self.Pr)

	def differential(self, qg, ql, z, P):
		'''
		'''
		rho = self.density_scaled(qg, ql, P)
		V   = self.velocity_scaled(qg, ql, P)

		u   = 1 + self.alpha() * rho * V * \
				self.gas_rate_scaled(qg) / (P / self.Pr) ** 2

		return z * rho * (1 + 0.5 * self.f * V ** 2) / u

