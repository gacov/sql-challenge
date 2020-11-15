-- List the following details of each employee: employee number, last name, first name, gender, and salary.
-- For this we will call for the specific columns on the "employees" and "salary" tables and perform an inner join.
SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary 
FROM employees AS a
INNER JOIN salaries AS b
ON a.emp_no = b.emp_no
;

-- List employees who were hired in 1986.
SELECT emp_no,last_name,hire_date FROM employees 
WHERE date_part('year', hire_date) = date_part('year', timestamp '1986-01-01')
;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- For this I am calling columns from three different tables and reordering them as requested in the question
SELECT a.dept_no, a.dept_name, b.emp_no, c.last_name, c.first_name, b.from_date, b.to_date
FROM departments AS a
INNER JOIN dept_manager AS b
ON a.dept_no = b.dept_no
INNER JOIN employees AS c
ON c.emp_no = b.emp_no
;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
--For this I have to link three tables via INNER JOIN
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees AS a
INNER JOIN dept_emp AS b
ON a.emp_no = b.emp_no
INNER JOIN departments AS c
ON b.dept_no = c.dept_no
;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'
;

--List all employees in the Sales department, including:
--employee number, last name, first name, and department name.
-- For this I will make an inner join between three tables
SELECT a.emp_no,a.last_name, a.first_name, c.dept_name
FROM employees AS a
INNER JOIN dept_emp AS b
ON a.emp_no = b.emp_no
INNER JOIN departments AS c
ON b.dept_no = c.dept_no
WHERE c.dept_name LIKE 'Sales'
;

--List all employees in the Sales and Development departments, including:
--employee number, last name, first name, and department name.
-- Very similar to the previous one, just adding the instruction to search for Development dept.
SELECT a.emp_no,a.last_name, a.first_name, c.dept_name
FROM employees AS a
INNER JOIN dept_emp AS b
ON a.emp_no = b.emp_no
INNER JOIN departments AS c
ON b.dept_no = c.dept_no
WHERE c.dept_name LIKE 'Sales' OR c.dept_name LIKE 'Development'
;

--In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
-- For this one I am creating a new column which will host the counting of the last names and grouping by last name
SELECT last_name,
COUNT(last_name) AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC
;

--Search your ID number.
SELECT last_name, first_name 
FROM employees
WHERE emp_no = '499942'
;