counter=0
with open ('inputday6.txt', 'r') as infile:
    found=0
    for line in infile:
        for i in range(len(line)):
            print(i)
            try:
                if line[i]!=line[i+1] and line[i]!=line[i+2] and line[i]!=line[i+3] and line[i+1]!=line[i+2] and line[i+1]!=line[i+3] and line[i+2]!=line[i+3]:
                    if found==0:
                        spot=i+4  
                        found+=1
            except:
                print("end")

print(spot)