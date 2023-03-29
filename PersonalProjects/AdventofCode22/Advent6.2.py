import re
import collections
from collections import Counter
counter=0
with open ('inputday6.txt', 'r') as infile:
    found=0
    list1=[]
    for line in infile:
        for i in range(len(line)):
            list1.append(line[i])
            if i>=13:
                counted=collections.Counter(list1)
                countlist=re.findall('[0-9]+', str(counted))
                if len(countlist)==14 and counter==0:
                    spot=i+1
                    counter+=1
                else:
                    list1.pop(0)
                    
                    


print(spot)