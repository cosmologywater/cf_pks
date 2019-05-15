
import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('fof00001c.radeczwe13.2pc')

X = [data[row][1]  for row in range(len(data))]
Y = [data[row][2]  for row in range(len(data))]
Z = [X[row]*X[row] * Y[row] for row in range(len(data))]

plt.plot(X,Z,label='cola 2pcf')
plt.show()
