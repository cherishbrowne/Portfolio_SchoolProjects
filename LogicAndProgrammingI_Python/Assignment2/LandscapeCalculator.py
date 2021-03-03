#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    Cherish Browne
Program Title:  Landscape Calculator
Description:    
"""
def welcomeMsg():
    print("Welcome to the Landscape Calculator!\n")

def getPriceOfGrass(grassType, squareFeet):
    fescue = 0.05
    bentgrass = 0.02
    campus = 0.01
    priceOfGrass = 0.0

    if grassType == "fescue":
        priceOfGrass = fescue * squareFeet

    elif grassType == "bentgrass":
        priceOfGrass = bentgrass * squareFeet

    else:
        priceOfGrass = campus * squareFeet

    return priceOfGrass


def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #Variables

    baseCharge = 1000
    propertyDepth = 0.0
    propertyWidth = 0.0
    totalCost = 0.0
    houseNumber = 0
    squareFeetCharge = 500
    grassType = ""
    numOfTrees = 0
    priceOfGrass = 0.0    

    welcomeMsg()

    #Input

    houseNumber = int(input("Enter House Number: "))
    propertyDepth = float(input("Enter property depth (feet): "))
    propertyWidth = float(input("Enter the property width (feet): "))
    grassType = input("Enter type of grass (fescue, bentgrass, campus) : ")
    numOfTrees = float(input("Enter the number of trees: "))

    #Processing 
    squareFeet = float(propertyDepth) * float(propertyWidth)
    treeCharge = numOfTrees * 100
    priceOfGrass = getPriceOfGrass(grassType, squareFeet)
    totalCost = baseCharge + treeCharge  + priceOfGrass

    if squareFeet > 5000:
        totalCost = totalCost + 500

    #Output 
    print("\nTotal cost for house" ,houseNumber, "is: ${0:.2f}".format(totalCost))
    



    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()