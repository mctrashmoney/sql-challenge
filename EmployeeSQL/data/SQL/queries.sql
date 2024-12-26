--1. Employee number, last name, first name, sex, salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no;

--2. People hired in 1986: first name, last name, hire date
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. Manager of each department with department number
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d ON dm.dept_no = d.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no;

--4. Employees with departments: emp_no, last name, first name, dept_name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

--5. First name, last name, and sex of each employee named 'Hercules' and last name begins with 'B'
SELECT first_name, last_name, sex
FROM employees
WHERE LOWER(first_name) = 'hercules' 
	AND LOWER(last_name) LIKE 'b%';

--6. Employees in the Sales department: emp_no, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales');

--7. Employees in the Sales and Development departments: emp_no, last name, first name, and dept_name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--8. Listing frequency counts of all employee last names
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;