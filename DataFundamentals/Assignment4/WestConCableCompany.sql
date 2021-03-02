-- DROPPING/CREATING DATABASE
DROP DATABASE IF EXISTS WestConCableCompany;
CREATE DATABASE WestConCableCompany;

USE WestConCableCompany;
-- CREATING TABLES
CREATE TABLE Customer (
    CustomerID   INT (11) NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR (32)  NOT NULL,
    LastName VARCHAR (32) NOT NULL,
    Address VARCHAR (255) NOT NULL,
    StartDate DATE NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE CustomerChannelPackage (
    CustomerID INT (11) NOT NULL,
    PackageID INT (11) NOT NULL,
    PRIMARY KEY (CustomerID, PackageID)
);

CREATE TABLE ChannelPackage (
    PackageID INT (11) NOT NULL AUTO_INCREMENT,
    PackageName VARCHAR (32) NOT NULL,
    PackagePrice FLOAT NOT NULL,
    PRIMARY KEY (PackageID)
);

CREATE TABLE ChannelPackageChannel (
    PackageID INT (11) NOT NULL,
    ChannelID INT (11) NOT NULL,
    PRIMARY KEY (PackageID, ChannelID)
);

CREATE TABLE Channel (
    ChannelID INT (11) NOT NULL AUTO_INCREMENT,
    ChannelName VARCHAR (32) NOT NULL,
    ChannelNumber INT (11) NOT NULL,
    PRIMARY KEY (ChannelID)
);

CREATE TABLE PayPerViewEvent (
    EventID INT (11) NOT NULL AUTO_INCREMENT,
    ChannelID INT (11) NOT NULL,
    EventName VARCHAR (32) NOT NULL,
    EventDate DATETIME NULL,
    EventPrice FLOAT NOT NULL,
    PRIMARY KEY (EventID)
);

CREATE TABLE PayPerViewEventCustomer (
    EventID INT (11) NOT NULL,
    CustomerID INT (11) NOT NULL,
    PaymentAmount FLOAT NULL,
    PaidOrNot TINYINT NOT NULL,
    PRIMARY KEY (EventID, CustomerID)
);

-- ALTERING THE TABLES
ALTER TABLE CustomerChannelPackage
    ADD CONSTRAINT FK__CustomerChannelPackage__Customer__CustomerID
    FOREIGN KEY (CustomerID)
    REFERENCES Customer (CustomerID);

ALTER TABLE CustomerChannelPackage
    ADD CONSTRAINT FK__CustomerChannelPackage__ChannelPackage__PackageID
    FOREIGN KEY (PackageID)
    REFERENCES ChannelPackage (PackageID);

ALTER TABLE ChannelPackageChannel
    ADD CONSTRAINT FK__ChannelPackageChannel__ChannelPackage__PackageID
    FOREIGN KEY (PackageID)
    REFERENCES ChannelPackage (PackageID);

ALTER TABLE ChannelPackageChannel
    ADD CONSTRAINT FK__ChannelPackageChannel__Channel__ChannelID
    FOREIGN KEY (ChannelID)
    REFERENCES Channel (ChannelID);

ALTER TABLE PayPerViewEventCustomer
    ADD CONSTRAINT FK__PayPerViewEventCustomer__Customer__CustomerID
    FOREIGN KEY (CustomerID)
    REFERENCES Customer (CustomerID);

ALTER TABLE PayPerViewEventCustomer
    ADD CONSTRAINT FK__PayPerViewEvent__EventID
    FOREIGN KEY (EventID)
    REFERENCES PayPerViewEvent (EventID);

ALTER TABLE PayPerViewEvent
    ADD CONSTRAINT FK__PayPerViewEvent__Channel__ChannelID
    FOREIGN KEY (ChannelID)
    REFERENCES Channel (ChannelID);

-- INSERTING DATA INTO DATABASE
-- ADDING 3 CUSTOMERS
INSERT INTO Customer
    (FirstName, LastName, Address, StartDate)
VALUES
       ('John', 'Buck', '111 Candyland Road, Halifax, NS', '2016-09-30');

INSERT INTO Customer
    (FirstName, LastName, Address, StartDate)
VALUES
       ('Jane', 'Doe', '122 Candy Cane Road, Halifax, NS', '2019-07-02');

INSERT INTO Customer
    (FirstName, LastName, Address, StartDate)
VALUES
       ('Jack', 'Sprat', '133 Candy Corn Lane, Dartmouth, NS', '2018-04-15');

-- ADDING THREE CHANNELS
INSERT INTO Channel
    (ChannelName, ChannelNumber)
VALUES
    ('ABC', '100');

INSERT INTO Channel
    (ChannelName, ChannelNumber)
VALUES
    ('Spike', '106');

INSERT INTO Channel
    (ChannelName, ChannelNumber)
VALUES
    ('TSN', '110');

-- ADD THREE CABLE PACKAGES
INSERT INTO ChannelPackage
    (PackageName, PackagePrice)
VALUES
    ('Basic', '50.00');

INSERT INTO ChannelPackage
    (PackageName, PackagePrice)
VALUES
    ('Action', '25.00');

INSERT INTO ChannelPackage
    (PackageName, PackagePrice)
VALUES
    ('Sports', '20.00');

-- ADD CHANNELS TO PACKAGES
INSERT INTO ChannelPackageChannel
    (ChannelID, PackageID)
VALUES
    (1, 1);

INSERT INTO ChannelPackageChannel
    (ChannelID, PackageID)
VALUES
    (2, 2);

INSERT INTO ChannelPackageChannel
    (ChannelID, PackageID)
VALUES
    (3, 3);

-- ADDING BASIC PACKAGE TO ALL CUSTOMER SUBSCRIPTIONS
INSERT INTO CustomerChannelPackage
    (CustomerID, PackageID)
VALUES
    (1, 1);

INSERT INTO CustomerChannelPackage
    (CustomerID, PackageID)
VALUES
    (2, 1);

INSERT INTO CustomerChannelPackage
    (CustomerID, PackageID)
VALUES
    (3, 1);

-- ADDING ACTION PACKAGE TO JANE DOE'S SUBSCRIPTION
INSERT INTO CustomerChannelPackage
    (CustomerID, PackageID)
VALUES
    (2, 2);

-- ADDING  THE PRIZE FIGHT TO PAY-PER-VIEW-EVENT
INSERT INTO PayPerViewEvent
    (ChannelID, EventName, EventDate, EventPrice)
VALUES
    (3, 'The Prize Fight', '2019-11-30T20:00:00.000', '9.95');

-- ADDING JOHN BUCK TO LIST OF PEOPLE TO WATCH BIG FIGHT
INSERT INTO PayPerViewEventCustomer
    (CustomerID, EventID, PaidOrNot, PaymentAmount)
VALUES
    (1, 1, 0, NULL);

-- UPDATING JOHN BUCK'S PAYMENT (9.95) FOR BIG FIGHT RECORD
UPDATE PayPerViewEventCustomer
SET PaidOrNot = 1, PaymentAmount = '9.95'
WHERE EventID = 1 AND CustomerID = 1;

-- DELETING ACTION PACKAGE SUBSCRIPTION FOR JANE DOE
DELETE FROM CustomerChannelPackage
    WHERE PackageID = 2 AND CustomerID = 2;

-- DISPLAY CUSTOMER INFO ALPHABETICALLY BY LAST NAME
SELECT LastName FROM Customer
ORDER BY LastName ASC;

-- DISPLAYING ALL INFO FOR SPIKE CHANNEL
SELECT * FROM Channel
WHERE ChannelName = 'Spike';

-- DISPLAYING TITLE AND DATE OF FUTURE PAY-PER-VIEW EVENTS
SELECT EventName, EventDate FROM PayPerViewEvent
WHERE EventDate > NOW ();













