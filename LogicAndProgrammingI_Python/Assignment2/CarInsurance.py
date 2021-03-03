#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Cherish Browne   
Program Title:  Auto Insurance
Description:    
"""

def welcomeMsg():    
    print("Welcome to the Auto Insurance payment generator!\n")

def getMonthlyPayment(rate15to24, rate25to39, rate40to69):
    errorMsg = "Sorry, please try again."
    age = int(input("\nEnter your age: "))

    priceOfVehicle = float(input("\nEnter the purchase price of the vehicle: "))

    monthlyPayment = 0.0

    if age < 25:
        monthlyPayment = priceOfVehicle * (rate15to24)

    elif age < 40:
        monthlyPayment = priceOfVehicle * (rate25to39)

    elif age < 70:
        monthlyPayment = priceOfVehicle * (rate40to69)

    else:
        print(errorMsg)

    return monthlyPayment

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #Variables
    gender = ""   
    age = 0
    priceOfVehicle = 0.0
    maleRate15to24 = 0.25 / 12
    maleRate25to39 = 0.17 / 12
    maleRate40to69 = 0.10 / 12
    femaleRate15to24 = 0.20 / 12
    femaleRate25to39 = 0.15 / 12
    femaleRate40to69 = 0.10 / 12
    monthlyPayment = 0.0
       

    welcomeMsg()

    #Input
    gender = input("Are you 'Male' or 'Female': ")

    #MALE
    if gender.upper() == "MALE":
        monthlyPayment = getMonthlyPayment(maleRate15to24, maleRate25to39, maleRate40to69)

    #FEMALE
    elif gender.upper() == "FEMALE":
        monthlyPayment = getMonthlyPayment(femaleRate15to24, femaleRate25to39, femaleRate40to69)

    #OutPut
    print("\nYour monthly insurance payment will be ${0:.2f}".format(monthlyPayment))

    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()