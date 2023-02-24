-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Departments (
    dept_no VARCHAR(30) NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_Emp (
    emp_no VARCHAR NOT NULL,
    dept_no VARCHAR NOT NULL
);

CREATE TABLE Dept_Manager (
    dept_no VARCHAR NOT NULL,
    emp_no VARCHAR NOT NULL
);

CREATE TABLE Employees (
    emp_no VARCHAR NOT NULL,
    emp_title VARCHAR NOT NULL,
    bith_date VARCHAR NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(15) NOT NULL,
    hire_date VARCHAR NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no VARCHAR NOT NULL,
    salary VARCHAR NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title FOREIGN KEY(emp_title)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

SELECT DISTINCT EMP_TITLE FROM EMPLOYEES WHERE EMP_TITLE NOT IN (SELECT TITLE_ID FROM TITLES)

-- Looking to make sure all data imported correctly
-- SELECT * FROM employees

-- Accidently imported the columns headers as data, which cause error in the constrains / modified to delete in each table
-- SELECT * from salaries
-- DELETE FROM salaries
-- WHERE salary = 'salary'


