CREATE DATABASE ecommerceDB;
USE ecommerceDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customers (CustomerName, City)
VALUES ('Arjun', 'Coimbatore'),
       ('Kaviya', 'Chennai'),
       ('Varshini', 'Bangalore');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2025-01-10', 2500),
       (2, '2025-02-15', 1800),
       (1, '2025-03-05', 3200);

INSERT INTO OrderItems (OrderID, ProductName, Quantity, Price)
VALUES 
(1, 'Laptop Bag', 1, 1500),
(1, 'Mouse', 2, 500),
(2, 'Headphones', 1, 1800),
(3, 'Keyboard', 1, 1200),
(3, 'Pendrive', 2, 1000);

CREATE VIEW customer_view AS
SELECT CustomerName, City
FROM Customers;

SELECT * FROM customer_view;
select * from customers;

CREATE VIEW order_summary AS
SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

SELECT * FROM order_summary;

CREATE VIEW full_order_details AS
SELECT 
    o.OrderID,
    c.CustomerName,
    oi.ProductName,
    oi.Quantity,
    oi.Price,
    (oi.Quantity * oi.Price) AS LineTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID;
select * from full_order_details;

UPDATE customer_view
SET City = 'Madurai'
WHERE CustomerName = 'Arjun';

CREATE VIEW chennai_customers AS
SELECT * FROM Customers
WHERE City = 'Chennai'
WITH CHECK OPTION;
select * from chennai_customers;

INSERT INTO chennai_customers (CustomerName, City)
VALUES ('Harini', 'Coimbatore');   -- ❌ Not allowed

DROP VIEW order_summary;



