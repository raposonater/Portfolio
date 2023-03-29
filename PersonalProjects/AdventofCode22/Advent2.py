score=0
#a rock
#b paper
#c scissors
#x rock
#y paper
#z scissors

# with open ('inputday2.txt', 'r') as infile:
#     for line in infile:
#         if (line[0]=='A' and line[2]=='X') or (line[0]=='B' and line[2]=='Y') or (line[0]=='C' and line[2]=='Z'):
#             score+=3
#         elif ((line[0]=='A' and line[2]=='Y') or (line[0]=='B' and line[2]=='Z') | (line[0]=='C' and line[2]=='X')):
#             score+=6
#         if line[2]=='Z':
#             score+=3
#         elif line[2]=='Y':
#             score+=2
#         else:
#             score+=1
# print(score)

with open ('inputday2.txt', 'r') as infile:
     for line in infile:
        if (line[2]=='X'):
            if(line[0]=='A'):
                score+=3
            if(line[0]=='B'):
                score+=1
            if(line[0]=='C'):
                score+=2
        elif (line[2]=='Y'):
            score+=3
            if(line[0]=='A'):
                score+=1
            if(line[0]=='B'):
                score+=2
            if(line[0]=='C'):
                score+=3
        elif (line[2]=='Z'):
            score+=6
            if(line[0]=='A'):
                score+=2
            if(line[0]=='B'):
                score+=3
            if(line[0]=='C'):
                score+=1
print(score)
