-- problem insipiration by https://datalemur.com/questions/international-call-percentage

CREATE TABLE phone_info (
    caller_id INTEGER PRIMARY KEY,
    country_id VARCHAR(10),
    network VARCHAR(10),
    phone_number VARCHAR(20)
);

INSERT INTO phone_info (caller_id, country_id, network, phone_number) VALUES
(1, 'US', 'Verizon', '+1-212-897-1964'),
(2, 'US', 'Verizon', '+1-703-346-9529'),
(3, 'US', 'Jio', '+1-650-828-4774'),
(4, 'US', 'Airtel', '+1-415-224-6663'),
(5, 'IN', 'Vodafone', '+91 7503-907302'),
(6, 'IN', 'Jio', '+91 2287-664895'),
(7, 'IN', 'Airtel', '+91 1234-567890'),
(8, 'UK', 'VI', '+44 7000-000001');

CREATE TABLE phone_calls (
    caller_id INTEGER,
    receiver_id INTEGER,
    call_time TIMESTAMP
);

INSERT INTO phone_calls (caller_id, receiver_id, call_time) VALUES
(1, 2, '2022-07-04 10:13:49'),
(1, 5, '2022-08-21 23:54:56'),
(5, 1, '2022-05-13 17:24:06'),
(5, 6, '2022-03-18 12:11:49'),
(3, 8, '2022-01-15 08:15:20'),
(7, 4, '2022-02-10 14:20:30');

-- Calculate the percentage of international calls directly with one query
SELECT  ROUND(
    100.0 * SUM(CASE WHEN pi_caller.country_id <> pi_receiver.country_id THEN 1 ELSE 0 END) / COUNT(*),
    1
  ) AS international_calls_pct
FROM
  phone_calls AS pc
  INNER JOIN phone_info AS pi_caller ON pc.caller_id = pi_caller.caller_id
  INNER JOIN phone_info AS pi_receiver ON pc.receiver_id = pi_receiver.caller_id;









