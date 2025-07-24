-- LeetCode 197. Rising Temperature
-- Difficulty: Easy
--
-- Table: Weather
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- id is unique, and each recordDate appears once.
--
-- Task:
-- Find all dates (id) where the temperature was higher than the previous day.
-- Return the result in any order.

SELECT
    w1.id
FROM
    Weather as w1
INNER JOIN
    Weather as w2
ON 
    DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE
    w1.temperature > w2.temperature
