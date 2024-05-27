-- Question 13
-- Suppose that a website contains two tables, 
-- the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

-- Table: Customers.

-- +----+-------+
-- | Id | Name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- Table: Orders.

-- +----+------------+
-- | Id | CustomerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- Using the above tables as example, return the following:

-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+
_______________________________________________

-- Solution
Select Name as Customers
from Customers
where id != All(select c.id
                from Customers c, Orders o
                where c.id = o.Customerid) 
________________________________________________


-- My Solution

CREATE TABLE Customers (
    Id int,
    Name varchar(20)
);

--Insert Statements:        
           
			INSERT INTO Customers (Id, Name) VALUES (1,'Joe');
			INSERT INTO Customers (Id, Name) VALUES (2,'Henry');
			INSERT INTO Customers (Id, Name) VALUES (3,'Sam');
			INSERT INTO Customers (Id, Name) VALUES (4,'Max');               
    

CREATE TABLE Orders (
    Id int,
    CustomerId int
);
--Insert Statements:
        
            INSERT INTO Orders (Id, CustomerId) VALUES (1, 3);
			INSERT INTO Orders (Id, CustomerId) VALUES (2, 1);    


SELECT name FROM Customers where id not in
(SELECT distinct CustomerId FROM Orders)
