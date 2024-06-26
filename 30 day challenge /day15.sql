-- problem link : https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-507


/*

Problem
Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table in descending order by rating.

The query result format is in the following example:

Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Result table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
We have three movies with odd-numbered ID: 1, 3, and 5. The movie with ID = 3 is boring so we don't include it in the answer.

solution:


*/

SELECT *
FROM Cinema
WHERE id % 2 = 1 AND description <> 'boring'
ORDER BY rating DESC;



