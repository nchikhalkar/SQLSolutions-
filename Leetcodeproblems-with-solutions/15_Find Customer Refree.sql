-- Question 10
-- Given a table customer holding customers information and the referee.

-- +------+------+-----------+
-- | id   | name | referee_id|
-- +------+------+-----------+
-- |    1 | Will |      NULL |
-- |    2 | Jane |      NULL |
-- |    3 | Alex |         2 |
-- |    4 | Bill |      NULL |
-- |    5 | Zack |         1 |
-- |    6 | Mark |         2 |
-- +------+------+-----------+
-- Write a query to return the list of customers NOT referred by the person with id '2'.
-- For the sample data above, the result is:

-- +------+
-- | name |
-- +------+
-- | Will |
-- | Jane |
-- | Bill |
-- | Zack |
-- +------+

_______________
-- My Solution
CREATE TABLE customer (
    id int,
    name varchar(20),
    referee_id int
);

        
            INSERT INTO customer (id, name, referee_id) VALUES (1, 'Will', NULL)
        
            INSERT INTO customer (id, name, referee_id) VALUES (2, 'Jane', NULL)
        
            INSERT INTO customer (id, name, referee_id) VALUES (3, 'Alex', 2)
        
            INSERT INTO customer (id, name, referee_id) VALUES (4, 'Bill', NULL)
        
            INSERT INTO customer (id, name, referee_id) VALUES (5, 'Zack', 1)
        
            INSERT INTO customer (id, name, referee_id) VALUES (6, 'Mark', 2)


_______________________________


Select name
from customer 
where referee_id != 2
or referee_id is NULL