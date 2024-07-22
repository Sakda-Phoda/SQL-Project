-- Query 1: Selecting customer details and total sales, grouped by customer ID
SELECT
    t.customer_id,
    first_name || ' ' || last_name AS Customer_Name,
    email AS Email,
    phone AS Phone,
    SUM(total_amount) AS Total_Sale
FROM trans AS t
JOIN customer c ON t.customer_id = c.customer_id
GROUP BY t.customer_id
ORDER BY Total_Sale DESC
LIMIT 100;

-- Query 2: Another method to query the same result using a window function
SELECT
    DISTINCT t.customer_id,
    first_name || ' ' || last_name AS Customer_Name,
    email AS Email,
    phone AS Phone,
    SUM(total_amount) OVER (PARTITION BY t.customer_id) AS Total_Sale
FROM trans AS t
JOIN customer c ON t.customer_id = c.customer_id
ORDER BY Total_Sale DESC
LIMIT 100;

-- Recommendation: Use the first query for better performance due to shorter query execution time
