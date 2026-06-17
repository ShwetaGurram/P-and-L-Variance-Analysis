-- Top 5 overspent categories
SELECT 
	Category, 
	Department,
	SUM(Actual_Amount - Budget_Amount) AS Overrun
FROM pl_data 
WHERE Actual_Amount > Budget_Amount
GROUP BY Category, Department 
ORDER BY Overrun DESC
LIMIT 5;

-- YoY comparison
SELECT 
	EXTRACT(YEAR FROM date) AS year,
	SUM(Budget_Amount) AS Budget,
	SUM(Actual_Amount) AS Actual
FROM pl_data 
GROUP BY EXTRACT(YEAR FROM date) 
ORDER BY year;

-- Payment method mix
SELECT 
	Payment_Method, 
	COUNT(*) AS Txns,
	SUM(Actual_Amount) AS Total_Spend
FROM pl_data 
GROUP BY Payment_Method;
