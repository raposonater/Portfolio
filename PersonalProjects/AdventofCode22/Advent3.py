half1,half2="",""
cumcount=0

gay="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
# with open ('inputday3.txt', 'r') as infile:
#     for line in infile:
#         half1=line[:int(len(line)/2)]
#         half2=line[int(len(line)/2):]
#         fuckyou=0
#         for letter in half1:
#             if fuckyou==0:
#                 if half2.find(letter)>-1:
#                     cumcount+=int(gay.find(letter))+1
#                     print(cumcount)
#                     fuckyou+=1

list1=[]
count=0
with open ('inputday3.txt', 'r') as infile:
    for line in infile:
        count+=1
        list1.append(line.strip("\n"))
        if (count==3):
            print(list1)
            fuckyou=0
            for letter in list1[0]:
                if fuckyou==0:
                    if list1[1].find(letter)>-1 and list1[2].find(letter)>-1:
                        cumcount+=int(gay.find(letter))+1
                        fuckyou+=1
            count=0
            list1.clear()
print(cumcount)


