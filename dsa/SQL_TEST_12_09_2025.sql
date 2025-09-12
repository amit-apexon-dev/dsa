1. Remove duplicates from employees_projects

DELETE FROM employees_projects ep1
USING employees_projects ep2
WHERE
    ep1.project_id = ep2.project_id
    AND ep1.employee_id = ep2.employee_id
    AND ep1.ctid > ep2.ctid;
-----------------------------------------------------------
2. Find the employee with the highest salary

SELECT id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
-----------------------------------------------------------
3. Project-wise Budget vs. Total Salary Committed

SELECT p.title,p.budget, SUM(e.salary) AS total_salary
FROM projects p
LEFT JOIN employees_projects ep on p.id = ep.project_id
LEFT JOIN employees e ON ep.employee_id = e.id
GROUP BY p.id, p.title, p.budget;
-----------------------------------------------------------
4. Average Number of Employees per Project over 12 Month

-----------------------------------------------------------
5. Create a View of Employees Working on Projects

CREATE VIEW employees_projects_view AS
  SELECT
  e.id AS employee_id,
  e.first_name,
  e.last_name,
  p.id AS project_id,
  p.title AS project_title
 FROM employees e
 JOIN employees_projects ep ON e.id = ep.employee_id
 JOIN projects p ON ep.project_id = p.id;
-----------------------------------------------------------

6. Department-wise Average Salary

SELECT d.id, d.name,
ROUND(AVG(e.salary),2) as avg_salary
from departments d
join employees e 
on d.id = e.department_id
GROUP BY d.id,d.name
ORDER BY avg_salary DESC
-----------------------------------------------------------

7. Projects with No Employees Assigned

SELECT p.id, p.title
FROM projects p
LEFT JOIN employees_projects ep 
ON p.id = ep.project_id
WHERE ep.employee_id IS NULL
-----------------------------------------------------------

8.Top 3 Highest Paid Employees per Department

-- SELECT
--     first_name,
--     last_name,
--     salary,
--     PARTION BY(department_id ORDER BY salary DESC)

    SELECT 
    e.first_name,
    e.last_name,
    e.salary,
    d.name
    FROM employees e
    JOIN departments d 
    ON e.department_id = d.id
    ORDER BY e.salary DESC
    LIMIT 3
-----------------------------------------------------------

9. Employees Working on Multiple Projects
	
SELECT e.id AS employee_id,
        e.first_name,
        e.last_name,
        COUNT(DISTINCT ep.project_id) as project_count
        FROM employees e
        JOIN employees_projects ep 
        ON e.id = ep.employee_id
        GROUP BY e.id,
        e.first_name,
        e.last_name
        HAVING COUNT(DISTINCT ep.project_id) > 1;

10. 		