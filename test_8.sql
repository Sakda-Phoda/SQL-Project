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
