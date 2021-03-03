#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:   Cherish Browne 
Program Title:  Mobile Data Plans
Description:    
"""
def introMessage():
    print("Welcome to the data plan generator\n")

def totalChargeDisplay(dataCharge):
    print("Total charge is ${0:.2f}".format(dataCharge))


def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    
    #Variables

    dataUsage = 0.0
    under200MB = 20.00
    upTo500MB = 0.105 
    upto1GB = 0.110
    over1GB = 118.00

    # Message
    introMessage()

    # Input
    dataUsage = float(input("Enter data usage (Mb) : "))

    #Processing

    upTo500MB = 0.105 * dataUsage 
    upto1GB = 0.110 * dataUsage

    if dataUsage <= 200:
        totalChargeDisplay(under200MB)
    
    elif dataUsage <= 500:
        totalChargeDisplay(upTo500MB)
    
    elif dataUsage <= 1000:
        totalChargeDisplay(upto1GB)
    
    else:
        totalChargeDisplay(over1GB)



    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()