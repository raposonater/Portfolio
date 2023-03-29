"""
COIS1400H Lab 5 Part 1
Alex Raposo ID:0787601
This lab part makes an image greyscale, but I also separated the alpha to get black and white too
"""
import numpy
import matplotlib.pyplot


myImage = matplotlib.pyplot.imread('flower.png')
height=myImage.shape[0]
width=myImage.shape[1]

for x in range(0, height-1):
    for y in range(0,width-1):
        # get rgb values (and the alpha value...)
        rgb = myImage[x, y]

        #UNCOMMENT BELOW AND COMMENT OUT THE ONE BELOW THAT FOR BLACK AND WHITE INSTEAD OF GREYSCALE
        #gray_value = (rgb[0]+rgb[1]+rgb[2])/3

        #calculate the average of the three values (and the alpha value...)
        gray_value=numpy.mean(rgb)
       
        #set pixels to the gray value 
        myImage[x, y, :] = [gray_value, gray_value, gray_value, 1] #HAVE TO HAVE OPACITY :)

imgplot = matplotlib.pyplot.imshow(myImage)
matplotlib.pyplot.show()
