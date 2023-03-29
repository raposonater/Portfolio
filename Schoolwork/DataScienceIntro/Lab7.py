#lab7
#Alex Raposo ID:0787601
#This class is interesting... machine learning is cool
import numpy
import matplotlib.pyplot as plt
import sklearn.datasets
from sklearn import preprocessing
from sklearn.cluster import KMeans

#IF IM BEING COMPLETELY FUCKING HONEST I HAVE NO CLUE WHAT IS GOING ON HERE LOL. KMEANS ALGORITHIM MY ASS
#SHE HASN'T EXPLAINED SHIT, JUST WHAT SOME STUFF MEANS

data=sklearn.datasets.load_iris()
numData=data['data']


scaledData=preprocessing.scale(numData)
kmeans = KMeans(n_clusters=2, max_iter=300)
kmeans.fit(scaledData)
predictions = kmeans.predict(scaledData)

plt.subplot(121)
plt.title("KMeans with 2 clusters on Iris dataset")
plt.scatter(scaledData[:,0],scaledData[:,1], c=predictions)

kmeans = KMeans(n_clusters=3, max_iter=300)
kmeans.fit(scaledData)
predictions = kmeans.predict(scaledData)

plt.subplot(122)
plt.title("KMeans with 3 clusters on Iris dataset")
plt.scatter(scaledData[:,0],scaledData[:,1], c=predictions)
plt.show()







'''
SSE=[] #keeps track of how good our clusters are | number indicates how far apart samples are from cluster center (data gets better around 3 clusters)

for i in range(1,9):
    kmeans = KMeans(n_clusters=i, max_iter=300)
    kmeans.fit(scaledData)
    SSE.append(kmeans.inertia_)

plt.xlabel("# of clusters")
plt.ylabel("SSE")
plt.plot(range(1,9),SSE)
plt.show()
'''
