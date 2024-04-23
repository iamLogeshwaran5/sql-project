-- problem insipration by (https://datalemur.com/questions/time-spent-snaps)



-- Creating tables
CREATE TABLE activities (
    activity_id INT,
    user_id INT,
    activity_type VARCHAR(10),
    time_spent FLOAT,
    activity_date DATETIME
);

CREATE TABLE age_breakdown (
    user_id INT,
    age_bucket VARCHAR(10)
);

-- Inserting example data into activities
INSERT INTO activities (activity_id, user_id, activity_type, time_spent, activity_date)
VALUES
(7274, 123, 'open', 4.50, '2022-06-22 12:00:00'),
(2425, 123, 'send', 3.50, '2022-06-22 12:00:00'),
(1413, 456, 'send', 5.67, '2022-06-23 12:00:00'),
(1414, 789, 'chat', 11.00, '2022-06-25 12:00:00'),
(2536, 456, 'open', 3.00, '2022-06-25 12:00:00');

-- Inserting example data into age_breakdown
INSERT INTO age_breakdown (user_id, age_bucket)
VALUES
(123, '31-35'),
(456, '26-30'),
(789, '21-25');

-- SQL query to calculate sending and opening time percentages grouped by age_bucket
SELECT 
    b.age_bucket,
    ROUND(SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) * 100.0 / 
        (SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END)), 2) AS send_perc,
    ROUND(SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) * 100.0 / 
        (SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END)), 2) AS open_perc
FROM activities a
JOIN age_breakdown b ON a.user_id = b.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY b.age_bucket;
