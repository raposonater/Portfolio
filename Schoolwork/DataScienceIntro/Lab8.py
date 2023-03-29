#lab8
#Alex Raposo ID:0787601
#idk

#part1done

#part 2 decision tree
import numpy

import sklearn.datasets
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report, confusion_matrix

X,y=sklearn.datasets.load_iris(return_X_y=True)
X_trainingData, X_testData, y_trainingData, y_testData = train_test_split(X,y,test_size=0.33)

myClassifier= DecisionTreeClassifier()
myClassifier.fit(X_trainingData, y_trainingData)
prediction=myClassifier.predict(X_testData)

print(classification_report(y_testData, prediction))
print(confusion_matrix(y_testData, prediction))
####

from sklearn.model_selection import KFold, cross_val_score
myScores=cross_val_score(DecisionTreeClassifier(), X,y, scoring='accuracy', cv=KFold(n_splits=10))
print(myScores)
print(confusion_matrix(y_testData, prediction))

'''
#####
from sklearn.ensemble import RandomForestClassifier
rf=RandomForestClassifier()
rf.fit(X,y)
print(rf.predict(X))


#####
from sklearn.utils import shuffle
X = shuffle(X)
print(rf.predict(X))
'''
