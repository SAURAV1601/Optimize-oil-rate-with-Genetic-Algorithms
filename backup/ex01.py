import random
import numpy as np

from math import sin, cos, pi

from population import Population
from selection  import Selection
from crossover  import Crossover
from mutation   import Mutation
from toolkits   import GAEngine

f = lambda x, y: y * sin(2 * pi * x) + x * cos(2 * pi * y)

population = Population(100, [0, 1], [0, 1]).init()
selection  = Selection(f, 100)
crossover  = Crossover(pe=0.5)
mutation   = Mutation([0, 1], [0, 1], pm=0.5)

engine = GAEngine(population, selection, crossover, mutation)



if '__main__' == __name__:
	engine.run(100)
