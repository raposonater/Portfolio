#lab10
#finnaly done...
#alex raposo ID:0787601
import numpy as np
import time
#PART 3
#1000 random number array
array = np.random.randint(1, 100, size=1000)
#print out shape and datatype of the array
print("Array shape:", array.shape)
print("Array datatype:", array.dtype)

#print the min, max, sum, mean, and sd
print("Minimum value:", np.min(array))
print("Maximum value:", np.max(array))
print("Sum of values:", np.sum(array))
print("Mean value:", np.mean(array))
print("Standard deviation:", np.std(array))



#PART 4
sizelist=[10, 100, 1000, 10000, 100000, 1000000]
for num in sizelist:
    #1000 random number array
    array = np.random.randint(1, 100, size=num)

    #QUICKSORT
    starttime=time.time()
    quicksortarray=np.sort(array)
    endtime=time.time()
    print("Quicksort, size",num,":",(endtime-starttime),"seconds")

    #MERGESORT
    starttime=time.time()
    mergesortarray=np.sort(array,kind='mergesort')
    endtime=time.time()
    print("Mergesort, size",num,":",(endtime-starttime),"seconds")

    #HEAPSORT
    starttime=time.time()
    mergesortarray=np.sort(array,kind='heapsort')
    endtime=time.time()
    print("Heapsort , size",num,":",(endtime-starttime),"seconds")

#OBSERVATIONS
    #I mean it's pretty obvious that as the size goes up, so does the sorting time
    #It also seems that you supplied the sorting methods from most to least efficient.
    # Quicksort is the quickest, followed by mergesort, then heapsort.
