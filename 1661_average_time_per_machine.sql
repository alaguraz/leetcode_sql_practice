-- LeetCode 1661. Average Time of Process per Machine
-- Difficulty: Easy
-- 
-- Table: Activity
-- +------------+------------+---------------+-----------+
-- | machine_id | process_id | activity_type | timestamp |
-- +------------+------------+---------------+-----------+
-- (machine_id, process_id, activity_type) is the primary key.
-- 
-- Each machine runs several processes. 
-- 'start' means the machine starts the process at the given timestamp.
-- 'end' means the machine ends the process at the given timestamp.
-- Each (machine_id, process_id) pair has exactly one start and one end.
-- 
-- Goal: Find the average processing time for each machine.
-- The processing time for a process = end timestamp - start timestamp.
-- Return machine_id with average processing_time (rounded to 3 decimals).

SELECT
    machine_id,
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM(
    SELECT
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time 
    FROM Activity
    GROUP BY machine_id, process_id
) AS process_time
GROUP BY machine_id
