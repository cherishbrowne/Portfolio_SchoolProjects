"""
Student Name:   Cherish Browne 
Program Title:  Weekly Loan Calculator
Description:    Calculates weekly loan payment based on user input
"""

def main():
    #Variables
    loanAmount = 0.0
    interestRate = 0.0
    numOfYears = 0
    weeklyInterest = 0.0
    weeklyPayment = 0.0

    #Print Title
    print("Weekly Loan Calculator\n")

    #Input
    loanAmount = float(input("Enter the amount of the loan: "))
    interestRate = float(input("Enter the interest rate (%): "))
    numOfYears = int(input("Enter the number of years: "))

    #Math
    weeklyInterest = interestRate / 5200
    weeklyPayment = weeklyInterest / (1 - (1 + weeklyInterest) ** -(52 * numOfYears)) * loanAmount
    
    #Output
    print("\nYour weekly payment will be: ${0:.2f}".format(weeklyPayment))

if __name__ == "__main__":
    main()