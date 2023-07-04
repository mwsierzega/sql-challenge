-- Part 2: Data Engineering

-- Drop table departments
DROP TABLE departments;

-- Create table departments
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255) NOT NULL
);

-- Import departments.csv file into the table
-- View table
SELECT * FROM departments;


-- Drop table titles
DROP TABLE titles;

-- Create table titles
CREATE TABLE titles (
	emp_title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(255)
);

-- Import titles.csv file into the table
-- View table
SELECT * FROM titles;

-- Drop table employees
DROP TABLE employees;

-- Create table employees
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
		FOREIGN KEY (emp_title_id) REFERENCES titles(emp_title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL
);

-- Import employees.csv file into the table
-- View table
SELECT * FROM employees;

-- Drop table salaries
DROP TABLE salaries;

-- Create table salaries
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);

-- Import salaries.csv file into the table
-- View table
SELECT * FROM salaries;

-- Drop table dept_emp
DROP TABLE dept_emp;

-- Create a junction table dept_emp
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Import dept_emp.csv file into the table
-- View table
SELECT * FROM dept_emp;

-- Drop table dept_manager
DROP TABLE dept_manager;

-- Create a junction table dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Import dept_manager.csv file into the table
-- View table
SELECT * FROM dept_manager;