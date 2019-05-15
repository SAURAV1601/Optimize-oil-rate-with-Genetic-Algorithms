"""
"""

import numpy as np

from population import Population
from selection  import Selection
from crossover  import Crossover
from mutation   import Mutation

class GAEngine(object):
    """
    """
    def __init__(self, population, selection, crossover, mutation):
        self.population = population
        self.selection  = selection
        self.crossover  = crossover
        self.mutation   = mutation
        self.size       = len(self.population)

    def next(self):
        """
        """
        children = self.selection.best_individual(self.population)

        while len(children) < self.size:
            # selection
            father, mother = self.selection.selection(self.population)

            # crossover
            chromosome = self.crossover.crossover(father, mother)

            # mutation
            chromosome = self.mutation.mutation(chromosome)

            children = np.concatenate((children, chromosome))

        self.population = children

    def run(self, iteration=100):
        """
        """
        for i in range(iteration):
            self.next()
            print("Loop: {} | X = {} | Y = {}".format(i, \
                            self.population[0][0], self.population[0][1]))

        print('Solution found: X =', self.population[0][0], \
                                            ', Y =', self.population[0][1])

        return self.population[0]
