# Get average salaries by gender
SELECT
  (-- subquery to get average male salary
    SELECT AVG(salaries.salary)
    FROM employees
      INNER JOIN salaries ON employees.emp_no = salaries.emp_no
    WHERE employees.gender = 'M'
  ) AS average_male_salary,
  (-- subquery to get average female salary
    SELECT AVG(salaries.salary)
    FROM employees
      INNER JOIN salaries ON employees.emp_no = salaries.emp_no
    WHERE employees.gender = 'F'
  ) AS average_female_salary;
