-- Drop existing tables if they exist
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL UNIQUE
);

-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR NOT NULL UNIQUE
);

-- Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL CHECK (sex IN ('M', 'F')),
    hire_date DATE NOT NULL,
    CONSTRAINT fk_employees_titles FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

-- Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_emp_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    CONSTRAINT fk_dept_emp_departments FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT fk_dept_manager_departments FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    CONSTRAINT fk_dept_manager_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL CHECK (salary > 0),
    CONSTRAINT fk_salaries_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Display working location and copy csv files there with this:
-- SHOW data_directory;  
--#####################

-- Import departments csv
COPY departments(dept_no, dept_name)
FROM 'data/departments.csv'
DELIMITER ','
CSV HEADER;

-- Import titles csv
COPY titles(title_id, title)
FROM 'data/titles.csv'    -- Change location if needed
DELIMITER ','
CSV HEADER;

-- Import employees csv 
COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'data/employees.csv' -- Change location if needed
DELIMITER ','
CSV HEADER;

-- Import dept_emp csv
COPY dept_emp(emp_no, dept_no)
FROM 'data/dept_emp.csv'  -- Change location if needed
DELIMITER ','
CSV HEADER;

-- Import dept_manager csv 
COPY dept_manager(dept_no, emp_no)
FROM 'data/dept_manager.csv' -- Change location if needed
DELIMITER ','
CSV HEADER;

-- Import salaries csv
COPY salaries(emp_no, salary)
FROM 'data/salaries.csv'    -- Change location if needed
DELIMITER ','
CSV HEADER;
