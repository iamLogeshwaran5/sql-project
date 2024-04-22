-- inspiration by   LINK ---> https://datalemur.com/questions/odd-even-measurements



use challenge;

CREATE TABLE measurements (
    measurement_id INT,
    measurement_value DECIMAL(10, 2),
    measurement_time DATETIME
);

INSERT INTO measurements (measurement_id, measurement_value, measurement_time)
VALUES
    (131233, 1109.51, '2022-07-10 09:00:00'),
    (135211, 1662.74, '2022-07-10 11:00:00'),
    (523542, 1246.24, '2022-07-10 13:15:00'),
    (143562, 1124.50, '2022-07-11 15:00:00'),
    (346462, 1234.14, '2022-07-11 16:45:00');
    
WITH RankedMeasurements AS (
    SELECT
        measurement_value,
        DATE(measurement_time) AS measurement_day,
        ROW_NUMBER() OVER (PARTITION BY DATE(measurement_time) ORDER BY measurement_time) AS rn
    FROM
        measurements
)
SELECT
    measurement_day,
    SUM(CASE WHEN rn % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN rn % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM
    RankedMeasurements
GROUP BY
    measurement_day;

