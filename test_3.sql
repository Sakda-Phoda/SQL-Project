-- Query 3: Query the top 100 customers with the highest purchase amounts, including details such as customer ID, first and last name, email, and phone number. (For this query, there are two codes with the same result, but it is recommended to use the first code as it runs faster.)

-- First query: Selecting customer details and total sales, grouped by customer ID
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

-- Another way: Another method to query the same result using a window function
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
