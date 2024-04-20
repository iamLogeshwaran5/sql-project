--  Insipration problem  link data lumer : https://datalemur.com/questions/sql-histogram-tweets

--  workout MySQL 


CREATE DATABASE trail;  -- Create a dataBase

CREATE TABLE tweets ( -- Create a Table
    tweet_id INT,
    user_id INT,
    msg VARCHAR(255),
    tweet_date DATETIME
);


INSERT INTO tweets (tweet_id, user_id, msg, tweet_date) VALUES  -- INserting a  Sample datas
(214252, 111, 'Am considering taking Tesla private at $420. Funding secured.', '2021-12-30 00:00:00'),
(739252, 111, 'Despite the constant negative press covfefe', '2022-01-01 00:00:00'),
(846402, 111, 'Following @NickSinghTech on Twitter changed my life!', '2022-02-14 00:00:00'),
(241425, 254, 'If the salary is so competitive why won’t you tell me what it is?', '2022-03-01 00:00:00'),
(231574, 148, 'I no longer have a manager. I can\'t be managed', '2022-03-23 00:00:00');


-- Solution Query
  
SELECT 
    tweet_count AS tweet_bucket, 
    COUNT(*) AS users_num
FROM (
    SELECT 
        user_id, 
        COUNT(*) AS tweet_count
    FROM tweets
    WHERE tweet_date >= '2022-01-01 00:00:00' AND tweet_date < '2023-01-01 00:00:00'
    GROUP BY user_id
) AS user_tweet_counts
GROUP BY tweet_count
ORDER BY tweet_bucket;



