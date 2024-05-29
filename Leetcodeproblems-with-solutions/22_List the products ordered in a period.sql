-- Question 45
-- Table: Products

-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | product_id       | int     |
-- | product_name     | varchar |
-- | product_category | varchar |
-- +------------------+---------+
-- product_id is the primary key for this table.
-- This table contains data about the company's products.
-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | order_date    | date    |
-- | unit          | int     |
-- +---------------+---------+
-- There is no primary key for this table. It may have duplicate rows.
-- product_id is a foreign key to Products table.
-- unit is the number of products ordered in order_date.
 

-- Write an SQL query to get the names of products with greater than or equal to 100 units ordered in February 2020 and their amount.

-- Return result table in any order.

-- The query result format is in the following example:

 

-- Products table:
-- +-------------+-----------------------+------------------+
-- | product_id  | product_name          | product_category |
-- +-------------+-----------------------+------------------+
-- | 1           | Leetcode Solutions    | Book             |
-- | 2           | Jewels of Stringology | Book             |
-- | 3           | HP                    | Laptop           |
-- | 4           | Lenovo                | Laptop           |
-- | 5           | Leetcode Kit          | T-shirt          |
-- +-------------+-----------------------+------------------+

-- Orders table:
-- +--------------+--------------+----------+
-- | product_id   | order_date   | unit     |
-- +--------------+--------------+----------+
-- | 1            | 2020-02-05   | 60       |
-- | 1            | 2020-02-10   | 70       |
-- | 2            | 2020-01-18   | 30       |
-- | 2            | 2020-02-11   | 80       |
-- | 3            | 2020-02-17   | 2        |
-- | 3            | 2020-02-24   | 3        |
-- | 4            | 2020-03-01   | 20       |
-- | 4            | 2020-03-04   | 30       |
-- | 4            | 2020-03-04   | 60       |
-- | 5            | 2020-02-25   | 50       |
-- | 5            | 2020-02-27   | 50       |
-- | 5            | 2020-03-01   | 50       |
-- +--------------+--------------+----------+

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CREATE TABLE Products (
    product_id int,
    product_name varchar(50),
    product_category varchar(20)
)

        
            INSERT INTO Products(product_id, product_name, product_category) VALUES ( 1, 'Leetcode Solutions', 'Book')
        
            INSERT INTO Products(product_id, product_name, product_category) VALUES ( 2, 'Jewels of Stringology', 'Book')
       
            INSERT INTO Products(product_id, product_name, product_category) VALUES ( 3, 'HP', 'Laptop')
        
            INSERT INTO Products(product_id, product_name, product_category) VALUES ( 4, 'Lenovo', 'Laptop')
        
            INSERT INTO Products(product_id, product_name, product_category) VALUES (5, 'Leetcode Kit', 'T-shirt')
        




CREATE TABLE Orders2 (
    product_id int,
    order_date DATE,
    unit INT
)

        
            INSERT INTO Orders2 (product_id, order_date, unit) VALUES ( 1, '2020-02-05', 60)
        
            INSERT INTO Orders2 (product_id, order_date, unit) VALUES ( 1, '2020-02-10', 70)
        
            INSERT INTO Orders2 (product_id, order_date, unit) VALUES ( 2, '2020-01-18', 30)
        
            INSERT INTO Orders2  (product_id, order_date, unit) VALUES ( 2, '2020-02-11', 80)
        
            INSERT INTO Orders2 (product_id, order_date, unit) VALUES ( 3, '2020-02-17', 2)
        
            INSERT INTO Orders2  (product_id, order_date, unit) VALUES (3, '2020-02-24', 3)
        
            INSERT INTO Orders2  (product_id, order_date, unit) VALUES (4, '2020-03-01', 20)
        
            INSERT INTO Orders2 (product_id, order_date, unit) VALUES (4, '2020-03-04', 30)
        
            INSERT INTO Orders2  (product_id, order_date, unit) VALUES (4, '2020-03-04', 60)
        
            INSERT INTO Orders2  (product_id, order_date, unit) VALUES (5, '2020-02-25', 50)
        
            INSERT INTO Orders2  (product_id, order_date, unit) VALUES (5, '2020-02-27', 50)
        
            INSERT INTO Orders2 (product_id, order_date, unit) VALUES (5, '2020-03-01', 50)
        



select * from Orders2 
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Result table:
-- +--------------------+---------+
-- | product_name       | unit    |
-- +--------------------+---------+
-- | Leetcode Solutions | 130     |
-- | Leetcode Kit       | 100     |
-- +--------------------+---------+

-- Products with product_id = 1 is ordered in February a total of (60 + 70) = 130.
-- Products with product_id = 2 is ordered in February a total of 80.
-- Products with product_id = 3 is ordered in February a total of (2 + 3) = 5.
-- Products with product_id = 4 was not ordered in February 2020.
-- Products with product_id = 5 is ordered in February a total of (50 + 50) = 100.

-- Solution
Select a.product_name, a.unit
from
(select p.product_name, sum(unit) as unit
from orders o 
join products p
on o.product_id = p.product_id
where month(order_date)=2 and year(order_date) = 2020
group by o.product_id) a
where a.unit>=100

-- My Solution

SELECT  product_name , sum(unit) FROM Products p
JOIN  Orders2  o ON p.product_id=o.product_id WHERE order_date >= '2020-02-01' and  order_date <'2020-03-01'  GROUP BY product_name having sum(unit) >= 100