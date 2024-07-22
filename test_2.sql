-- Query 2: Find the number of transactions, total sales, and average sales. Also, indicate whether the sales performance was above or below average by grouping by month.

-- Common Table Expression (CTE) to calculate total sales and number of transactions per month
WITH
monthly_sales AS 
	(
	    SELECT 
	        strftime('%Y-%m', transaction_date) AS Month,
	        COUNT(transaction_id) AS Number_of_Transaction,
			SUM(total_amount) AS Total_Sale
	    FROM trans
	    GROUP BY Month
	),

-- CTE to calculate the average total sales per month
average_sales AS 
	(
	    SELECT 
	        SUM(total_amount) / COUNT(DISTINCT strftime('%Y-%m', transaction_date)) AS Average_Total_Sale
	    FROM trans
	)

-- Main query to join the CTEs and calculate the sales performance
SELECT 
    ms.*,
    avgs.*,
    CASE 
        WHEN ms.Total_Sale > avgs.Average_Total_Sale THEN 'Above_Average'
        WHEN ms.Total_Sale < avgs.Average_Total_Sale THEN 'Below_Average'
        ELSE 'Average'
    END AS Sale_Performance
FROM monthly_sales ms
CROSS JOIN average_sales avgs
ORDER BY ms.Month;
