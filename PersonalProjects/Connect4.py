#Connect 4
#Alex Raposo
#March 29th 2023
# Hey so I actually made this before for a school project in grade 12 and it was pretty cool.
# Only issue is that it was on REPLIT and my teacher deleted it after the course was done....
# What a shame.


#CODE STARTED SOMETIME AROUND 6PM MARCH 29TH 2023
#CODE COMPLETED AND FUNCTIONING 7:40PM MARCH 29TH 2023
#I'll add a bot at a later date.



def startupsequence():
    print("  .oooooo.                                                             .              .o   ")
    print(" d8P'  `Y8b                                                          .o8            .d88   ")
    print("888           .ooooo.  ooo. .oo.   ooo. .oo.    .ooooo.   .ooooo.  .o888oo        .d'888   ")
    print("888          d88' `88b `888P^Y88b  `888P^Y88b  d88' `88b d88' `^Y8   888        .d'  888   ")
    print("888          888   888  888   888   888   888  888ooo888 888         888        88ooo888oo ")
    print("`88b    ooo  888   888  888   888   888   888  888    .o 888   .o8   888 .           888   ")
    print(" `Y8bood8P'  `Y8bod8P' o888o o888o o888o o888o `Y8bod8P' `Y8bod8P'   \\888/          o888o  ") #I had to make some ascii adjustments


    print("\nWelcome to Connect 4, unfortunately, this won't be exactly like the version I made in grade 12, with 3 save states,\nand instead will be a fun little project I make to get myself some practice with python again. I mainly just want my fun game back\nThis game requires two players, however I plan to add a bot that will randomly place discs (I don't know how to make AI, I'm a first year)\nEnjoy!\n-Alex")
    print("\n press enter to continue!")
    useless=input()

#showboard will print out some regular emojis to denote the top and bottom of the board, and will read the supplied board to understand what to fill the board with.
def showboard(suppliedboard):
        print("🟦⬇️ 🟦⬇️ 🟦⬇️ 🟦⬇️ 🟦⬇️ 🟦⬇️ 🟦⬇️ 🟦")
        for row in suppliedboard:
             counter=1
             for slot in row:
                if counter==1:
                    print("🟦",end="")
                match slot:
                    case 0:
                        print("⬛",end="🟦")
                    case 1:
                        print("🔴",end="🟦")
                    case 2:
                        print("🟡",end="🟦")
                if counter==7:
                    print("")
                counter+=1
             
        print("🟦1️⃣ 🟦2️⃣ 🟦3️⃣ 🟦4️⃣ 🟦5️⃣ 🟦6️⃣ 🟦7️⃣ 🟦")            
        print("🟦                          🟦")


def makemove(suppliedboard,turn):

    #DISC COLOUR
    if (turn%2==1):
        disc=1 #RED DISC
        print("RED TURN")
    else:
        disc=2 #YELLOW DISC
        print("YELLOW TURN")
    print("Please input the place you would like to slot your disc!")



    #GET INPUT / CHECK VALID SLOT HORIZONTAL PLACEMENT | CHECK IF THERE IS ROOM IN THE SLOT
    fullslot=False
    while(fullslot==False):
        valid=False
        while (valid==False):
            #MAKE SURE INPUT IS VALID
            try:
                slotselect=int(input()) 
                if slotselect<=0 or slotselect>=8:
                    print("Please input a valid number!")
                else:
                    valid=True
            except:
                print("Please input a valid number!")

        #CHECK IF ITEM IS IN THE SLOT
        i=5
        while i>-1:
            if suppliedboard[i][slotselect-1]==0:
                suppliedboard[i][slotselect-1]=disc
                break
            if suppliedboard[0][slotselect-1]!=0:
                print("that slot is full!\nPlease pick another slot")
                i+=1
                fullslot=True
                break
            i-=1
        return(suppliedboard)


def checkboard(suppliedboard):
    #this part of the code will check for any winners
    #VERTICAL SOLUTIONS
    for i in range(0,3):
        for i2 in range (0,7):
            if suppliedboard[i][i2]==suppliedboard[i+1][i2]==suppliedboard[i+2][i2]==suppliedboard[i+3][i2]:
                if (suppliedboard[i][i2]==1):
                    return "R"
                elif (suppliedboard[i][i2]==2):
                    return "Y"

    #HORIZONTAL SOLUTIONS
    for i in range(0,6):
        for i2 in range (0,4):
            if suppliedboard[i][i2]==suppliedboard[i][i2+1]==suppliedboard[i][i2+2]==suppliedboard[i][i2+3]:
                if (suppliedboard[i][i2]==1):
                    return "R"
                elif (suppliedboard[i][i2]==2):
                    return "Y"

    #DESCENDING SOLUTIONS
    for i in range(0,3):
        for i2 in range (0,4):
            if suppliedboard[i][i2]==suppliedboard[i+1][i2+1]==suppliedboard[i+2][i2+2]==suppliedboard[i+3][i2+3]:
                if (suppliedboard[i][i2]==1):
                    return "R"
                elif (suppliedboard[i][i2]==2):
                    return "Y"
                
    #ASCENDING SOLUTIONS
    for i in range(0,3):
        for i2 in range (3,7):
            if suppliedboard[i][i2]==suppliedboard[i+1][i2-1]==suppliedboard[i+2][i2-2]==suppliedboard[i+3][i2-3]:
                if (suppliedboard[i][i2]==1):
                    return "R"
                elif (suppliedboard[i][i2]==2):
                    return "Y"
                



        
    


#board generation complete
columns,rows=7,6
board = [[0 for j in range(columns)]for i in range(rows)]
###
startupsequence()
print("Here is the board (I made it with emoji's this time :D)")
showboard(board)
print("Please note the numbers accross the bottom denote the locations in which you can place it\nRed will go first, so pick your colour!")

for turn in range(1,43):
    board=makemove(board,turn)
    result=checkboard(board)
    showboard(board)

    if result=="R":
        print("Red wins!")
        break
    elif result=="Y":
        print("Yellow wins!")
        break
    if turn==42:
        print("How did you even manage to tie this up? game over.")

print("Thank you so much for playing!")







