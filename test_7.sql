

SELECT
	category,
	product_name,
	SUM(total_amount) AS Total_Sale,
	DENSE_RANK() OVER (PARTITION BY category ORDER BY SUM(total_amount) DESC) AS 'Rank'
FROM product_Sale
GROUP BY product_name 
HAVING category = 'Snacks'
ORDER BY Total_Sale DESC