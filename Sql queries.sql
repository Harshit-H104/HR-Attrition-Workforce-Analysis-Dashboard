SELECT COUNT(*) FROM hr_attrition;

SELECT Attrition, COUNT(*) 
FROM hr_attrition
GROUP BY Attrition;

-- Check Basic Structure
SELECT * FROM hr_attrition LIMIT 5;

-- Find Overall Attrition Rate
SELECT attrition, COUNT(*) AS total
FROM hr_attrition
GROUP BY attrition;

-- Attrition Rate (%)
select count(*) as total_employee,
sum(case when lower(attrition) = 'yes' then 1 else 0 end) as employee_left,
round(sum(case when lower(attrition) = 'yes' then 1 else 0 end )* 100/ count(*),2
) 
as attrition_rate_percentage
from hr_attrition;

-- Attrition by Department
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN LOWER(attrition) = 'yes' THEN 1 ELSE 0 END) AS employees_left
FROM hr_attrition
GROUP BY department
ORDER BY department;

-- Attrition by Gender
Select gender, count(*)
as total,
sum(case when lower(attrition)= 'yes' then 1 else 0 end) as employee_left 
from hr_attrition
group by gender;

-- Overtime Impact
select overtime, count(*) as total,
sum(case when lower(attrition) = 'yes' then 1 else 0 end) as overtime_work,
round(
sum(case when lower(attrition)= 'yes' then 1 else 0 end) * 100/ count(*),2
) as attrition_overtime
from hr_attrition
group by overtime;

-- Salary Comparison
select attrition,
round(avg(monthlyincome),2) as employee_salary
from hr_attrition
group by attrition;

-- Job Role Risk Analysis
select jobrole, count(*) as total_jobrole,
sum(case when lower(attrition)= 'yes' then 1 else 0 end) as jobrole,
round(
sum(case when lower(attrition)= 'yes' then 1 else 0 end)*100/count(*),2
) as attrition_rate_per
from hr_attrition
group by jobrole
order by attrition_rate_per desc;

-- Work Life Balance Effect
select worklifebalance, count(*) as total,
sum(case when lower(attrition)= 'yes' then 1 else 0 end) as total_workbalance
from hr_attrition
group by worklifebalance
order by worklifebalance;















