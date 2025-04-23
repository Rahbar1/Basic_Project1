-- Check Table Structure
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'wa_fn-usec_-hr-employee-attrition';


-- Basic Data Exploration
-- 1. Check Total Rows (Total Employees)
SELECT COUNT(*) AS total_employees 
FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;

-- 2. Preview First 5 Rows
SELECT * FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition` 
LIMIT 5;

-- 3. Check Unique Values in Key Categorical Columns
SELECT DISTINCT attrition FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;
SELECT DISTINCT department FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;
SELECT DISTINCT job_role FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;
SELECT DISTINCT education_field FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;
SELECT DISTINCT business_travel FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;


-- Attrition Analysis

-- Count of Employees Who Left
SELECT COUNT(*) AS attrition_count 
FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`
WHERE attrition = 'yes';

--  Attrition Rate (%)
SELECT 
    (COUNT(CASE WHEN attrition = 'yes' THEN 1 END) * 100.0 / COUNT(*)) AS attrition_rate
FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`;

--  Average Monthly Income by Department
SELECT department, AVG(MonthlyIncome) AS avg_income 
FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition` 
GROUP BY department
ORDER BY avg_income DESC;

-- Top 10 Highest Paid Employees
SELECT * FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition` 
ORDER BY MonthlyIncome DESC 
LIMIT 10;

-- Average Years at Company by Department
SELECT department, AVG(YearsAtCompany) AS avg_years_at_company
FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`
GROUP BY department
ORDER BY avg_years_at_company DESC;

--  Employees with More Than 10 Years in the Company
SELECT * FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`
WHERE YearsAtCompany > 10
ORDER BY YearsAtCompany DESC;

--  Attrition Count by Job Role
SELECT jobrole, COUNT(*) AS total_employees,
       COUNT(CASE WHEN attrition = 'yes' THEN 1 END) AS employees_left,
       (COUNT(CASE WHEN attrition = 'yes' THEN 1 END) * 100.0 / COUNT(*)) AS attrition_rate
FROM hr_analytics.`wa_fn-usec_-hr-employee-attrition`
GROUP BY jobrole
ORDER BY attrition_rate DESC;


