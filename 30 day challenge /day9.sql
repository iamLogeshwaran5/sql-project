--  > link https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

/*197. Rising Temperature

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature in a certain day.
Write an SQL query to find all dates’ id with higher temperature compared to its previous dates (yesterday).

Return the result table in any order.

The query result format is in the following example:

Weather
+----+------------+-------------+
| id | recordDate | Temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Result table:
+----+
| id |
+----+
| 2  |
| 4  |
+----+
In 2015-01-02, temperature was higher than the previous day (10 -> 25).
In 2015-01-04, temperature was higher than the previous day (20 -> 30).
Note: Datediff() : The first parameter is the date to be substracted from, and the second parameter is the date to be substracted. e.g. datediff(date1, date2) is date1 minus date2.
*/


-- Solution >>


select w1.id
from Weather w1, Weather w2
where w1.Temperature > w2.Temperature
and datediff(w1.recordDate, w2.recordDate) = 1;
