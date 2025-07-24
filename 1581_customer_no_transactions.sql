-- LeetCode 1581. Customer Who Visited but Did Not Make Any Transactions
-- Difficulty: Easy
--
-- Table: Visits
-- +-----------+-------------+
-- | visit_id  | customer_id |
-- +-----------+-------------+
-- visit_id is unique.
--
-- Table: Transactions
-- +----------------+----------+--------+
-- | transaction_id | visit_id | amount |
-- +----------------+----------+--------+
-- transaction_id is unique.
--
-- Task:
-- Find the IDs of customers who visited the mall WITHOUT making any transactions.
-- Also count how many such "no-transaction" visits they made.
--
-- Return:
-- customer_id, count_no_trans

SELECT
    customer_id,
    COUNT(*) AS count_no_trans
FROM 
    Visits
LEFT JOIN 
    Transactions ON Visits.visit_id = Transactions.visit_id
WHERE 
    transaction_id IS NULL
GROUP BY 
    customer_id
