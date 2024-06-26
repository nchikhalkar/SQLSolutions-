
-- Question 12
-- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

-- +---------+------------------+------------------+
-- | Id(INT) | RecordDate(DATE) | Temperature(INT) |
-- +---------+------------------+------------------+
-- |       1 |       2015-01-01 |               10 |
-- |       2 |       2015-01-02 |               25 |
-- |       3 |       2015-01-03 |               20 |
-- |       4 |       2015-01-04 |               30 |
-- +---------+------------------+------------------+

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  CREATE TABLE Weather (
    Id INT,
    RecordDate DATE,
    Temperature INT
)

            INSERT INTO Weather  (Id, RecordDate, Temperature) VALUES ( 1, '2015-01-01', 10)
        
            INSERT INTO Weather (Id, RecordDate, Temperature) VALUES ( 2, '2015-01-02', 25)
        
            INSERT INTO Weather  (Id, RecordDate, Temperature) VALUES ( 3, '2015-01-03', 20)
        
            INSERT INTO Weather  (Id, RecordDate, Temperature) VALUES ( 4 , '2015-01-04', 30)
select * from Weather
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- For example, return the following Ids for the above Weather table:

-- +----+
-- | Id |
-- +----+
-- |  2 |
-- |  4 |
-- +----+

-- Solution
select a.Id
from weather a, weather b
where a.Temperature>b.Temperature and  datediff(a.recorddate,b.recorddate)=1

-- My Solution

SELECT w2.id FROM Weather w1 , Weather w2 
where DATEDIFF (DAY, w2.RecordDate,w1.RecordDate) = 1 and w1.Temperature < w2.Temperature