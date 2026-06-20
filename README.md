# P&L Variance Analysis Dashboard

A 3-year budget vs actuals analysis across departments, categories, and regions — built end-to-end using SQL for analysis and Power BI for transformation, modeling, and visualization.

![Language](https://img.shields.io/badge/tools-SQL%20-yellow)
![Tools](https://img.shields.io/badge/tools-PostgreSQL%20%7C%20Power%20BI-blue)
![Dataset](https://img.shields.io/badge/dataset-Kaggle%20-orange)

---

## Project Overview

**Business Question:** Where and why did actual spend deviate from budget across FY 2021–2023, and what should leadership do about it?

A company tracked budget and actual spend across 6 departments, 6 categories, and 5 regions over 3 years. This project identifies high-variance areas, regional and departmental overrun patterns, and provides data-driven recommendations to improve budget accuracy.

| | |
|---|---|
| **Time Period** | January 2021 – December 2023 |
| **Dataset Source** | Kaggle (8 original columns) |
| **Tools Used** | SQL · Power Query · Power BI · DAX |
| **Dashboard Pages** | 3 (Overview, Department, Regional |

---

## Tools & Workflow

| Stage | Tool | Purpose |
|-------|------|---------|
| Data Exploration | SQL | Row counts, date range, distinct values |
| Data Quality Checks | SQL | NULLs, duplicates, outliers |
| Variance Analysis | SQL | Budget vs Actual, % variance, Favourable/Unfavourable flag |
| Department & Insights Queries | SQL | Ranking, YoY comparison, payment method mix |
| Data Transformation | Power Query | Data types, extract Month/Quarter/Year, rename columns |
| Data Modeling | Power BI | Star schema — Fact table + Dim_Calendar + Dim_Department |
| DAX Measures | Power BI | Variance, YTD, MoM, YoY, conditional formatting helpers |
| Dashboard | Power BI | 4-page interactive report with slicers |

---

## Dataset

**8 original columns:**

| Column | Description |
|--------|-------------|
| Transaction_ID | Unique identifier (primary key) |
| Date | Transaction date (YYYY-MM-DD) |
| Department | Sales, HR, IT, Finance, Operations, Marketing |
| Category | Salaries, Marketing, Infrastructure, Travel, Utilities, Training |
| Region | North, South, East, West, Central |
| Budget_Amount | Planned spend (₹) |
| Actual_Amount | Actual spend (₹) |
| Payment_Method | Bank Transfer, Credit Card, Cash, Cheque |

**7 custom columns added:**
Variance, Variance %, Status, Month, Month_Num, Year, Quarter

---

## Key Findings

- **Total actual spend was ₹97.73M against a ₹87.96M budget** — an unfavourable variance of ₹9.77M (11.10%)
- **All 6 departments overspent** — indicating a systemic budgeting gap, not an isolated issue
- **Sales had the highest overrun** at 14.90% (+₹2.11M), followed by IT (12.71%) and Marketing (11.76%)
- **Central region's IT spend overran by 33.27%** — the single largest variance in the entire dataset
- **56.87% of all transactions exceeded their individual budgets**
- **East and Central regions** drove the largest absolute overruns; **West region** showed the best budget adherence
- **Q3 shows a consistent seasonal dip** every year, followed by a Q4 spending surge
- **The variance gap narrowed in 2023** — budget grew 7.63% but actual spend grew only 3.07% (2022→2023), suggesting improving cost discipline

---

## Recommendations

1. Revise annual budgets upward by 10–12% to reflect actual spending patterns
2. Audit Sales department travel and operational costs — the largest overrun driver
3. Review IT infrastructure contracts in the Central region
4. Implement quarterly budget reviews to catch overruns mid-year rather than at year-end
5. Use the West region's spend discipline as an internal best-practice benchmark
6. Plan Q4-specific spend controls to prevent the recurring year-end budget surge

---

## Dashboard Preview

| Page | Description |
|------|-------------|
| **Overview** | KPIs, quarterly trend, YoY comparison |
| **Department** | Budget vs Actual by department, variance % ranking |
| **Regional** | Region × Department heatmap matrix, category spend mix |

<img src="https://github.com/ShwetaGurram/P-and-L-Variance-Analysis/blob/main/Home_page.png" alt="Project Logo" width="auto">
<img src="https://github.com/ShwetaGurram/P-and-L-Variance-Analysis/blob/main/Overview_page.png" alt="Project Logo" width="auto">
<img src="https://github.com/ShwetaGurram/P-and-L-Variance-Analysis/blob/main/Department_page.png" alt="Project Logo" width="auto">
<img src="https://github.com/ShwetaGurram/P-and-L-Variance-Analysis/blob/main/Region_page.png" alt="Project Logo" width="auto">

---

## How to Run

1. Open the SQL files in `sql_analysis/` in order (01 → 05) against the raw dataset
2. Open `PL_Variance_Dashboard.pbix` in Power BI Desktop
3. Refresh data source if needed (Home → Refresh)
4. Explore using the slicers on each page

---

## Author

**Shweta Gurram**

