"""
*/
Crossover class
/*
"""

from random import random
from copy import deepcopy

class Crossover():
	"""
	Crossover operator with uniform crossover algorithm.

	Parameters
	----------
	pe: Exchange probability, usually 0.0001 to 0.1, default 0.5

	Returns
	-------
	chromosome: return two chromosomes after crossover
	"""

	def __init__(self, pe=0.5):

		assert 0.0 < pe < 1.0, "Invalid genome exchange probability."
		self.pe = pe

	def crossover(self, father, mother):
		"""
		"""
		chrome1 = deepcopy(father)
		chrome2 = deepcopy(mother)

		for i, (g1, g2) in enumerate(zip(chrome1, chrome2)):
			do_exchange = True if random() <= self.pe else False
			if do_exchange:
				chrome1[i], chrome2[i] = g2, g1

		do_random = True if random() <= 0.5 else False

		if do_random:
			return chrome1

		return chrome2


		