-- Question 4
-- Select all employee's name and bonus whose bonus is < 1000.

-- Table:Employee

-- +-------+--------+-----------+--------+
-- | empId |  name  | supervisor| salary |
-- +-------+--------+-----------+--------+
-- |   1   | John   |  3        | 1000   |
-- |   2   | Dan    |  3        | 2000   |
-- |   3   | Brad   |  null     | 4000   |
-- |   4   | Thomas |  3        | 4000   |
-- +-------+--------+-----------+--------+
-- empId is the primary key column for this table.
-- Table: Bonus

-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- empId is the primary key column for this table.


____________________________________________________

CREATE TABLE Employee (
    empId int,
    name varchar(20),
    supervisor int,
    salary INT
);

        
            INSERT INTO Employee (empId, name, supervisor, salary) VALUES (1, 'John', 3, 1000)
        
            INSERT INTO Employee (empId, name, supervisor, salary) VALUES (2, 'Dan', 3, 2000)
        
            INSERT INTO Employee (empId, name, supervisor, salary) VALUES (3, 'Brad',' ', 4000)
        
            INSERT INTO Employee(empId, name, supervisor, salary) VALUES (4, 'Thomas', 3, 4000)
			UPDATE Employee SET supervisor = null WHERE empId = 3

select * from Employee;

CREATE TABLE Bonus (
    empId int,
    bonus int
);
            INSERT INTO Bonus (empId, bonus) VALUES (2, 500)        
            INSERT INTO Bonus (empId, bonus) VALUES (4, 2000)      
______________________________________________________________________


-- Example ouput:

-- +-------+-------+
-- | name  | bonus |
-- +-------+-------+
-- | John  | null  |
-- | Dan   | 500   |
-- | Brad  | null  |
-- +-------+-------+


-- My Solution
Select E.name, B.bonus
From Employee E left join Bonus B
on E.empId = B.empId
where B.bonus< 1000 or B.Bonus IS NULL