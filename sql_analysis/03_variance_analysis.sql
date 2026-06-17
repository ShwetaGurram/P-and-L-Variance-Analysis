-- 1. Monthly variance by department & category 
SELECT
    EXTRACT(YEAR  FROM date)  AS year,
    EXTRACT(MONTH FROM date)  AS month_num,
    TO_CHAR(date, 'Mon')      AS month_name,
    department,
    category,

    SUM(budget_amount)        AS total_budget,
    SUM(actual_amount)        AS total_actual,

    -- Variance: Actual - Budget
    -- Positive = Overspent | Negative = Underspent
    SUM(actual_amount) - SUM(budget_amount)  AS variance_inr,

    -- Variance %
    ROUND(
        (SUM(actual_amount) - SUM(budget_amount))
        / NULLIF(SUM(budget_amount), 0) * 100
    , 2)                      AS variance_pct,


    CASE
        WHEN SUM(actual_amount) > SUM(budget_amount) THEN 'Unfavourable'
        WHEN SUM(actual_amount) < SUM(budget_amount) THEN 'Favourable'
        ELSE 'On Track'
    END                       AS status,

    -- Severity tier
    CASE
        WHEN (SUM(actual_amount) - SUM(budget_amount))
             / NULLIF(SUM(budget_amount), 0) * 100 > 15  THEN 'High Overrun'
        WHEN (SUM(actual_amount) - SUM(budget_amount))
             / NULLIF(SUM(budget_amount), 0) * 100 > 5   THEN 'Moderate'
        WHEN (SUM(actual_amount) - SUM(budget_amount))
             / NULLIF(SUM(budget_amount), 0) * 100 < -5  THEN 'Underspend'
        ELSE 'On Track'
    END                       AS severity

FROM pl_data
GROUP BY
    EXTRACT(YEAR  FROM date),
    EXTRACT(MONTH FROM date),
    TO_CHAR(date, 'Mon'),
    department,
    category
ORDER BY
    year, month_num, department, category;


-- 2. Department-level annual summary 
SELECT
    department,
    SUM(budget_amount) AS total_budget,
    SUM(actual_amount) AS total_actual,
    SUM(actual_amount) - SUM(budget_amount) AS variance_inr,
    ROUND(
        (SUM(actual_amount) - SUM(budget_amount))
        / NULLIF(SUM(budget_amount), 0) * 100
    , 2) AS variance_pct,
    CASE
        WHEN SUM(actual_amount) > SUM(budget_amount) THEN 'Unfavourable'
        WHEN SUM(actual_amount) < SUM(budget_amount) THEN 'Favourable'
        ELSE 'On Track'
    END AS status,
    RANK() OVER (
        ORDER BY
            SUM(actual_amount) - SUM(budget_amount) DESC
    ) AS overrun_rank

FROM pl_data
GROUP BY department
ORDER BY overrun_rank;


-- 3. Category-level summary 
SELECT
    category,
    SUM(budget_amount) AS total_budget,
    SUM(actual_amount) AS total_actual,
    SUM(actual_amount) - SUM(budget_amount) AS variance_inr,
    ROUND(
        (SUM(actual_amount) - SUM(budget_amount))
        / NULLIF(SUM(budget_amount), 0) * 100
    , 2) AS variance_pct,
    CASE
        WHEN SUM(actual_amount) > SUM(budget_amount) THEN 'Unfavourable'
        WHEN SUM(actual_amount) < SUM(budget_amount) THEN 'Favourable'
        ELSE 'On Track'
    END AS status

FROM pl_data
GROUP BY category
ORDER BY variance_inr DESC;


-- 4. Region × Department variance matrix
SELECT
    region,
    department,
    SUM(budget_amount) AS total_budget,
    SUM(actual_amount) AS total_actual,
    SUM(actual_amount) - SUM(budget_amount) AS variance_inr,
    ROUND(
        (SUM(actual_amount) - SUM(budget_amount))
        / NULLIF(SUM(budget_amount), 0) * 100
    , 2) AS variance_pct

FROM pl_data
GROUP BY region, department
ORDER BY region, variance_pct DESC;