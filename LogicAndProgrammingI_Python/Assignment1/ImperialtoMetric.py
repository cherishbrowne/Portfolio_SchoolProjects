#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:   Cherish Browne 
Program Title:  Imperial to Metric Conversion
Description:    converts weight from imperial to metric conversions
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #Variables
    numOfTons = 0
    numOfStones = 0
    numOfPounds = 0
    numOfOunces = 0 
    totalOunces = 0.0
    totalKilos = 0.0
    metricTons = 0
    kilosFloat = 0.0
    kilosInt = 0
    grams = 0.0

    #Title
    print("Imperial To Metric Conversion\n")

    #Input
    numOfTons = int(input("Enter the number of tons: "))
    numOfStones = int(input("Enter the number of stones: "))
    numOfPounds = int(input("Enter the number of pounds: "))
    numOfOunces = int(input("Enter the number of ounces: "))

    #Maths
    totalOunces = 35840 * numOfTons + 224 * numOfStones + 16 * numOfPounds + numOfOunces
    totalKilos = totalOunces / 35.274
    metricTons = int(totalKilos / 1000)
    kilosFloat = totalKilos - metricTons * 1000
    kilosInt = int(kilosFloat)
    grams = (kilosFloat - kilosInt) * 1000

     #Output
    print("\nThe metric weight is {0} metric tons, {1} kilos, and {2:.1f} grams.".format(metricTons, kilosInt, grams))

        #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()