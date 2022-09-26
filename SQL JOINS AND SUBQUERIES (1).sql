Use employees;

/* JOINS
Introduction to Joins:

 Are the SQL tools that allow us to construct a r/ship btw objects
Relational Schemas are the perfect tool that will help you find a strategy for linking tables
Emphasis on employee and dept_emp tables; JOIN shows a result set, containing fields derived
from 2 or more tables
To JOIN, we must find a related column from the 2 tables that contains the same type of   data
The emp_no is common to the 2 tables, d4, We will be free to add columns from these 2 tables to our output
The columns you use to relate tables must represent the same object, such as id
The tables you are  considering need not be logically adjacent*/

/*Assignment
Task 1:
If you currently have the â€˜departments_dupâ€™ table set up, use DROP COLUMN to remove the â€˜dept_managerâ€™ 
column from the â€˜departments_dupâ€™ table.
Then, use CHANGE COLUMN to change the â€˜dept_noâ€™ and â€˜dept_nameâ€™ columns to NULL.
(If you donâ€™t currently have the â€˜departments_dupâ€™ table set up, create it. Let it contain two columns:
 dept_no and dept_name. Let the data type of dept_no be CHAR of 4, and the data type of dept_name be VARCHAR of 40.
 Both columns are allowed to have null values. Finally, insert the information contained in â€˜departmentsâ€™ into â€˜departments_dupâ€™.)
Then, insert a record whose department name is â€œPublic Relationsâ€.
Delete the record(s) related to department number two.
Insert two new records in the â€œdepartments_dupâ€ table. Let their values in the â€œdept_noâ€ column be â€œd010â€ and â€œd011â€.
Task 2:
Create and fill in the â€˜dept_manager_dupâ€™ table, using the following code:

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
INSERT INTO dept_manager_dup
SELECT * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                (999904, '2017-01-01'),
                            (999905, '2017-01-01'),
                            (999906, '2017-01-01'),
                            (999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHEREdept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUES               ('Public Relations');

DELETE FROM departments_dup
WHERE
    dept_no = 'd002';*/
    
    ALTER TABLE departments_dup
    DROP COLUMN dept_manager;

DROP TABLE IF EXISTS departments_dup;
 CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO departments_dup (dept_no, dept_name)
SELECT * FROM departments;

SELECT * FROM departments_dup;

INSERT INTO departments_dup(dept_name)
VALUES ('public relations');

DELETE FROM departments_dup WHERE dept_no = 'd002';

INSERT INTO departments_dup (dept_no)
VALUES ('d010'), ('d011');

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );

INSERT INTO dept_manager_dup
SELECT * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                (999904, '2017-01-01'),
                            (999905, '2017-01-01'),
                            (999906, '2017-01-01'),
                            (999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 
    
    
    /* INNER JOIN 1
    Using a VENN diagram, a mathematical tool representing all possible logical relations
    btw a finite collection of sets
    What joins the tables are the records common to both tables; 
    the dept_no column called the 'matching values or records'
    The inner join helps us extract the 'result set'
    Syntax
    SELECT table_1.column_name(s), table_2.column_name(s)  # Allows us to specify the columns we will like to see from both tables
    FROM 
    table_1
    join
    table_2 ON table_1.column_name = table_2.column_name; # We use ON to relate the 2 tables with equality sign
    We commonly use ALIASES to shorten the table names eg T1 and T2*/
    
    # INNER JOIN 2
    
    SELECT m.dept_no, m.emp_no, d.dept_name
    FROM dept_manager_dup m
    INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
    ORDER BY m.dept_no;
    
    /* Inner Joins extract only records in which the values in the related columns match
    Null values or values appearing in just one of the 2 tables, and not appearing
    in the other, are not displayed. Only non-null matching values are in play.
    If matchin values did not exist, the result set wil be empty. there'll be no link btw the 2 tables.
    
    Assignment
Extract a list containing information about all managers' employee number,
 first and last name, department number, and hire date.*/
 
 SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
 FROM employees e
 JOIN dept_emp d
 ON e.emp_no = d.emp_no;
 
 # A NOTE ON USING JOINS
  SELECT m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
    FROM dept_manager_dup m
    INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
    ORDER BY m.dept_no;
    
    /* DUPLICATE RECORDS
    Duplicate rows are identical rows in an SQL table. For a pair of duplicate records, 
    the values in eachcolumn coincide. They are not always allowed in a database or data table
    They are sometimes encountered in new, raw, and uncontrolled data*/
    
    INSERT INTO dept_manager_dup
    VALUES('110228', 'd003', '1992-03-21', '9999-01-01');
    
    INSERT INTO departments_dup
    VALUES('d009', 'customer service');
    
    SELECT * FROM dept_manager_dup
    ORDER BY dept_no ASC;
    
   SELECT * FROM departments_dup
    ORDER BY dept_no ASC; 
    
    /* LEFT JOIN 1
    The output allows us to see all records from the left table that match no values from 
    the right table and all matching rows from the 2 tables. The order you match tables in SQL matters*/
    
    # remove the duplicates from the 2 tables
    
    DELETE FROM dept_manager_dup
    WHERE emp_no = '110228';
    
    DELETE FROM departments_dup
    WHERE dept_no = 'd009';
    
    # add back the initial records
    
    INSERT INTO dept_manager_dup
    VALUES('110228', 'd003', '1992-03-21', '9999-01-01');
    
    INSERT INTO departments_dup
    VALUES('d009', 'customer service');
    
    /* LEFT JOIN 1
    The order in which you join tables in SQL matters
    LEFT JOIN and LEFT OUTER JOIN are 2 interchangeable phrases*/
    # EG
    # If we change the order of the table with the departments_dup table on the left and the the 
    # department_manager_dup table on the right, the result will be inverted
    
     SELECT m.dept_no, m.emp_no, d.dept_name
    FROM 
    departments_dup d
    LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
    ORDER BY e.dept_no;
    
    # To get at NULL values in a table to run them, use the WHERE clause EG
    
     SELECT m.dept_no, m.emp_no, d.dept_name
    FROM 
    dept_manager_dup m
    LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
    WHERE dept_name IS NULL
    ORDER BY m.dept_no;
    
   /* Assignment
Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose 
last name is Markovitch. See if the output contains a manager with that name.
Hint: Create an output containing information corresponding to the following fields: "emp_no", 
"first_name", "last_name", "dept_no", "from_date". Order by 'dept_no' descending, and then by 'emp_no'.*/

SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
    FROM
    employees e
    LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
    WHERE last_name = 'Markovitch'
    ORDER BY dept_no DESC;
    
    SELECT m.dept_no, m.emp_no, d.dept_name
    FROM 
    dept_manager_dup m
    LEFT JOIN
    department_dup d ON m.dept_no = d.dept_no
    GROUP BY m.emp_no
    ORDER BY m.dept_no;
    
    
    /* RIGHT JOIN
    When applying a RIGHT JOIN, all the records from the right table will be included in 
    the result set, only matching values from the left table will be included
    Their functionality is identical to LEFT JOINs, with the only diff
    being that the direction of the operation is inverted
    Whether we run a RIGHT JOIN or a LEFT JOIN with an inverted tables order,
    we will obtain the same output.
    RIGHT JOINS are seldom applied in practice
    Matching column = Linking column
    Left and Right joins are typical examples of one-to-many relationships*/
    
    /* THE NEW AND OLD JOIN SYNTAX
    Syntax
    SELECT t1.column_name, t1.column_name,..., t2.column_name
    FROM
    table_1 t1,
    table_2 t2
    WHERE
    t1.column_name = t2.column_name;
    JOIN OR WHERE 
    The retrieved output is identical
    Using where is more time consuming 
    The where Syntax is old and rarely employed by professionals
    The JOIN syntax allows you to modify the connection between tables easily */
    
    SELECT
    m.dept_no, m.emp_no, d.dept_name
    FROM
    dept_manager_dup m,
    departments_dup d
    WHERE
    m.dept_no = d.dept_no
    ORDER BY m.dept_no;
/* Assignment
Extract a list containing information about all managers' employee number, first and last name,
 department number, and hire date. Use the old type of join syntax to obtain the result.*/
 # Assignment
    SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, m.dept_no
    FROM 
    employees e,
    dept_manager_dup m
    WHERE
    e.emp_no = m.emp_no;   


/* JOIN AND WHERE USED TOGETHER
JOIN - Used for connecting the 'employees' and 'salaries' tables
WHERE - Used to define the condition or conditionsthat will determine which 
will be the connecting pionts between the 2 tables
EG
SElect these columns on the condition that salaries is greater than 145000*/

SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM
employees e
JOIN
salaries s ON e.emp_no = s.emp_no
WHERE
s.salary>145000;

/* Assignment
Select the first and last name, the hire date, and the job title of all employees 
whose first name is "Margareta" and have the last name "Markovitch".*/

    SELECT e.first_name, e.last_name, e.hire_date, t.title
    FROM
    employees e,
    titles t
    WHERE first_name = 'Margareta' and last_name = 'Markovitch';
    
    SELECT e.first_name, e.last_name, e.hire_date, t.title
    FROM
    employees e
    JOIN
    titles t ON e.emp_no = t.emp_no
    WHERE first_name = 'Margareta' and last_name = 'Markovitch';
    
    /* CROSS JOIN
    This will take the values from a certain table and connect them with all the values
    from the tables we want to join it with. 
    It connects all the values and not just those that match
    The cartesian product of the values of 2 or more sets
    Particularly useful when the tables in a database are not well connected
    EG
    Get the result set with data containing all the data from the dept_manager 
    and departments table with emp_no and dept_no */
    
    SELECT 
    dm.*, d.*
    FROM 
    dept_manager dm
    CROSS JOIN
    departments d
    ORDER BY dm.emp_no, d.dept_no;
    
    # OR the OLD JOIN syntax
    SELECT 
    dm.*, d.*
    FROM 
    dept_manager dm, # this gives a cross join result without a WHERE clause
    departments d # JOIN without ON not considered best practice, CROSS JOIN is considered best practice
    ORDER BY dm.emp_no, d.dept_no;
    # OR
    
     SELECT 
    dm.*, d.*
    FROM 
    departments d
    CROSS JOIN
    dept_manager dm  # The diff is the no of managers returned
    WHERE 
    d.dept_no <> dm.dept_no
    ORDER BY dm.emp_no, d.dept_no;
    
    # We can cross join more than 2 tables, but be careful since the result
    # might become too big for mysql to execute.
    
    SELECT 
    e.*, d.*
    FROM 
    departments d
    CROSS JOIN
    dept_manager dm  
    JOIN
    employees e ON dm.emp_no = e.emp_no
    WHERE d.dept_no <> dm.dept_no
    ORDER BY dm.emp_no, d.dept_no;
    
  /*  Assignment
Task 1:
Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
Task 2:
Return a list with the first 10 employees with all the departments they can be assigned to.
Hint: Donâ€™t use LIMIT; use a WHERE clause.*/
# Task 1:
SELECT dm.*, d.*
FROM dept_manager dm
CROSS JOIN
departments d 
WHERE d.dept_no ='d009'
ORDER BY dm.dept_no;

# Task 2:
SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no;

    
    /* USING AGGREGATE FUNCTIONS WITH JOINS
    EG
    Find the average salaries of men and women in the coy. 
    Using the aggregate function means that the data must be grouped by
    When using aggregate functions, you cant simply chose any column 'cos
    it might return single values instead of group values eg if we add emp_no the SELECT side,
    it will return the 1st emp_no on both male and female which doesnt represent the group value*/
    
    SELECT 
    e.gender, AVG(s.salary) AS average_salary
    FROM
    employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    GROUP BY gender;
    
    SELECT 
    e.emp_no, e.gender, AVG(s.salary) AS average_salary
    FROM
    employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    GROUP BY gender;
    
    /* Delivering the 1st values is simply how Mysql behaves when it;s asked to 
    extract a single value from a column that groups data.
    It's your job to carefully check the obtained output for a meaningful explanation*/
    
    /* JOIN MORE THAN TWO TABLES IN SQL
    When creating a query that joins multiple tables, you must back it with strong intuition
    and a crystal-clear idea of how you would want the tables to be connected. 
    To join tables, refer to the relational schema to check what columns belong to what tables
    in order to achieve a meaningful JOIN. From our example, we 1st JOIN the employess to the dept_manager 
    table and then the departments table.*/
    
    SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
    FROM 
    employees e
    JOIN 
    dept_manager m ON e.emp_no = m.emp_no
    JOIN
    departments d ON m.dept_no = d.dept_no;
    
    # Let's connect the tables to the departments dept_no and to the employee emp_no columns
    SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
    FROM 
    departments d
    JOIN 
    dept_manager m ON d.dept_no = m.dept_no
    JOIN
    employees e ON m.emp_no = e.emp_no;
    
   /* Assignment
Select all managers' first and last name, hire date, job title, start date, and department name.*/

SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
    FROM 
    employees e
    JOIN 
    titles t ON e.emp -no = d.emp_no
    JOIN
    employees e ON m.emp_no = e.emp_no;

/* TIPS AND TRICKS FOR JOINS
EG To JOIN dept_name and average salary looks easy but complicated from the relational schema
The above belong to the salary and depts tables which do not have a direct relationship, we'll rather
JOINS - One shld look for key columns, which are common btw the tables involved in the analysis and 
are neccessary to solve the task at hand. These columns do not need to be foreign or private keys
From our illustration, Join the departments table of dept_no to dept_mger dept_no, then salaries emp_no to
dept_mger emp_no.*/

SELECT 
d.dept_name, AVG(salary)
FROM
departments d
JOIN
dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no # It returned one row. if you forget to group by dept_name  mysql will deliver only 1 row
GROUP BY d.dept_name
ORDER BY AVG(salary) DESC;

/*Assignment
How many male and how many female managers do we have in the "employees" database?*/

# Soln without COUNT:
SELECT 
    e.gender, dm.emp_no
    FROM
    employees e
    JOIN dept_manager dm ON e.emp_no = dm.emp_no
    ORDER BY gender;
    
    # Correct Soln with COUNT
    SELECT e.gender, COUNT(gender)
    FROM employees e
    JOIN dept_manager dm on e.emp_no = dm.emp_no
    GROUP BY gender
    ORDER by gender;

/* UNION VS UNION ALL
Here we'll use the small department manager table and another table with only 20 records ie employees_dup table

Create employees_dup table*/

DROP TABLE IF EXISTS employees_dup;

CREATE TABLE employees_dup(
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M', 'F'),
hire_date date);

# Duplicate the structure of the 'employees' table
INSERT INTO employees_dup
SELECT
e.*
FROM 
employees e
LIMIT 20;

# check 
SELECT 
    *
FROM
    employees_dup;
    
    # Insert a duplicate of the 1st row
    INSERT INTO employees_dup VALUES
    ('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'); # We now have 21 rows of 2 duplicate rows
    
    # check 
    SELECT 
    *
FROM
    employees_dup;
    
    /* The SQL UNION ALL operator is used to combine a few SELECT statements in a single output
    You can think of it as a tool that allows you to unify tables
    The Syntax is;*/
    
    SELECT 
    N columns  # We have to select the same no of columns from each table
FROM			# These columns shld have the same name, shld be in the same order,
    table_1 	# and shld contain related data types
UNION ALL SELECT 
    N columns
FROM
    table_2;
    
    # Union Vs Union All
    SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
    FROM
    employees_dup e
    WHERE
    e.emp_no = 10001
    UNION ALL SELECT
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
    FROM
    dept_manager m;
    
    # UNION
    SELECT 
    N columns  # We have to select the same no of columns from each table
FROM			# These columns shld have the same name, shld be in the same order,
    table_1 	# and shld contain related data types
UNION SELECT 
    N columns
FROM
    table_2;
    
    SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
    FROM
    employees_dup e
    WHERE
    e.emp_no = 10001
    UNION SELECT
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
    FROM
    dept_manager m;
    
    /* When uniting 2 identically organised tables, UNION displays only
    distinct values in the output. UNION uses more Mysql resources( computational power and storage space)
    UNION ALL retrieves the duplicates as well. If you are looking for better results, remove duplicates and use UNION
    If you are looking to optimize performance, use UNION all.
    
 # SQL SUBQUERIES:   
 
 /* SQL SUBQUERIES WITH IN NESTED INSIDE WHERE
 Sub queries = Inner queries = Nested queries = Inner select
 They are queries embedded in a query
 They are part of another query, called an outer query or outer select. 
 Sometimes it's employed in a WHERE clause of a select stmt. 
 EG:*/
 
 SELECT * FROM dept_manager;
 # Select the first and last name from the employees table for the same
 # employee numbers that can be found in the 'Department Manager' table
 
 SELECT e.first_name, e.last_name
 FROM 
 employees e
 WHERE e.emp_no IN (SELECT dm.emp_no FROM dept_manager dm);
 
 SELECT dm.emp_no FROM dept_manager dm;
 
 /* The SQL engine starts by running the inner query
 Then it uses its returned output, which is intermediate, to execute the outer query
 Generally, a Subquery may return a single value(a scaler), a single row,
 a single column, or an entire table. You can have a lot more than one subquery in your outer query
 It is possible to nest inner queries within other inner queries.
 In that case,the SQL engine would execute the innermost query 1st, and then each subsequent query,
 until it runs the outermost query last.
 
 # A subquery shld always be placed within parentheses.
 
/* Assignment
Extract the information about all department managers who were hired between 
the 1st of January 1990 and the 1st of January 1995.*/

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            # SQL SUBQUERIES WITH EXISTS-NOT EXISTS NESTED INSIDE WHERE
            
            /* Another logical operator is the EXISTS operator checks whether certain row
            values are found within a subquery. This check is conducted row by row. It returns a boolean value
            If a row value of a subquery exists, it returns TRUE and 
            the corresponding record of the outer query is extracted. 
            If a row value of a subquery doesnt exist, it returns FALSE and no row value from the outer query
            will be extracted 
            It creates a whole table and not just columns*/
            
            SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);
 /*  Here it will deliver all first and last name of the pple in the employees table and are also 
  found in the dept_manager table. Here, we create a whole table not just a column as in the IN operator.
  EXISTS: 1. Tests row values for existence. 2. Quicker in retrieving large amts of data
  IN: 1. Searches among values. 2. Faster with smaller datasets.
  Some, though not all , nested queries can be rewritten using joins, which are more efficient in general.
  This is true for inner queries using the where clause
  
  SUBQUERIES:
  - Allow for better structuring of the outer query
  - Thus, each inner query can be thought of in isolation
  - Hence, the name of SQL - Structured query Language
  In some situations, the use of subqueries is much more intuitive compared to the 
  use of complex joins and unions.
  Many users prefer subqueries simply because they offer enhanced code readability*/
 
  /* Assignment
Select the entire information for all employees whose job title is "Assistant Engineer".
Hint: To solve this exercise, use the 'employees' table.*/


            SELECT * FROM 
            employees e
            WHERE 
            EXISTS(select * from titles t
            where
            t.emp_no = e.emp_no
            and title = "assistant Engineer");
            
            Select e.*, t.title 
from
employees e,
titles t
where e.emp_no = t.emp_no and 
Exists(select * from titles  
where t.emp_no = e.emp_no
and t.title = "Assistant Engineer");

-- Or
Select e.*, t.title 
from
employees e,
titles t
where e.emp_no = t.emp_no and 
Exists(select * from titles  
where t.title = "Assistant Engineer");

Or
Select e.*, t.title 
from
employees e,
titles t
where e.emp_no = t.emp_no and 
Exists(select * from titles  
where t.title = "Assistant Engineer");

select e.*, t.title from employees e
        join titles t on e.emp_no = t.emp_no
        where title = 'Assistant Engineer';    # Using A JOIN
            
            # SQL SUBQUERIES NESTED IN SELECT AND FROM
            
            /* Assign employee number 110022 as a manager to all employees from 10001 to 10020, and employee number
            110039 as a manager to all employees from 10021 to 10040.*/
            
            SELECT A.* FROM
            (SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_ID
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A
UNION
SELECT B.* FROM
            (SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110039) AS manager_ID
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no > 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS B;

# Assignment
/*Task 1:
Starting your code with â€œDROP TABLEâ€, create a table called â€œemp_managerâ€ (emp_no â€“ integer of 11, 
not null; dept_no â€“ CHAR of 4, null; manager_no â€“ integer of 11, not null).
Task 2:
Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
Your query skeleton must be:
Insert INTO emp_manager SELECT
U.*
FROM
(A)UNION (B) UNION (C) UNION (D) AS U;
A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). 
In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), 
and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.
Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.
Your output must contain 42 rows.*/


Drop table if exists emp_manager;

CREATE TABLE emp_manager (

    emp_no INT(11) Not Null,

    dept_no char(4) Null,

   manager_no int(11) Not Null);

 

Insert into emp_manager
SELECT u.* FROM

(SELECT a.* FROM

(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
           
(SELECT emp_no FROM dept_manager
WHERE emp_no = 110022) AS manager_ID
   
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS a
   
UNION SELECT b.* FROM

(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no FROM dept_manager
WHERE emp_no = 110039) AS manager_ID
   
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no > 110020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b
   
UNION SELECT  c.* FROM
(SELECT e.emp_no AS employee_ID,MIN(de.dept_no) AS department_code,
(SELECT emp_no FROM dept_manager
WHERE emp_no = 110039) AS manager_ID

FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no = 110022
GROUP BY e.emp_no) AS c
   
UNION SELECT  d.* FROM
(SELECT e.emp_no AS employee_ID, MIN(de.dept_no) AS department_code,
(SELECT emp_no FROM dept_manager WHERE emp_no = 110022) AS manager_ID
   
FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no = 110039
GROUP BY e.emp_no) AS d) as u;


# SQL SELF JOIN
/* This applied when a table must join itself. 
If you'd like to combine certain rows of a table with other rows of the same table, you need a self join
In a SELF JOIN stmt, you'll have to comply with the same logical and syntactic structure as INNER JOIN.
However, the 2 tables will be identical to the table you'll be using in the SELF-JOIN.
You can think of them as virtual projections of the underlying base table.
The self join will reference both implied tables and treat them as 2 seperate tables in its operations.
The data uesd will come from a single source, which is the underlying table that stores data physically.
Using Aliasses in SELF join is obligatory eg e1, e2.
These references to the original table let you use difft blocks of the available data. You can either 
filter both in the JOIN, or you can filter one of them in the WHERE clause, and the other one in the JOIN.*/

# Task
# From the emp_manager table, extract the record data only of those employees who are managers as well

SELECT 
    *
FROM
    emp_manager
ORDER BY emp_manager.emp_no;

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
    SELECT e1.emp_no, e1.dept_no, e2.manager_no
    FROM 
    emp_manager e1
    JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
    SELECT * FROM emp_manager ORDER BY emp_manager.emp_no;
    
    SELECT e1.* FROM emp_manager e1 JOIN emp_manager e2 ON e1.emp_no = e2.manager_no
    WHERE e2.emp_no IN (SELECT manager_no FROM emp_manager);
    
    SELECT manager_no FROM emp_manager;
    
    SELECT DISTINCT 
   e1. *
FROM
    emp_manager e1 
    JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;

   SELECT 
   e1. *
FROM
    emp_manager e1 
    JOIN emp_manager e2 ON e1.emp_no = e2.manager_no
    WHERE e2.emp_no IN (SELECT manager_no FROM emp_manager);
    
    # Extracting the inner join
    SELECT manager_no FROM emp_manager;