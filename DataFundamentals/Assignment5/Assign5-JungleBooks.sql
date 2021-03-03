-- DROPPING/CREATING THE DATABASE
DROP DATABASE IF EXISTS JungleBooks;
CREATE DATABASE JungleBooks;

USE JungleBooks;

-- CREATING TABLES
CREATE TABLE Customer (
    CustomerID INT NOT NULL,
    CustomerFirstName VARCHAR(32) NOT NULL,
    CustomerLastName VARCHAR (32) NOT NULL,
    BillingAddress VARCHAR (255) NOT NULL,
    ShippingAddress VARCHAR (255) NOT NULL,
    Email VARCHAR (80) NOT NULL,
    PhoneNumber VARCHAR (11) NOT NULL,
    UserName VARCHAR (32) NOT  NULL,
    Password VARCHAR (32) NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE CustomerOrder (
    OrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    DateOrdered DATETIME NOT NULL,
    DateShipped DATETIME NULL,
    OrderStatus VARCHAR (32) NOT NULL,
    OrderSubtotal FLOAT NOT NULL,
    Taxes FLOAT NOT NULL,
    TotalCost FLOAT,
    PRIMARY KEY (OrderID)
);

CREATE TABLE CustomerOrder_Books (
    OrderID INT NOT NULL,
    ISBN VARCHAR (13) NOT NULL,
    Quantity INT NOT NULL,
    Subtotal INT NOT NULL,
    PRIMARY KEY (OrderID, ISBN)
);

CREATE TABLE Books (
    ISBN VARCHAR (13) NOT NULL ,
    BookTitle VARCHAR (80) NOT NULL,
    BookSummary VARCHAR (255) NOT NULL,
    Price FLOAT NOT NULL,
    PRIMARY KEY (ISBN)
);

CREATE TABLE Author_Books (
    AuthorID INT NOT NULL,
    ISBN VARCHAR (13) NOT NULL,
    PRIMARY KEY (AuthorID, ISBN)
);

CREATE TABLE Author (
    AuthorID INT NOT NULL,
    AuthorFirstName VARCHAR (32) NOT NULL,
    AuthorLastName VARCHAR (32) NOT NULL,
    PRIMARY KEY (AuthorID)
);

CREATE TABLE Books_BookCategory (
    ISBN VARCHAR (13) NOT NULL,
    BookCategoryID INT NOT NULL,
    PRIMARY KEY (ISBN, BookCategoryID)
);

CREATE TABLE BookCategory (
    BookCategoryID INT NOT NULL,
    BookCategoryName VARCHAR (32) NOT NULL,
    PRIMARY KEY (BookCategoryID)
);

USE JungleBooks;
-- ALTERING THE TABLES
ALTER TABLE CustomerOrder
    ADD CONSTRAINT FK__CustomerOrder__Customer__CustomerID
    FOREIGN KEY (CustomerID)
    REFERENCES Customer (CustomerID);

ALTER TABLE CustomerOrder_Books
    ADD CONSTRAINT FK__CustomerOrder_Books__CustomerOrder__OrderID
    FOREIGN KEY (OrderID)
    REFERENCES CustomerOrder (OrderID);

ALTER TABLE CustomerOrder_Books
    ADD CONSTRAINT FK__CustomerOrder_Books__Books__ISBN
    FOREIGN KEY (ISBN)
    REFERENCES Books (ISBN);

ALTER TABLE Author_Books
    ADD CONSTRAINT FK__Author_Books__Books__ISBN
    FOREIGN KEY (ISBN)
    REFERENCES Books (ISBN);

ALTER TABLE Author_Books
    ADD CONSTRAINT FK__Author_Books__Author__AuthorID
    FOREIGN KEY (AuthorID)
    REFERENCES Author (AuthorID);

ALTER TABLE  Books_BookCategory
    ADD CONSTRAINT FK__Books_BookCategory__Books__ISBN
    FOREIGN KEY (ISBN)
    REFERENCES Books (ISBN);

ALTER TABLE  Books_BookCategory
    ADD CONSTRAINT FK__Books_BookCategory__BookCategory__BookCategoryID
    FOREIGN KEY (BookCategoryID)
    REFERENCES BookCategory (BookCategoryID);

-- INSERTING DATA INTO THE DATABASE: ADDING BOOKS TO BOOKS
INSERT INTO Books
    (ISBN, BookTitle, BookSummary, Price)
VALUES
    ('9780140385724', 'The Outsiders',
     'The Outsiders tells the story of 14-year-old Ponyboy Curtis and his two older brothers, Soda and Darry. The boys are orphans and struggle to stick together in their lower-class neighborhood, known as the East Side.',
     11.44); #Young adult fiction

INSERT INTO Books
    (ISBN, BookTitle, BookSummary, Price)
VALUES
    ('9780062678423', 'The Woman in the Window',
     'Agoraphobic Dr. Anna Fox witnesses something she should not while keeping tabs on the Russell family, the seemingly picture perfect clan that lives across the way.',
     17.87); #Thriller, Fiction, Mystery, Suspense

INSERT INTO Books
    (ISBN, BookTitle, BookSummary, Price)
VALUES
    ('9781250081810', 'Its Always the Husband',
     'Kate, Aubrey and Jenny met in college and promised they’d always be there for each other.
     Twenty years later, all women are now married but when one of the friends dies in shocking circumstances, will everyone assume that it’s always the husband?',
     9.49);

INSERT INTO Books
    (ISBN, BookTitle, BookSummary, Price)
VALUES
    ('9780133970777', 'Fundamentals of Database Systems (7th Edition)',
     'This book introduces the fundamental concepts necessary for designing,
      using, and implementing database systems and database applications. ' , 179.16);

-- ADDING THE CATEGORIES TO BOOK CATEGORY
INSERT INTO BookCategory
    (BookCategoryName)
VALUES
    ('Thriller');

INSERT INTO BookCategory
    (BookCategoryName)
VALUES
    ('Mystery');

INSERT INTO BookCategory
    (BookCategoryName)
VALUES
    ('Suspense');

INSERT INTO BookCategory
    (BookCategoryName)
VALUES
    ('Young Adult Fiction');

INSERT INTO BookCategory
    (BookCategoryName)
VALUES
    ('Fiction');

INSERT INTO BookCategory
    (BookCategoryName)
VALUES
    ('Databases');

-- ADDING AUTHORS TO AUTHOR
INSERT INTO Author
    (AuthorFirstName, AuthorLastName)
VALUES
    ('Susan', 'Hinton');

INSERT INTO Author
    (AuthorFirstName, AuthorLastName)
VALUES
    ('Dan', 'Mallory');

INSERT INTO Author
    (AuthorFirstName, AuthorLastName)
VALUES
    ('Michele', 'Campbell');

INSERT INTO Author
    (AuthorFirstName, AuthorLastName)
VALUES
    ('Ramez', 'Elmasri');

INSERT INTO Author
    (AuthorFirstName, AuthorLastName)
VALUES
    ('Shamkant', 'Navathe');

-- ADDING AUTHORS TO EACH BOOK
INSERT INTO Author_Books
    (AuthorID, ISBN)
VALUES
    (1, 9780140385724);

INSERT INTO Author_Books
    (AuthorID, ISBN)
VALUES
    (2, 9780062678423);

INSERT INTO Author_Books
    (AuthorID, ISBN)
VALUES
    (3, 9781250081810);

INSERT INTO Author_Books
    (AuthorID, ISBN)
VALUES
    (4, 9780133970777);

INSERT INTO Author_Books
    (AuthorID, ISBN)
VALUES
    (5, 9780133970777);

-- ADDING CATEGORIES TO THE BOOKS
INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9780140385724', '4');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9780062678423', '1');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9780062678423', '2');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9780062678423', '3');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9780062678423', '5');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9781250081810', '1');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9781250081810', '2');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9781250081810', '3');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9781250081810', '5');

INSERT INTO Books_BookCategory
    (ISBN, BookCategoryID)
VALUES
    ('9780133970777', '6');

-- ADDING THE CUSTOMERS INTO CUSTOMER
INSERT INTO Customer
    (CustomerFirstName, CustomerLastName, BillingAddress, ShippingAddress, Email, PhoneNumber, UserName, Password)
VALUES
    ('Peyton', 'Sawyer', '123 Anywhere Road', '321 Somewhere Lane', 'peyton.s@hotmail.com', '4551234321', 'pey.saw', 'sawyer12');

INSERT INTO Customer
    (CustomerFirstName, CustomerLastName, BillingAddress, ShippingAddress, Email, PhoneNumber, UserName, Password)
VALUES
    ('Brooke', 'Davis', '456 Nowhere Avenue', '654 Memory Court', 'davis.b@gmail.com', '8019997788', 'brooke.davis', 'davisb22');

INSERT INTO Customer
    (CustomerFirstName, CustomerLastName, BillingAddress, ShippingAddress, Email, PhoneNumber, UserName, Password)
VALUES
    ('Lucas', 'Scott', '78 This Street', '87 That Street', 'l.scott@yahoo.com', '9025557744', 'l.scott', 'lucas123');

INSERT INTO Customer
    (CustomerFirstName, CustomerLastName, BillingAddress, ShippingAddress, Email, PhoneNumber, UserName, Password)
VALUES
    ('Nathan', 'James', '90 That Street', '90 That Street', 'nathanjames11@hotmail.com', '9052226879', 'nathanjames23', 'james321');

-- CREATING 3 ORDERS
-- customer 1 buys one copy of all three books
INSERT INTO CustomerOrder
    (CustomerID, DateOrdered, DateShipped, OrderStatus, OrderSubtotal, Taxes, TotalCost)
VALUES
    ( 1, '2019-11-22T08:30:15.000', NULL, 'pending confirmation', 38.80, 5.82, 44.62);
-- adding the books to the customers order
INSERT INTO CustomerOrder_Books
    (OrderID, ISBN, Quantity, Subtotal)
VALUES
    (1, '9780062678423', 1, 17.87);

INSERT INTO CustomerOrder_Books
    (OrderID, ISBN, Quantity, Subtotal)
VALUES
    (1, '9780140385724', 1, 11.44);

INSERT INTO CustomerOrder_Books
    (OrderID, ISBN, Quantity, Subtotal)
VALUES
    (1, '9781250081810', 1, 9.49);

-- customer 2 buys one of the books
INSERT INTO CustomerOrder
    (CustomerID, DateOrdered, DateShipped, OrderStatus, OrderSubtotal, Taxes, TotalCost)
VALUES
    ( 2, '2019-11-24T09:40:35.000', NULL, 'pending confirmation', 17.87, 2.68, 20.55);

INSERT INTO CustomerOrder_Books
    (OrderID, ISBN, Quantity, Subtotal)
VALUES
    ( 2, '9780062678423', 1, 17.87);

-- customer 3 buys 5 copies of book 1, 2 copies of book 2 and 10 copies of book 3
INSERT INTO CustomerOrder
    (CustomerID, DateOrdered, DateShipped, OrderStatus, OrderSubtotal, Taxes, TotalCost)
VALUES
    ( 3, '2019-11-26T12:10:04.000', NULL, 'pending confirmation', 207.13, 31.06, 238.19);
-- adding books to customers order
INSERT INTO CustomerOrder_Books
    (OrderID, ISBN, Quantity, Subtotal)
VALUES
    ( 3, '9780062678423', 5, 89.35);

INSERT INTO CustomerOrder_Books
    (OrderID, ISBN, Quantity, Subtotal)
VALUES
    ( 3, '9780140385724', 2, 22.88);

INSERT INTO CustomerOrder_Books
    (OrderID, ISBN, Quantity, Subtotal)
VALUES
    ( 3, '9781250081810', 10, 94.90);

-- DELETING THE SECOND ORDER
DELETE FROM CustomerOrder_Books
    WHERE OrderID = 2;
DELETE FROM CustomerOrder
    WHERE CustomerID = 2;

-- CHANGING THE STATUS OF FIRST ORDER TO COMPLETE
UPDATE CustomerOrder
SET DateShipped = '2019-11-25T02:36:19.000', OrderStatus = 'complete'
WHERE CustomerID = 1 AND OrderID = 1;

-- CHANGING THE THIRD ORDER TO ADD 1 MORE COPY OF SECOND BOOK
UPDATE CustomerOrder_Books
SET Quantity = 3, Subtotal = 34.32
WHERE OrderID = 3 AND ISBN = '9780140385724';
UPDATE CustomerOrder
SET OrderSubtotal = 218.57, Taxes = 32.78, TotalCost = 251.35
WHERE CustomerID = 3 AND OrderID = 3;

-- DISPLAY ALL CUSTOMER INFORMATION FOR CUSTOMERS WITHOUT ANY ORDERS
SELECT C.CustomerID, CustomerFirstName, CustomerLastName, BillingAddress, ShippingAddress, PhoneNumber, Email, Username, Password
FROM Customer C  LEFT OUTER JOIN CustomerOrder CO
ON C.CustomerID = CO.CustomerID
WHERE OrderID is NULL;

-- DISPLAY TITLE, AUTHOR, ISBN AND PRICE OF ALL BOOKS
SELECT B.ISBN, BookTitle, Price, A.AuthorID, AuthorLastName, AuthorFirstName
FROM Books B INNER JOIN Author_Books AB ON B.ISBN = AB.ISBN
             INNER JOIN Author A ON AB.AuthorID = A.AuthorID
             INNER JOIN Books_BookCategory BBC ON AB.ISBN = BBC.ISBN
             INNER JOIN BookCategory BC ON BBC.BookCategoryID = BC.BookCategoryID
WHERE BookTitle LIKE '%Database%' OR BookCategoryName LIKE '%Database%'; -- displaying title or category containing "database"

-- DISPLAYING EMAILS OF CUSTOMERS WHO HAVE OUTSTANDING ORDERS
SELECT Email
FROM Customer C  RIGHT OUTER JOIN CustomerOrder CO
ON C.CustomerID = CO.CustomerID
WHERE DateShipped is NULL;

-- DISPLAYING ORDER INFORMATION ON ANY ORDERS THAT HAVE PURCHASED MORE THAN ONE COPY OF ANY BOOK
SELECT CustomerOrder.OrderID, CustomerOrder.DateOrdered, CustomerOrder.DateShipped, CustomerOrder.OrderStatus,
       CustomerOrder.OrderSubtotal, CustomerOrder.Taxes, CustomerOrder.TotalCost, CustomerOrder.CustomerID
FROM CustomerOrder  RIGHT OUTER JOIN CustomerOrder_Books COB
ON CustomerOrder.OrderID = COB.OrderID
WHERE Quantity > 1
GROUP BY COB.OrderID
ORDER BY COB.OrderID;

-- DISPLAYING ORDER NUMBER AND TOTAL NUMBER OF BOOKS IN EACH ORDER
SELECT CustomerOrder.OrderID, SUM(Quantity)
FROM CustomerOrder
INNER JOIN CustomerOrder_Books COB
ON CustomerOrder.OrderID = COB.OrderID
GROUP BY CustomerOrder.OrderID;

-- DISPLAY EACH ORDER NUMBER, CUSTOMER NAMES AND TOTAL COST OF ORDER
SELECT CO.OrderID, CustomerLastName, CustomerFirstName, SUM(Quantity * Price * 1.15)
FROM CustomerOrder CO INNER JOIN Customer C ON CO.CustomerID = C.CustomerID
                      INNER JOIN CustomerOrder_Books COB ON CO.OrderID = COB.OrderID
                      INNER JOIN Books B ON COB.ISBN = B.ISBN
GROUP BY CO.OrderID;




