-- Query 5: Find the percentile of all customers based on the sales amount each customer achieved.

SELECT
    t.customer_id,
	first_name || ' ' || last_name AS Name,
    SUM(total_amount) AS Total_Sale,
    NTILE(100) OVER (ORDER BY total_amount) AS 'Percentile'
FROM trans t
JOIN customer c ON t.customer_id = c.customer_id
GROUP BY t.customer_id
ORDER BY Percentile DESC, Total_Sale DESC;
