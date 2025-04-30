-- Question 1
-- Create a new table to store the normalized data
CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(255),
  Product VARCHAR(255)
);

-- Insert normalized data into the new table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Query to verify the data in the normalized table
SELECT * FROM ProductDetail_1NF;


-- Question 2
-- Create a new table to store customer details
CREATE TABLE CustomerDetails_2NF (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255)
);

-- Insert unique customer details into the new table
INSERT INTO CustomerDetails_2NF (CustomerID, CustomerName)
VALUES 
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Emily Clark');

-- Create a new table to store order details
CREATE TABLE OrderDetails_2NF (
  OrderID INT,
  CustomerID INT,
  Product VARCHAR(255),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (CustomerID) REFERENCES CustomerDetails_2NF(CustomerID)
);

-- Insert normalized order details into the new table
INSERT INTO OrderDetails_2NF (OrderID, CustomerID, Product, Quantity)
VALUES 
(101, 1, 'Laptop', 2),
(101, 1, 'Mouse', 1),
(102, 2, 'Tablet', 3),
(102, 2, 'Keyboard', 1),
(102, 2, 'Mouse', 2),
(103, 3, 'Phone', 1);

-- Query to verify the data in the normalized tables
SELECT * FROM CustomerDetails_2NF;
SELECT * FROM OrderDetails_2NF;