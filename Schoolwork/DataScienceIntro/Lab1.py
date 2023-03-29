#COIS1400H Lab 1
#Alex Raposo ID:0787601
#01/16/2023 (MMDDYYYY)
#The purpose of this program is to understand randomness in python and to calculate pi using the monte carlo method

import random
import math
import time
inside=0
outside=0
iterations=1000000
#feel free to comment out the statement below!
#iterations=int(input("please input the # of iterations"))
#considering this is being marked. letting you know this is being completed in
#VSCode and then transferred to the IDLE environment to ensure it works for IDLE.

#seeding it
random.seed(int(round(time.time()*1000)))
for i in range (iterations):
    #selecting two random numbers between 0 and 1
    rng1=random.random()
    rng2=random.random()

    #calculating distance from origin
    distance=(math.sqrt(rng1**2+rng2**2)) #yes i used **2 instead of multiplying by itself.

    #incrementing counter
    if (distance>1):
        outside+=1
    else:
        inside+=1


#calculating value of pi
calcpi=4*(inside/iterations)

#print result
print("Calculation of pi is:",calcpi, "\nAmt outside of circle:",outside, \
      "\nAmt inside of circle:",inside)
      
print("OBSERVATIONS: I did take a stats course so as per standard distribution, as the number of iterations increase we should find more accurate calculations of pi.")
print("Additionally, if we make the variable that holds our calculated pi a float, it would be beneficial for increased iterations")
#going over the demo video it says part 2 is also a part where you have to sumbit a 1000 integer thing that checks if a number is greater or less than 5
#Although on the labs page it seems part 2 is just the monte carlo approach componnent, and I assume thats the part we need to submit. If you want me to make the counter program
#I can make it in 2 minutes no problem.
