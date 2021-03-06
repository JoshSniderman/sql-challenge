-- Creating tables

create table title 
(
	title_id varchar primary key not null,
	title varchar
);

create table employees 
(
	emp_no varchar primary key not null,
	emp_title varchar not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar(1) not null,
	hire_date date not null,
 	foreign key (emp_title) references title (title_id)
);

create table departments 
(
 	dept_no varchar(10) primary key not null,
	dept_name varchar
);

create table salaries 
(
	emp_no varchar primary key not null,
	salary int not null,
	foreign key (emp_no) references employees(emp_no)
);

create table dept_emp 
(
	emp_no varchar not null,
	dept_no varchar not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
);

create table dept_manager
(
	dept_no varchar not null,
	emp_no varchar primary key not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
);

--Importing data

copy title
from 'C:/Users/freak/OneDrive/Documents/GitHub/Repos/sql-challenge/EmployeeSQL/Data/titles.csv'
delimiter ','
csv header;

copy employees
from 'C:/Users/freak/OneDrive/Documents/GitHub/Repos/sql-challenge/EmployeeSQL/Data/employees.csv'
delimiter ','
csv header;

copy departments
from 'C:/Users/freak/OneDrive/Documents/GitHub/Repos/sql-challenge/EmployeeSQL/Data/departments.csv'
delimiter ','
csv header;

copy salaries
from 'C:/Users/freak/OneDrive/Documents/GitHub/Repos/sql-challenge/EmployeeSQL/Data/salaries.csv'
delimiter ','
csv header;

copy dept_emp
from 'C:/Users/freak/OneDrive/Documents/GitHub/Repos/sql-challenge/EmployeeSQL/Data/dept_emp.csv'
delimiter ','
csv header;

copy dept_manager
from 'C:/Users/freak/OneDrive/Documents/GitHub/Repos/sql-challenge/EmployeeSQL/Data/dept_manager.csv'
delimiter ','
csv header;

-- Creating view of all stats for easier use

create view employee_data as
select emp_no,
first_name,
last_name,
birth_date,
sex,
hire_date,
title_id,
title,
dept_no, 
dept_name,
salary
from employees e
join dept_emp d using(emp_no)
join title t on e.emp_title = t.title_id
join salaries using(emp_no)
join departments using(dept_no);

select * from employee_data;