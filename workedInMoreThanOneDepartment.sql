# Select employees who has been working in more than one department
SELECT
  employees.emp_no,
  employees.first_name,
  employees.last_name,
  GROUP_CONCAT(departments.dept_name) AS departments
FROM employees
  INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
  INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
-- filter by employees who has been working in more than one department
WHERE employees.emp_no IN (SELECT emp_no
                           FROM dept_emp
                           GROUP BY emp_no
                           HAVING COUNT(emp_no) > 1)
-- group by emp_no, this way employees won't be duplicated and departments names can be concatenated into a row
GROUP BY employees.emp_no;
