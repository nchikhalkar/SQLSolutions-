-- Question 31
-- Table: Submissions

-- +---------------+----------+
-- | Column Name   | Type     |
-- +---------------+----------+
-- | sub_id        | int      |
-- | parent_id     | int      |
-- +---------------+----------+
-- There is no primary key for this table, it may have duplicate rows.
-- Each row can be a post or comment on the post.
-- parent_id is null for posts.
-- parent_id for comments is sub_id for another post in the table.
 

-- Write an SQL query to find number of comments per each post.

-- Result table should contain post_id and its corresponding number_of_comments, 
-- and must be sorted by post_id in ascending order.

-- Submissions may contain duplicate comments. You should count the number of unique comments per post.

-- Submissions may contain duplicate posts. You should treat them as one post.

-- The query result format is in the following example:

-- Submissions table:
-- +---------+------------+
-- | sub_id  | parent_id  |
-- +---------+------------+
-- | 1       | Null       |
-- | 2       | Null       |
-- | 1       | Null       |
-- | 12      | Null       |
-- | 3       | 1          |
-- | 5       | 2          |
-- | 3       | 1          |
-- | 4       | 1          |
-- | 9       | 1          |
-- | 10      | 2          |
-- | 6       | 7          |
-- +---------+------------+


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  CREATE TABLE Submissions  (
    sub_id int,
    parent_id int
)

        
            INSERT INTO Submissions (sub_id, parent_id) VALUES ( 1, Null)
        
            INSERT INTO Submissions  (sub_id, parent_id) VALUES ( 2, Null)
        
            INSERT INTO Submissions (sub_id, parent_id) VALUES ( 1, Null)
        
            INSERT INTO Submissions (sub_id, parent_id) VALUES ( 12 , Null)
        
            INSERT INTO Submissions  (sub_id, parent_id) VALUES ( 3, 1)
        
            INSERT INTO Submissions  (sub_id, parent_id) VALUES ( 5, 2)
        
            INSERT INTO Submissions (sub_id, parent_id) VALUES ( 3, 1)
        
            INSERT INTO Submissions  (sub_id, parent_id) VALUES ( 4, 1)
        
            INSERT INTO Submissions (sub_id, parent_id) VALUES ( 9, 1)
        
            INSERT INTO Submissions  (sub_id, parent_id) VALUES (10, 2)
        
            INSERT INTO Submissions  (sub_id, parent_id) VALUES ( 6 , 7)


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Result table:
-- +---------+--------------------+
-- | post_id | number_of_comments |
-- +---------+--------------------+
-- | 1       | 3                  |
-- | 2       | 2                  |
-- | 12      | 0                  |
-- +---------+--------------------+

-- The post with id 1 has three comments in the table with id 3, 4 and 9. The comment with id 3 is 
-- repeated in the table, we counted it only once.
-- The post with id 2 has two comments in the table with id 5 and 10.
-- The post with id 12 has no comments in the table.
-- The comment with id 6 is a comment on a deleted post with id 7 so we ignored it.

-- Solution
Select a.sub_id as post_id, coalesce(b.number_of_comments,0) as number_of_comments
from(
select distinct sub_id from submissions where parent_id is null) a
left join(
select parent_id, count(distinct(sub_id)) as number_of_comments
from submissions
group by parent_id
having parent_id = any(select sub_id from submissions where parent_id is null)) b
on a.sub_id = b.parent_id
order by post_id

-- My SOlution

WITH CTE1 AS
(
SELECT parent_id, COUNT(parent_id) number_of_comments  FROM 
(select distinct parent_id, sub_id from Submissions) GROUP BY 1)
,
CTE2 AS
(SELECT sub_id FROM 
(select distinct parent_id, sub_id from Submissions) where parent_id='Null')

SELECT sub_id , COALESCE(number_of_comments,0) from CTE2 LEFT JOIN CTE1 ON CTE1.parent_id=CTE2.sub_id