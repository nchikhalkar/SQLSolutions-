-- Question 15
-- The Employee table holds all employees including their managers. 
-- Every employee has an Id, and there is also a column for the manager Id.

-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.

-- Solution
select a.Name as Employee
from employee a, employee b
where a.salary>b.salary and a.managerid=b.id

-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
______________________________

-- My Solution
CREATE TABLE Emp (
    Id int,
    Name varchar(50),
    Salary int,
    ManagerId int
);

            INSERT INTO Emp (Id, Name, Salary, ManagerId) VALUES (1, 'Joe', 70000, 3)
        
            INSERT INTO Emp (Id, Name, Salary, ManagerId) VALUES (2, 'Henry', 80000, 4)
        
            INSERT INTO Emp (Id, Name, Salary, ManagerId) VALUES (3, 'Sam', 60000, NULL)
        
            INSERT INTO Emp (Id, Name, Salary, ManagerId) VALUES (4, 'Max', 90000, NULL)
select * from Emp;
________________________________

SELECT e2.Name FROM Emp e1 INNER JOIN Emp e2 ON
e1.Id=e2.ManagerId and e1.Salary<e2.Salary