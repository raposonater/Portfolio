#lab9
import nltk
import ssl
import numpy
import matplotlib.pyplot as plt
import seaborn as sns

#was getting errors so i put this in from stack overflow
try:
    _create_unverified_https_context = ssl._create_unverified_context
except AttributeError:
    # Legacy Python that doesn't verify HTTPS certificates by default
    pass
else:
    # Handle target environment that doesn't support HTTPS verification
    ssl._create_default_https_context = _create_unverified_https_context

#nltk.download()
from nltk.corpus import stopwords
stopwordslist=stopwords.words('english')
print(stopwordslist)
macbethwords = nltk.corpus.gutenberg.words('shakespeare-macbeth.txt')
notinlist=[]
notinlist2=[]
for word in macbethwords:
    
    if (stopwordslist.count(word.lower())==0):
        notinlist.append(word)
    
#print(nltk.corpus.gutenberg.words('shakespeare-macbeth.txt'))
import string
punctuation= string.punctuation
punctuationlist=[]
for letter in punctuation:
    punctuationlist.append(letter)

    
for word in notinlist:   
    if (punctuationlist.count(word.lower())==0):
        notinlist2.append(word)
sns.set_style('darkgrid')
nlp_words=nltk.FreqDist(notinlist)
nlp_words.plot(20);
sns.set_style('darkgrid')
nlp_words=nltk.FreqDist(notinlist2)
nlp_words.plot(20);
