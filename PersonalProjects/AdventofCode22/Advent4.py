import re
nword=0
with open ('inputday4.txt', 'r') as infile:
    for line in infile:
        stuff=line.strip("\n")
        list1=re.findall('[0-9]+', line)
        print(list1)
        if (int(list1[1])>=int(list1[2]) and int(list1[1])<=int(list1[3])):
            nword+=1
            print("balls")
        elif (int(list1[3])>=int(list1[0])) and (int(list1[3])<=int(list1[1])):
            nword+=1
            print("cum")
        else:
            print()


print(nword)
