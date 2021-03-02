DROP DATABASE IF EXISTS DogKennel;
# Checks to see if database exists and if so deletes it and its contents
CREATE DATABASE DogKennel;

USE DogKennel;

DROP TABLE IF EXISTS Customer; # deletes table if it exists and its contents

CREATE TABLE Customer ( #Creates table
    CustomerID   INT PRIMARY KEY,
    FirstName VARCHAR(32) NOT NULL,
    LastName VARCHAR(32) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    PhoneNumber INT NOT NULL
);

DROP TABLE IF EXISTS DogInformation;

CREATE TABLE DogInformation (
    DogID INT PRIMARY KEY,
    DogName VARCHAR(32) NOT NULL,
    Breed TEXT NOT NULL,
    Gender TEXT NOT NULL,
    DateOfBirth INT NOT NULL,
    Status TEXT NOT NULL,
    Shots VARCHAR(32) NOT NULL,
    FatherID INT,
    MotherID INT
);
ALTER TABLE DogInformation
    ADD CONSTRAINT FK__DogInformation__FatherID
    FOREIGN KEY (FatherID)
    REFERENCES DogInformation (DogID);

ALTER TABLE DogInformation
    ADD CONSTRAINT FK__DogInformation__MotherID
    FOREIGN KEY (MotherID)
    REFERENCES DogInformation (DogID);

DROP TABLE IF EXISTS CustomerHistory;

CREATE TABLE CustomerHistory (
    RecordID      INT PRIMARY KEY,
    DogPrice      INT NOT NULL,
    DatePurchased DATE NOT NULL,
    DogID INT NOT NULL,
    CustomerID    INT NOT NULL,
CONSTRAINT FK__Customer__CustomerID
FOREIGN KEY (CustomerID)
REFERENCES Customer (CustomerID)
);

ALTER TABLE CustomerHistory
    DROP CONSTRAINT IF EXISTS FK__DogInformation__DogID;

#Adds foreign key/constraints
ALTER TABLE CustomerHistory
    ADD CONSTRAINT FK__DogInformation__DogID
    FOREIGN KEY (DogID)
    REFERENCES DogInformation (DogID);

