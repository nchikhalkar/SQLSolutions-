-- Question 32
-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Id is the primary key column for this table.

-- Solution

With t1 as
(
 Select *,
    row_number() over(partition by email order by id) as rk
    from person
)
Delete from person
where id in (Select t1.id from t1 where t1.rk>1)
____________________________

-- My Solution:

CREATE TABLE person(
    Id int,
    Email varchar(50)
);        
            INSERT INTO person (Id, Email) VALUES (2, 'bob@example.com')
			INSERT INTO person (Id, Email) VALUES (3,'john@example.com')       

  select * from person;
______________________________

-- For example, after running your query, the above Person table should have the following rows:
-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+




--in bigquery the above solution won't work because you cant use WIth and DElete together.

solution1:

CREATE OR REPLACE TABLE person AS 

SELECT Id FROM

(SELECT * , RANK() OVER(PARTITION BY Email ORDER BY Id) rnk FROM person ) AS CTE WHERE rnk=1


solution2: 
  
DELETE person WHERE Id IN (SELECT Id FROM

(SELECT * , RANK() OVER(PARTITION BY Email ORDER BY Id) rnk FROM person) AS CTE WHERE rnk!=1) 