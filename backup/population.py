"""
*/
Initialize population class
/*
"""

import numpy as np
import random

from numpy.random import uniform

def individual(boundary):
	"""
	"""
	if not boundary:
		raise ValueError("Invalid conditions for variables.")

	indv = np.array([])
	for bound in boundary:
		var = random.uniform(bound[0], bound[1])
		indv = np.append(indv, var)
	return [indv]

class Population(object):
	"""
	"""
	def __init__(self, population_size, *args):
		self.size = population_size
		self.args = args

	def init(self):
		"""
		"""
		n_vars = len(self.args)
		assert n_vars > 0, "There are no variable conditions."

		population = individual(self.args)

		for _ in range(self.size - 1):
			population = np.concatenate((population, individual(self.args)))

		return population
		