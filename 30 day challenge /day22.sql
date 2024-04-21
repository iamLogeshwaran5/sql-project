--Inspired by Problem link : https://datalemur.com/questions/matching-skills

use challenge;
CREATE TABLE candidates (
    candidate_id INTEGER,
    skill VARCHAR(255)
);
-- Insert skills for Candidate 123
INSERT INTO candidates (candidate_id, skill) VALUES (123, 'Python');
INSERT INTO candidates (candidate_id, skill) VALUES (123, 'Tableau');
INSERT INTO candidates (candidate_id, skill) VALUES (123, 'PostgreSQL');
-- Insert skills for Candidate 234
INSERT INTO candidates (candidate_id, skill) VALUES (234, 'R');
INSERT INTO candidates (candidate_id, skill) VALUES (234, 'PowerBI');
INSERT INTO candidates (candidate_id, skill) VALUES (234, 'SQL Server');
-- Insert skills for Candidate 345
INSERT INTO candidates (candidate_id, skill) VALUES (345, 'Python');
INSERT INTO candidates (candidate_id, skill) VALUES (345, 'Tableau');
-- Additional entries to make 10 values
INSERT INTO candidates (candidate_id, skill) VALUES (345, 'PostgreSQL');
INSERT INTO candidates (candidate_id, skill) VALUES (234, 'Python');
-- Insert skills for Candidate 123
INSERT INTO candidates (candidate_id, skill) VALUES (123, 'Python');
INSERT INTO candidates (candidate_id, skill) VALUES (123, 'Tableau');
INSERT INTO candidates (candidate_id, skill) VALUES (123, 'PostgreSQL');
-- Insert skills for Candidate 234
INSERT INTO candidates (candidate_id, skill) VALUES (234, 'R');
INSERT INTO candidates (candidate_id, skill) VALUES (234, 'PowerBI');
INSERT INTO candidates (candidate_id, skill) VALUES (234, 'SQL Server');
-- Insert skills for Candidate 345
INSERT INTO candidates (candidate_id, skill) VALUES (345, 'Python');
INSERT INTO candidates (candidate_id, skill) VALUES (345, 'Tableau');

select * from candidates;
-- solution
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id ASC;




