SELECT 
	Department, 
	Region,
	SUM(Budget_Amount) AS Budget,
	SUM(Actual_Amount) AS Actual,
	SUM(Budget_Amount) - SUM(Actual_Amount) AS Variance,
	
	RANK() OVER (
		ORDER BY ABS(
			SUM(Budget_Amount)-SUM(Actual_Amount)) DESC
	) AS Variance_Rank
	
FROM pl_data
GROUP BY Department, Region
ORDER BY Variance_Rank;