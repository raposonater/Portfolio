"""
COIS1400H Lab 6
Alex Raposo ID:0787601
"""
import numpy as np
import matplotlib.pyplot as plt
from pydataset import data

iris=data('iris')
plt.subplot(221)
plt.scatter(iris.iloc[:,1],iris.iloc[:,1], s=10, marker=".")#compares the firs variable to itself of iris in a scatter plot
plt.title("Alex Raposo ID:0787601")
plt.subplot(222)
plt.scatter(iris.iloc[:,1],iris.iloc[:,2], s=10, marker=".")#compares the first and second variables of iris in a scatter plot
plt.title("Alex Raposo ID:0787601")
plt.subplot(223)
speciescount=[50,50,50] #total counts for each of the plant species
labeler = ['virginica', 'setosa', 'versicolor']
plt.pie(speciescount, labels = labeler)
plt.title("Alex Raposo ID:0787601")
plt.subplot(224)
plt.title("Alex Raposo ID:0787601")
plt.plot(iris.iloc[:,3],iris.iloc[:,1]) # i really like this one because it look stupid. To be fair, it didn't say I had to plot anything relevant (anyways i couldn't figure out how to put everything into a list for a histogram)
plt.show()
