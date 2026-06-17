-- Nulls
SELECT 
    COUNT(*) FILTER (WHERE date IS NULL) AS date_null_count,
    COUNT(*) FILTER (WHERE department IS NULL) AS department_null_count,
    COUNT(*) FILTER (WHERE category IS NULL) AS category_null_count,
	COUNT(*) FILTER (WHERE region IS NULL) AS region_null_count,
    COUNT(*) FILTER (WHERE budget_amount IS NULL) AS budget_amount_null_count,
    COUNT(*) FILTER (WHERE actual_amount IS NULL) AS actual_amount_null_count,
	COUNT(*) FILTER (WHERE payment_method IS NULL) AS payment_method_null_count,
    COUNT(*) FILTER (WHERE transaction_id IS NULL) AS transaction_id_null_count
FROM pl_data;


-- Duplicates
SELECT 
	Transaction_ID, 
	COUNT(*) 
FROM pl_data
GROUP BY Transaction_ID 
HAVING COUNT(*) > 1;


-- Zero / negative amounts
SELECT * 
FROM pl_data 
WHERE Budget_Amount <= 0;

SELECT * 
FROM pl_data 
WHERE Actual_Amount <= 0;


-- Date range check
SELECT * FROM pl_data
WHERE Date < '2021-01-01' OR Date > '2023-12-31';