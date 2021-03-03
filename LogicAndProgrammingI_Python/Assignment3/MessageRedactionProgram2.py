#Don't forget to rename this file after copying the template
#for a new program!
"""
Student Name: Cherish Browne
Program Title: Message Redaction
Description:    
"""
#Creating a function for gathering input
def inputGetter(parameter_input):
    inputValue = input(parameter_input)
    return inputValue

def main(): #<-- Don't change this line!
    #Write your code below. It must be indented!
    #Get phrase from input, continue if valid input, if not restart
    play = True
    while play == True:
        phrase = inputGetter("Type a phrase (or quit to exit program): ")
        redactedPhrase = phrase.lower()
        if phrase.lower() == "quit":
            play = False
        #Get letters to redact from input
        else:
            seperatedList = input("Type a comma-seperated list of letters to redact: ").lower()
            for letter in seperatedList:
                if letter.lower() != ",":
                    redactedPhrase = redactedPhrase.replace(letter, "_")  #Replacing letters with "_"
            
            print(redactedPhrase)
            countNumber = redactedPhrase.count("_")
            finalRedaction = ""
            for count in range (len(redactedPhrase)):
                if redactedPhrase[count] == "_":
                    finalRedaction = finalRedaction + "_"
                else:
                    finalRedaction = finalRedaction + phrase[count]

            #Display number of letters redacted and redacted phrase
            print("Number of letters redacted: ", countNumber)
            print("Redacted phrase: ", finalRedaction)







    #Your code ends on the line above

#Do not change any of the code below!
if __name__ == "__main__":
    main()