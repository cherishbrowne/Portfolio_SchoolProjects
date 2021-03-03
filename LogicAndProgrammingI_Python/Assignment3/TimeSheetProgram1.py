#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Cherish Browne
Program Title: Time Sheet
Description:    
"""

def gatherHoursInput(numOfDays):
    inputHours = [] # declaring list for hours

    #Gathering hours from input and adding to list
    for i in range(numOfDays):
        inputHours.append(int(input('Enter hours worked on day #{}: '.format(i + 1))))

    return inputHours

def mostWorkedDay(hours):
    mostHoursWorked = 0
    dayWithMostHoursWorked = 0

    #Finding the most hours worked and on what day
    for i in range(len(hours)):
        if mostHoursWorked < hours[i]:
            mostHoursWorked = hours[i]
            dayWithMostHoursWorked = i + 1
    print("The most hours worked was on:")
    print("Day #{0} when you worked {1} hours.".format(dayWithMostHoursWorked, mostHoursWorked))

def divider(): 
    print("--------------------------------------------------------------------------------")

def totalAndAverage(hours):
    totalHoursWorked = 0

    #Calculating total hours worked
    for i in range(len(hours)):
        totalHoursWorked = totalHoursWorked + hours[i]
    print("The total number of hours worked was: {}".format(totalHoursWorked))
    
    #Calculating the average of total hours worked
    averageHours = totalHoursWorked / len(hours)
    print("The average number of hours worked each day was: {}".format(averageHours))

def daysSlacked(hours):
    print("Days you slacked off (i.e. worked less than 7 hours): ")

    #Finding days where hours worked is less than 7
    regHours = 7
    for i in range(len(hours)):
        if hours[i] < regHours:
            print("Day #{0}: {1} hours".format(i + 1, hours[i]))

def main():

    hours = gatherHoursInput(5)
    divider()

    mostWorkedDay(hours)
    divider()

    totalAndAverage(hours)
    divider()

    daysSlacked(hours)
    
    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()