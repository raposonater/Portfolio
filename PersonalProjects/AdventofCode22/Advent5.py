import re

charlist=[]
with open ('inputday5.txt', 'r') as infile:
    stack,instructions=infile.read().split("\n\n")
    stack=stack.split('\n')

    nums=stack.pop()
    stack.reverse()
    instructions=instructions.split('\n')
    for line in instructions:


        for lines in stack:
            print(lines)
        stackfound=0

        
        #FINDING THE INSTRUCTIONS
        line=re.findall('[0-9]+', line)
        print(line)
        many=int(line[0])
        begin=int(nums.find(line[1]))
        end=int(nums.find(line[2]))
        
        #print(end,begin,many)


        for i in range(len(stack)-1,-1,-1):
            #print(stack)


            if ord(stack[i][begin])!=32 and stackfound==0:
                for i2 in range(int(many)):
                    charlist.append(stack[i-i2][begin]) #this puts the values to move onto a list
                    stack[i-i2] = stack[i-i2][:begin] + " " + stack[i-i2][begin+1:]
                stackfound=1


                




            for i in range(len(stack)-1,-1,-1):
                if ord(stack[i][end])!=32 and stackfound==1:
                    for i2 in range(int(many)):
                        try:
                            stack[i+1+i2] = stack[i+1+i2][:end] + charlist[i2].strip("\n") + stack[i+1+i2][end+1:]
                        
                        except:
                            stack.append("                                   ") #blank line is 35 spaces
                            stack[i+1+i2] = stack[i+1+i2][:end] + charlist[i2].strip("\n") + stack[i+1+i2][end+1:]
                    stackfound=2
                    charlist.clear()

            #nothing in the slot case                
            if ord(stack[0][end])==32 and stackfound==1:
                for i2 in range(int(many)):
                    try:
                        stack[i2] = stack[i2][:end] + charlist[i2].strip("\n") + stack[i2][end+1:]
                    
                    except:
                        stack.append("                                   ") #blank line is 35 spaces
                        stack[i2] = stack[i2][:end] + charlist[i2].strip("\n") + stack[i2][end+1:]
                
                stackfound=2
                charlist.clear()
            #print("ending")
                        
input("end?")
stack.reverse()
for line in stack:
    print(line)
        # for i in range(int(many)):
            







 


    #from instructions if it says from that point then find the index of that point and apply it. try to do it on the top of the stack iterating down until the value in the
    #slot is greater than zero because it will return a unicode value, then move it accordingly
    #need an if else statement for if a string at that height exists. if it does then just splice, if not then create a thing.
