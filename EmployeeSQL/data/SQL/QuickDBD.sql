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