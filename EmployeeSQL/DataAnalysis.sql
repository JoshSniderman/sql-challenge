-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp_no, last_name, first_name, sex, salary from employee_data;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employee_data
where extract(year from hire_date) = 1986;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select dept_no, dept_name, emp_no, last_name, first_name from dept_manager
left join departments using(dept_no)
left join employees using(emp_no);

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name from employee_data;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name  from employee_data
where dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name from employee_data
where dept_name in ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(*) as "Count" from employees
group by last_name
order by "Count" desc;