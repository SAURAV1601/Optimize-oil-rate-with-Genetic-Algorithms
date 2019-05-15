import numpy as np
import random

from math         import sin, cos, pi
from random       import random
from copy         import deepcopy
from numpy.random import uniform

class GAs():
	"""
	"""
	def __init__(self, fitness, lower, upper,
				 size   = 100,
				 n_vars = 2,
				 pe     = 0.5,
				 pm     = 0.5):
		self.fitness    = fitness
		self.size       = size
		self.n_vars     = n_vars
		self.lower      = lower
		self.upper      = upper
		self.pe         = pe
		self.pm         = pm
		self.population = self.init()

	def init(self):
		population = [uniform(self.lower, self.upper, size=self.n_vars) \
											for _ in range(self.size)]

		return population

	def score(self):
		score = [self.fitness(i[0], i[1], i[2], i[3]) for i in self.population]
		return score

	def next(self):
		scores = self.score()
		children = [self.population[np.argmax(scores)]]

		while len(children) < self.size:
			randA, randB = np.random.randint(0, self.size), \
										np.random.randint(0, self.size)

			father = self.population[randB]
			if scores[randA] > scores[randB]:
				father = self.population[randA]

			randA, randB = np.random.randint(0, self.size), \
										np.random.randint(0, self.size)

			mother = self.population[randB]
			if scores[randA] > scores[randB]:
				mother = self.population[randA]

			chrome1, chrome2 = self.crossover(father, mother)

			do_random = True if random() <= 0.5 else False

			chromosome = chrome1
			if do_random:
				chromosome = chrome2

			chromosome = self.mutation(chromosome, 0.6)

			children.append(chromosome)

		self.population = children

	def crossover(self, father, mother):
		"""
		"""
		assert 0.0 < self.pe < 1.0, "Invalid exchange probability."

		chrome1 = deepcopy(father)
		chrome2 = deepcopy(mother)

		for i, (g1, g2) in enumerate(zip(chrome1, chrome2)):
			do_exchange = True if random() <= self.pe else False
			if do_exchange:
				chrome1[i], chrome2[i] = g2, g1

		return chrome1, chrome2

	def mutation(self, chromosome):
		"""
		"""
		assert 0.0 < self.pm < 1.0, "Invalid mutation probability."

		chromosome = deepcopy(chromosome)
		
		for i, gene in enumerate(chromosome):
			do_mutation = True if random() <= self.pm else False
			if do_mutation:
				aux = gene + (uniform(0, 1) - 0.5) * 0.5 * \
											(self.upper - self.lower)

				while self.lower > aux or self.upper < aux:
					aux = gene + (uniform(0, 1) - 0.5) * 0.5 * \
											(self.upper - self.lower)

				chromosome[i] = aux

		return chromosome

	def run(self, loop=1000):
		ix = 0
		while ix < loop:
			ix += 1
			self.next()
			print("Loop: {} | X = {} | Y = {} | Z = {} | T = {}".format(ix, \
							self.population[0][0], self.population[0][1], \
							self.population[0][2], self.population[0][3] ))

		return self.population[0]

f = lambda x, y, z, t: y * sin(2 * pi * x) + x * cos(2 * pi * y) + t * z * cos(2 * z) - z * sin(z * t)
gen = GAs(f, -2, 2, n_vars=4, pm=0.55)
maxim = gen.run(loop=2000)
# print('Maximum found      X =', maxim[0], ', Y =', maxim[1])

