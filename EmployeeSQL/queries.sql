-- DATA ANALYSIS
-- List the employee number, last name, first name, sex and salary of each employee
SELECT employees.emp_no, last_name, first_name, sex, salaries.salary 
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name and first name
SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM departments, dept_manager, employees
WHERE departments.dept_no = dept_manager.dept_no AND dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, last_name, first_name, dept_name 
FROM dept_emp, employees, departments
WHERE dept_emp.dept_no = departments.dept_no AND dept_emp.emp_no = employees.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dept_name, dept_emp.emp_no, last_name, first_name 
FROM departments, dept_emp, employees
WHERE dept_name = 'Sales' AND dept_emp.dept_no = departments.dept_no AND dept_emp.emp_no = employees.emp_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_name, dept_emp.emp_no, last_name, first_name 
FROM departments, dept_emp, employees
WHERE (dept_name = 'Sales' OR dept_name = 'Development') AND dept_emp.dept_no = departments.dept_no AND dept_emp.emp_no = employees.emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(emp_no) AS Total
FROM employees
GROUP BY last_name
ORDER BY Total DESC