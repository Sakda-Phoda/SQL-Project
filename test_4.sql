-- Query 4: Analyze the purchase history of the customer with the highest sales, including the purchase dates, products, quantities, and sales amounts. Also, specify the total sales this customer has made with our store from the beginning and the percentage of each purchase.

-- CTE to get the top customer by total sale
WITH top_customer AS 
    (
        SELECT
            customer_id,
            SUM(total_amount) AS total_sale
        FROM trans 
        GROUP BY customer_id
        ORDER BY total_sale DESC
        LIMIT 1
    )

-- Main query to get the transactions of the top customer and calculate percentage of total sale
SELECT
    customer_id,
    transaction_date AS Order_Date,
    product_name AS Product,
    quantity AS Quantity,
    total_amount AS Sale,
    ROUND(total_amount * 100.0 / SUM(total_amount) OVER (PARTITION BY customer_id), 2) AS '(%) Sale_Percentage',
    SUM(total_amount) OVER (PARTITION BY customer_id) AS Total_Sale 
FROM trans t
JOIN product_master p ON t.product_id = p.product_id
WHERE customer_id = (SELECT top_customer.customer_id FROM top_customer)
ORDER BY Sale DESC;
