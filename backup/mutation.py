"""
*/
Mutation class
/*
"""

import numpy as np

from copy import deepcopy
from random import random
from numpy.random import uniform

from population import Population

class Mutation():
	"""
	docstring for Mutation
	"""
	def __init__(self, *args, pm=0.5):

		assert 0.0 < pm < 1.0, "Invalid mutation probability."

		self.pm   = pm
		self.args = args

	def mutation(self, chromosome):
		"""
		"""
		n_vars = len(self.args)
		assert n_vars > 0, "There are no variable conditions."
		
		chromosome = deepcopy(chromosome)

		for i, (gene, cond) in enumerate(zip(chromosome, self.args)):
			do_mutation = True if random() <= self.pm else False
			if do_mutation:
				aux = gene + (uniform(0, 1) - 0.5) * 0.5 * \
											(cond[1] - cond[0])

				while cond[0] > aux or cond[1] < aux:
					aux = gene + (uniform(0, 1) - 0.5) * 0.5 * \
											(cond[1] - cond[0])

				chromosome[i] = aux

		return [chromosome]

