CREATE DATABASE CompanyDB
GO

CREATE SCHEMA Sales
GO

CREATE TABLE CompanyDB.Sales.employees (
	employee_id INT,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	salary DECIMAL
);

ALTER TABLE Sales.employees
ALTER COLUMN hire_date DATETIME;

ALTER TABLE CompanyDB.Sales.employees
ADD CONSTRAINT PK_Employees PRIMARY KEY (employee_id);

CREATE SEQUENCE Sales.emp
	AS int
	start with 1
	increment by 1;

ALTER TABLE Sales.employees
ADD CONSTRAINT SEQ_EMP DEFAULT NEXT VALUE FOR Sales.emp FOR employee_id;

ALTER TABLE Sales.employees
ADD hire_date DATE;

--DATA MANIPULATION Exercises:

--Select all columns from the "employees" table.

SELECT *
FROM Sales.employees

-- Retrieve only the "first_name" and "last_name" columns from the "employees" table.

SELECT e.first_name, e.last_name
FROM Sales.employees e

--Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table

SELECT e.first_name + ' ' + e.last_name AS 'full name'
FROM Sales.employees e

--Show the average salary of all employees

SELECT avg(e.salary) AS 'Average Of Salary'
FROM Sales.employees e

--Select employees whose salary is greater than 5000.

SELECT e.salary
FROM Sales.employees e
WHERE e.salary > 5000

-- Retrieve employees hired in the year 2020

SELECT e.hire_date
FROM Sales.employees e
WHERE e.hire_date = 2020

--List employees whose last names start with 'S.'

SELECT e.last_name
FROM Sales.employees e
WHERE e.last_name LIKE 's%'

-- Display the top 10 highest-paid employees

SELECT TOP 10 e.salary
FROM Sales.employees e
order by e.salary desc

-- Find employees with salaries between 4000 and 6000.

SELECT e.salary
FROM Sales.employees e
WHERE e.salary BETWEEN 4000 AND 6000

-- Show employees with names containing the substring 'man.'

SELECT e.first_name, e.last_name
FROM Sales.employees e
WHERE e.first_name like '%man%' or e.last_name like '%man%'

--Display employees with a NULL value in the "hire_date" column.

SELECT e.hire_date
FROM Sales.employees e
WHERE e.hire_date IS NULL

--Select employees with a salary in the set (4000, 4500, 5000).

SELECT e.salary
FROM Sales.employees e
WHERE e.salary IN(4000, 4500, 5000)

--Retrieve employees hired between '2020-01-01' and '2021-01-01.'

SELECT e.hire_date
FROM Sales.employees e
WHERE e.hire_date between 2020-01-01 and 2021-01-01

--List employees with salaries in descending order.

SELECT e.salary
FROM Sales.employees e
ORDER BY e.salary DESC

--Show the first 5 employees ordered by "last_name" in ascending order.

SELECT TOP 5 E.last_name
FROM Sales.employees E

--Display employees with a salary greater than 5500 and hired in 2020.

SELECT e.salary, e.hire_date
FROM Sales.employees e
WHERE e.salary > 5500 and e.hire_date = 2020

--Select employees whose first name is 'John' or 'Jane.'

SELECT e.first_name
FROM Sales.employees e
WHERE e.first_name IN('John', 'Jane')

--List employees with a salary less than or equal to 5500 and a hire date after '2022-01-01.'

SELECT e.first_name, e.salary, e.hire_date
FROM Sales.employees e
WHERE e.salary <= 5500 and e.hire_date > 2022-01-01

--Retrieve employees with a salary greater than the average salary.

SELECT e.first_name
FROM Sales.employees e
WHERE e.salary > (SELECT avg(e.salary) FROM Sales.employees e)

--Display the 3rd to 7th highest-paid employees.

SELECT e.employee_id, e.salary
FROM Sales.employees e
ORDER BY e.employee_id
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY

--List employees hired after '2021-01-01' in alphabetical order.

SELECT e.first_name
FROM Sales.employees e
WHERE e.hire_date > 2022-01-01
ORDER BY e.hire_date ASC

--Retrieve employees with a salary greater than 5000 and last name not starting with 'A.'

SELECT e.first_name, e.last_name
FROM Sales.employees e
WHERE e.salary > 5000 and e.last_name not like 'A%'

--Display employees with a salary that is not NULL.

SELECT e.first_name
FROM Sales.employees e
WHERE e.salary is not null

--Show employees with names containing 'e' or 'i' and a salary greater than 45000.

SELECT e.first_name, e.last_name
FROM Sales.employees e
WHERE e.salary > 4500 and e.first_name like '%e%' or e.first_name like '%i%'