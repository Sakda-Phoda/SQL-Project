-- Query 8: Pivot the sales of all branches to show the monthly sales of each branch.

SELECT 
    branch_id,
    [January],
    [February],
    [March],
    [April],
    [May],
    [June]
FROM trans
PIVOT 
	(
		SUM(total_amount)
		FOR Month IN ([January], [February], [March], [April], [May], [June])
	) as PivotTable;
