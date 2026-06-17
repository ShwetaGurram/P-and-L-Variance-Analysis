-- Creating budget_vs_actual_data table (raw import — exact CSV columns)
CREATE TABLE pl_data (
  date            DATE,
  department     VARCHAR(20),
  category       VARCHAR(20),
  region         VARCHAR(15),
  budget_amount  NUMERIC(15,2),
  actual_amount  NUMERIC(15,2),
  payment_method VARCHAR(20),
  transaction_id  VARCHAR(20)
);

SELECT * 
FROM pl_data;

-- Import CSV into data_raw table
copy pl_data
FROM 'D:/P&L-variance-analysis/Budget_vs_Actual_Data.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');


SELECT 
	COUNT(*) 
FROM pl_data;


SELECT 
	MIN(Date), 
	MAX(Date) 
FROM pl_data;


SELECT 
	DISTINCT Department 
FROM pl_data;


SELECT 
	DISTINCT Category 
FROM pl_data;


SELECT 
	DISTINCT Region 
FROM pl_data;


SELECT 
	DISTINCT Payment_Method 
FROM pl_data;
