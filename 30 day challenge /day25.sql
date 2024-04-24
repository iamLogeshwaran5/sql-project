--problem  insipred (https://datalemur.com/questions/sql-page-with-no-likes)


-- Creating the 'pages' table
CREATE TABLE pages (
    page_id INTEGER,
    page_name VARCHAR(255)
);

-- Creating the 'page_likes' table
CREATE TABLE page_likes (
    user_id INTEGER,
    page_id INTEGER,
    liked_date DATETIME
);


-- Inserting data into the 'pages' table
INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');

-- Inserting data into the 'page_likes' table
INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');

SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id ASC;



