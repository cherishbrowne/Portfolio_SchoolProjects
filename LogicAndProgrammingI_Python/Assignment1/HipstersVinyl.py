#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name:    Cherish Browne
Program Title:  Hipsters Vinyl Records
Description:    prints reciepts for customer based on input for delivery and cost of records
"""

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!

    #Variables
    distanceOfDelivery = 0
    costofRecord = 0
    customerName = ""
    

    #Input
    print("Hipster's Local Vinyl Records - Customer Order Details")
    customerName = (input("What is the customer's name? "))
    distanceOfDelivery = float(input("What is the distance for delivery in km? "))
    costofRecord = float(input("Enter the cost of records bought: "))

    #Math
    deliveryCost = distanceOfDelivery * 15
    purchaseCost = costofRecord * 1.14
    totalCost = deliveryCost + purchaseCost

    #Output
    print("Purchase summary for " + customerName)
    print("Your delivery cost is: " + str(round(deliveryCost, 2))) 
    print("Your purchase cost is: " + str(round(purchaseCost, 2)))
    print("Your total cost is: " + str(round(totalCost, 2)))


    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()