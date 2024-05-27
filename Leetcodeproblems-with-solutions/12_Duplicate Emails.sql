-- Question 11
-- Write a SQL query to find all duplicate emails in a table named Person.

-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- For example, your query should return the following for the above table:


_____________
 use person table from delete duplicate emails
_____________________

-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+


-- Solution
Select Email
from
(Select Email, count(Email)
from person
group by Email
having count(Email)>1) a

select * from person

-- My Soln  

UPDATE person SET Email = 'a@b.com' WHERE Id = 1
UPDATE person SET Email = 'c@d.com' WHERE Id = 2
insert into person(Id, Email) values (3,'a@b.com')

SELECT Email FROM person group by Email having COUNT(Email)>1