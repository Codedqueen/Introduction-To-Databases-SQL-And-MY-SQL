Use employees;


SELECT 
    dept_no
FROM
    departments;
    SELECT 
    *
FROM
    departments;
    
  SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
    SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
    
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
   
   SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
   
   # The IN Statement
   SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
   
   SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
   
   # Like
   SELECT 
    *
FROM
    empoyees
WHERE
    first_name LIKE ('Mark%');
   
   SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');
   
   
 SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
 
 SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
 
 SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Jack%'); 
  
  
  SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66,000' AND '70,000';
  
  SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
  
  SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
  # IS NOT NULL IS NULL
  
  SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;
  
  # OTHER Comparison Operators
  # =, >, >=, <, <=, <>, !=
  # equal to, greater than, greater than or equal to, less than, less than or equal to, not equal
   SELECT 
    *
FROM
    employees
WHERE
	first_name = 'Mark';
    # OR
    SELECT 
    *
FROM
    employees
WHERE
	first_name <> 'Mark'; 
    
    # Select the list of employees hired after the 1st of Jan 2000
     SELECT 
    *
FROM
    employees
WHERE
	hire_date > '2000-01-01';
   
    SELECT 
    *
FROM
    employees
WHERE
	hire_date <= '1985-02-01';
# Assignment
# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
# Hint: If you solve the task correctly, SQL should return 7 rows.
# Extract a list with all employees' salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
    AND hire_date >= '2000-01-01';
    
    SELECT 
    *
FROM
    salaries
WHERE
   salary > '150000';
   
   # SELECT DISTINCT
# The select statement can retrieve rows from a designated column, given some criteria

SELECT 
    gender
FROM
    employees;

# To retrieve a list that contains both gender without duplicate values, here you dont just
# use SELECT but SELECT DISTINCT. The Syntax; SELECT DISTINCT column FROM table_name

SELECT DISTINCT
    gender
FROM
    employees;

# Ex
# Assignment
# Obtain a list with all different "hire dates" from the "employees" table.

SELECT DISTINCT
    hire_date
FROM
    employees;
  
  # INTRODUCTION TO AGGREGATE FUNCTIONS
  # They are applied to multiple rows of a single column of a table and return 
  # an output of a single value
  # COUNT() counts the number of non-null records in a field
  # SUM() sums all the non-null values in a column
  # MIN() returns the minimum values from the entire list
  # MAX() returns the maximum values from the entire list
  # AVG() Calculates the average of all non-null values belonging to a certain
  # column of a table
  
  # COUNT is frequently used with DISTINCT
  SELECT COUNT column_name FROM table_name; # Note: 
  # There shld be no space btw the brkt and count
  
  # EG How many employees are registered in our Database?
  
  SELECT 
    COUNT(emp_no)
FROM
    employees; # Count gives you the total number of values from a Dbase
     
     SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
     SELECT 
    COUNT(first_name)
FROM
    employees;
    
    # COUNT(DISTINCT)
    # Delivers the no of difft names in the data table
    # EG How many diift names can be found in the employess table?
     SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    # NOTE: Aggregate functions ignore NULL values unless told not to
    # Assignment
   # How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
   # How many managers do we have in the â€œemployeesâ€ database? Use the star symbol (*) in your code to solve this exercise.
  
   SELECT 
    COUNT(DISTINCT salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
 SELECT 
    COUNT(emp_no)
FROM
    dept_manager;
    
# ORDER BY
# Assignment
# Select all data from the "employees" table, ordering it by "hire date" in descending order.

 SELECT 
    *
FROM
    employees
ORDER BY hire_date ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;
# Here you use the Ascending and descending order (ASC and DESC)
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

# We can introduce 2 column output

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name ASC;


# GROUP BY
# When working with SQL results can be grouped by specific field(s) GROUP BY must be placed immediately after WHERE
# conditions, if any, and just before ORDER BYclause
# GROUP BY is one of the most powerful and useful tools in SQL The syntax is
# SELECT column_name(s)
# FROM table_name
# WHERE conditions
# GROUP BY column_name(s)
# ORDER BY column_name(s)
# GROUP BY is slower than SELECT DISTINCT but it groups outputs to a 
# summarised number times instead of listing names
SELECT 
    first_name 
FROM
    employees
GROUP BY first_name;


SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name;

# Order by comes immediately after the group by stmt

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

# In most cases, when you need an aggregate function, you must add a GROUP BY clause in your query

# Using ALIASES (AS)
# It is used to rename a selection from your query by adding the keyword AS
# It does not affect your output but clarifies the description of your table

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;
# Ex

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY emp_no
ORDER BY emp_no;

SELECT
 emp_no, AVG(salary) 
 FROM salaries 
 WHERE salary>80000 
 GROUP BY emp_no 
 ORDER BY emp_no;


# HAVING

SELECT
	emp_no, AVG(salary)
    FROM salaries
    WHERE salary>120000
    GROUP BY emp_no
    ORDER BY emp_no;
    
    # Having refines the output from records that do not satisfy a certain condition
    # It is frequently implemented with GROUP BY The Syntax is
# SELECT column_name(s)
# FROM table_name
# WHERE conditions
# GROUP BY column_name(s)
# HAVING conditions
# ORDER BY column_name(s)

# HAVING is like WHERE but applied to the GROUP BY block, It can be applied as a subset of aggregated groups

SELECT 
    *
FROM
    employees
HAVING hire_date >= '2000-01-01';

# Assignment
# Select all employees whose average salary is higher than $120,000 per annum.
# Hint: You should obtain 101 records.
# Compare the output you obtained with the output of the following two queries:

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;  # The correct answer

SELECT

*, AVG(salary)

FROM

salaries

WHERE

salary > 120000

GROUP BY emp_no

ORDER BY emp_no;


SELECT

*, AVG(salary)

FROM

salaries

GROUP BY emp_no

HAVING AVG(salary) > 120000;

# WHERE VS HAVING
# It's important to decide whether to use where or having in certain situations
# WHERE allows us to set conditions that refer to subsets of individual rows which
# are applied before re-organising the output into groups. Once the rows that satisfy the 
# WHERE conditions are chosen, they progress in the data retrieval process and can be grouped by
# DISTINCT values recorded in a field(s). The output can be further improved or filtered with
# with a condition specified in the HAVING clause, You could then sort the records of the final list
# to the ORDER BY clause

# Exercise
# Extract the list of all names that are encountered less than 200 times
# Let the data refer to people hired after the 1st of Jan 1999
 SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

# You cannot have an aggregated and non-aggregated condition in the HAVING clause
# To work with aggregate functions, use GROUP BY and HAVING
# TO apply general conditions, use WHERE

# EX
# Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
# Hint: To solve this exercise, use the "dept_emp" table.
SELECT 
    emp_no, COUNT(emp_no)
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;

SELECT 
    emp_no, COUNT(emp_no)
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;

# Correct answer
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;


# LIMITS

SELECT 
    *
FROM
    salaries
    ORDER BY salary DESC
    LIMIT 10;
# Show me the employee numbers of the 10 highest paid employes in the Database
# Think of ORDER BY DESC
SELECT 
    emp_no, COUNT(emp_no)
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no
LIMIT 100;
# Assignment
# Select the first 100 rows from the 'dept_emp' table.
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

# To set Limits, apply Limit to the SQL query, OR go to Edit, preferences, SQL execution, set limit. 
# OR go to limit to rows on the top icons on your wokbench

# SQL INSERT Statement

# To insert into a database, the syntax is
# INSERT INTO table_name(column_1, column_2)
# VALUES (value_1, value_2)

# EG
SELECT 
    *
FROM
    employees
LIMIT 10;
# Go to info section-Columns to get the types of data the columns are

INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01');

SELECT 
    *
FROM
    employees
    ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (999902, '1973-03-26', 'Patricia', 'Lawrence', 'F', '2005-01-01');
# We must put the values in the exact order we have listed the column names
# Specify as many data columns as there are columns in the data table
# Add them in the same order they appear in the table

# Pls remember to type integers as plain numbers without using quote

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees
VALUES
(
    999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);


INSERT INTO titles (emp_no, title, from_date)
VALUES (999903, 'senior_engineer', '1997-10-01');

INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (999903, 'd005', '1997-10-01', '9999-01-01');

# Inserting Data into a new table

# To create a table departments_dup
# Let's check what we have in the departments table
SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO departments_dup
(dept_no, 
dept_name
)
SELECT
 * 
 FROM 
 departments;

SELECT
 * 
 FROM 
 departments_dup ORDER BY dept_no;
 
 # When inserting a new data into an existing table, always ensure 
 # that the constraints set in the old table match the new table to avoid error
 # Complying with constraints is essential

/* CREATE TABLE Business_Analysis (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL);*/
    
/* Insert into Business_Analysis(dept_no, dept_name)
select * from departments;

Insert into Business_Analysis(dept_no, dept_name)
values('d010', 'business_analysis');

SELECT 
    *
FROM
    business_analysis
ORDER BY dept_no desc; */

DROP TABLE business_analysis;

INSERT INTO departments
VALUES ('d010', 'business_analysis');

SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC
LIMIT 10;

# TCL's Commit and Rollback
/* The Commit Statement
Saves transactions in the Database,
Changes cannot be undone
Used to save the state of the data in the database at the moment 
of its execution

The Rollback Clause
Allows you to take a step back
The last changes made will not count
Reverts to the last non-commited state
It will refer to the state corresponding to the last time you executed commit
The last commit can only be rolled back*/

/* The Update Statement
 Used to update the values of an existing record in a table
 UPDATE table_name
 SET column_1
 WHERE conditions*/
 
 SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
    UPDATE employees 
    SET 
    first_name = 'Stella',
    last_name = 'Parkinsons',
    birth_date = '1990-12-31',
    gender = 'F'
    WHERE 
    emp_no = 999901;
    
     SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
  
  /* The Update Statement 2
  If you dont provide the WHERE condition, all rows of the table will be updated*/
  SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
/* If you run the above query without the where clause and the accompanying conditions, 
 it will modify all rows in the data table
 To change this, use the rollback command. But ensure you commit 
 the query before rollback to avoid losing all your previous data
 Once you execute commit, you cant reverse any changes
 When you roll back after commit, it takes you back to the last query before commit
 Be careful when setting the WHERE clause in the UPDATE stmt to avoid messing up your data*/
 

ROLLBACK;
COMMIT;


SELECT 
    *
FROM
    business_analysis
ORDER BY dept_no;

update departments
set
dept_name = 'Data Analysis'
where
dept_no = 'd010';

SELECT 
    *
FROM
    departments
ORDER BY dept_name
LIMIT 10;

/* SQL Delete Statement
It deals with removing data from the database, before deleting, ensure you run the COMMIT stmt
so that you can ROLLBACK after Deleting the data
DELETE FROM table_name
WHERE conditions*/

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;

    SELECT 
    *
FROM
    departments
order by
    dept_no;
    
    ROLLBACK;
    
    DELETE FROM employees 
WHERE
    emp_no = 999903;
    
/*Assignment
Remove the department number 10 record from the "departments" table.
Hint: To solve this exercise, use the "departments" table.*/
COMMIT;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
    ROLLBACK;

/* DROP VS TRUNCATE VS DELETE
DROP - If you drop a table, you will loose the records, the table as a structure, and 
you wont be able to roll back to it's initial state, or to the last COMMIT stmt
Once you drop a table, it's gone
Use drop table only when you aren't going to use the table anymore

TRUNCATE - Is a stmt that will essentially remove all records from a table but its structure
will remain intact. When truncating, auto-increment values will be reset back to the start number

DELETE - REmoves records row by row. Only the rows specified in the conditions will be deleted
If WHERE is ommited, the result will be like that of Truncate
TRUNCATE VS DELETE without the WHERE clause
The SQL optimiser will implement difft programmatic approaches when we are using 
TRUNCATE or DELETE. TRUNCATE delivers the output much quicker than DELETE 'cos it's not delivering 
the output row by row.
Auto-increment values are not reset with DELETE. It continues from the last number deleted */

/* MySQL AGGREGATE FUNCTIONS

COUNT()
SUM()
MIN() and MAX()
AVG()
EX */

SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

/* ROUND() */
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    
    /* COALESCE() - PREAMBLE */
    
    set autocommit = 0;
    COMMIT;
    
    CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT * FROM departments_dup;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

DELETE FROM departments_dup WHERE dept_no = 'd010';

DELETE FROM departments_dup WHERE dept_no = 'd011';

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT * FROM departments_dup ORDER BY dept_no ASC;

COMMIT;

SELECT 
    dept_no, IFNULL(dept_name, 'Department name not provided')
FROM
    departments_dup;

SELECT 
    dept_no, IFNULL(dept_name, 'Department name not provided') as dept_name
FROM
    departments_dup; 
    
    SELECT 
    dept_no, COALESCE(dept_name, 'Department name not provided') as dept_name
FROM
    departments_dup;
    
    SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC;
		