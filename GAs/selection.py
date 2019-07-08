"""
*/
Selection class
/*
"""
import numpy as np

from random import sample


class Selection():
	"""
	Selection operator using Tournament Strategy.

    Parameters
    ----------

    fitness_function: function to evaluate each chromosome.
    size            : Size of population.
	"""
	def __init__(self, fitness, size):

		if not callable(fitness):
			raise ValueError("Invalid fitness function.")

		self.fitness = fitness
		self.size    = size

	def evaluation(self, population):
		"""
		"""
		if not population.any():
			raise ValueError("Invalid input population.")

		score = [self.fitness(i[0], i[1]) for i in population]
		return score

	def best_individual(self, population, opt='max'):
		"""
		Select the indivudual with the best score on fitness function.

		Parameters
		----------
		opt: Optimize object, accepted values: 'min', 'max',
			 default 'max'.

		Returns
		-------
		individual: type: list
		"""
		scores = self.evaluation(population)

		children = [population[np.argmax(scores)]]

		if opt == 'min':
			children = [population[np.argmin(scores)]]

		return children

	def selection(self, population):
		"""
		Random select two individuals.

		Returns
		-------

		father, mother: np.array, shape Q = (1, n_vars)
		"""
		score = self.evaluation(population)

		randA, randB = np.random.randint(0, self.size), \
									np.random.randint(0, self.size)

		father = population[randA]

		if score[randA] < score[randB]:
			father = population[randB]

		randA, randB = np.random.randint(0, self.size), \
									np.random.randint(0, self.size)

		mother = population[randA]

		if score[randA] < score[randB]:
			mother = population[randB]

		return father, mother


