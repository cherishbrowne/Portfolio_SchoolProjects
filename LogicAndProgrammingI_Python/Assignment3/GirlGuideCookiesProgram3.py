#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Cherish Browne   
Program Title: Girl Guide Cookie Sell-Off
Description:    
"""


#make a function to calculate the average
def findTheAverage(parameterNum):
    totalNum = 0

    for counter in range(len(parameterNum)):
        totalNum = totalNum + parameterNum[counter]

    averageNum = totalNum/len(parameterNum)
    return averageNum

def validateInt(message):
    userInput = ""
    while userInput.isnumeric() == False:
        userInput = input(message)
    return int(userInput)

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #VARIABLES
    guideList = []
    guideName = ""
    numOfBoxes = []
    numOfGuides = 0
    record = []
    number = 0
    sum = 0
    prizes = 0

    #Get the number of guides selling cookies
    numOfGuides = validateInt("Enter the number of guides selling cookies: ")

    #Get the names of each guide
    for i in range(numOfGuides):
        guideName = input("\nEnter the name of guide #{}: ".format(i + 1))
        guideList.append(guideName)
        #Get the number of boxes each guide sold
        numOfBoxes.append(validateInt("Enter the number of boxes sold by {}: ".format(guideName)))

    record = [guideList, numOfBoxes]
   
    #Get the average amount of boxes sold
    averageBoxes = findTheAverage(numOfBoxes)

    print("\nThe average number of boxes sold by each guide was {0:.1f}".format(averageBoxes))
    print()
    print("Guide                    Prizes Won")
    print("------------------------------------------------------------------------------------")

    #Set the prizes to be won depending on how many boxes each guide sold
    for prizes in range(len(guideList)):
        if numOfBoxes[prizes] == max(numOfBoxes):
            print("{0}".format(guideList[prizes]) + "\t\t\t-Trip to Girl Guide Jamboree in Aruba!!!")
        elif numOfBoxes[prizes] >=1 and numOfBoxes[prizes] < averageBoxes:
            print("{0}".format(guideList[prizes]) + "\t\t\t-Left Over Cookies!")
        elif numOfBoxes[prizes] > averageBoxes and numOfBoxes[prizes] < max(numOfBoxes):
            print("{0}".format(guideList[prizes]) + "\t\t\t-Super Seller Badge!!")
        else: 
            print("{0}".format(guideList[prizes]) + "\t\t\t-")

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()