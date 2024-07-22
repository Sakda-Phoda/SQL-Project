CREATE VIEW product_Sale AS
	SELECT
		transaction_id,
		transaction_date,
		category,
		product_name,
		total_amount
	FROM trans t
	JOIN product_master p ON t.product_id = p.product_id;

SELECT
	category,
	product_name,
	SUM(total_amount) AS Total_Sale,
	DENSE_RANK() OVER (PARTITION BY category ORDER BY SUM(total_amount) DESC) AS 'Rank'
FROM product_Sale
GROUP BY product_name 
HAVING category = 'Snacks'
ORDER BY Total_Sale DESC