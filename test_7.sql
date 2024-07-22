-- Query 7: Summarize the sales for each month with a column comparing it to the previous month and showing month-on-month sales.

SELECT
	strftime('%Y-%m',transaction_date) AS Month,
	SUM(total_amount) AS Total_Sale,
	LAG(SUM(total_amount), 1) OVER (ORDER BY transaction_date) AS Previous_Sale,
	SUM(total_amount) - LAG(SUM(total_amount), 1) OVER (ORDER BY transaction_date) AS Sale_Diff
FROM trans 
GROUP BY Month
