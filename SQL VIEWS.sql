USE employees;

# WK 5 DAY 2
# USING SQL VIEWS:

/* A VIEW is a VIRTUAL table whose contents are obtained from an existing table or tables called BASE TABLES. 
The retrieval happens through an SQL stmt, incorporated into the view.
- Think of a view object as a view into the base table.
- The view itself does not contain any real data; the data is physically stored in the base table.
- It simply shows the data contained in the base table. 
EG
Using the dept_emp table that contains emp_no, dept_no and from_date, and end  to_date of their contract,
Let's consider the dept each employee works and their date dates of empt */
/* Result analysis;
select* from employees; We saw more than 331603 enteries,this is cos some emp_nos has been inserte more
 than once ,this is cos a new entry about the employee is been recorded every time the employee changes
 department, hence ,it results in more than one start and end date for such employeem to verify this claim
 we can run a query to show the emp-nos of people registered in the dept employees table more than once
 see query below*/


SELECT * FROM dept_emp;

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS NUM
FROM
    dept_emp
GROUP BY emp_no
HAVING NUM > 1;

# Some employee nos are inserted more than once, to retrieve the data of employees whose emp_no appear 
# more than once due to change of dept

/* why do we need a VIEW in this case, imagine you want to see a tabular output with a number of each
 employee shown only once having inside their letter start and ending date, in other words you would 
 like to visualize only the period encompassing the last contract of each employee,
 
 the syntax to use is
 CREATE VIEW view name AS  
 It create or replace,asign view with  a name starting with V_ OR W_ to indicate the object
 is a view eg. dept_emp latest_date,dont forget to add the AS keyword b/4 exposing the final 
 part of the query which is a SELECT statement.
 
 SELECT
 The select statement will extract data from the base table that ll'populate the view)
 we will run the select statement seperately to obtain the data our view delivers every 
 time is being implemented.
 
 column_1,column_2....column_n (asign view with V_ OR W_ to indicate the object is a view)
 FROM
 table_name*/
 
 CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
 SELECT
 emp_no,MAX(from_date)AS from_date,MAX(to_date) AS to_date
 FROM
 dept_emp
 GROUP BY emp_no;
 
 
 /* run the query, look at the schema at the side u ll'see view the first icon provides 
 information about it, the last excutes the select statement enbedded in the view 
 delivering the desired results*/
 
 
SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS NUM
FROM
    dept_emp
GROUP BY emp_no
HAVING NUM > 1;

/* To see the number of each employee showing only once, You visualise the period encompassing the 
 the period encompassing the last contract of each employee,
 THe Syntax is,
CREATE VIEW view_name AS
SELECT 
column_1, column_2, ....column_n
FROM 
table_name; */

# We assign views using V_ or W_
# The query bellow creates our view

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT 
emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM
dept_emp
GROUP BY emp_no;
# Get the output from the schemas side from the views from the 3rd square box of the 3 right bottons


# If we run the select Stmt side seperately, we obtain the result that will populate our view each time it's run
SELECT 
emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM
dept_emp
GROUP BY emp_no;

/*  A view acts as a shortcut for writing the same SELECT stmt every time a new
request has been made
- It saves a lot of coding time
- Because it's written only once, it occupies no extra memory
- It acts as a dynamic table because it instantly reflects and structural changes
in the base table
- They are advantageous when used logically
- Don't forget they are not real physical data sets, meaning we cannot insert or update 
the info that has already been extracted. 
- They should be seen as temporary virtual data tables retrieving info from base tables.

Assignment
Create a view that will extract the average salary of all managers registered in the database. 
Round this value to the nearest cent. If you have worked correctly, after executing the view from 
the â€œSchemasâ€ section in Workbench, you should obtain the value of 66924.27.*/


CREATE OR REPLACE VIEW v_dept_manager_salary AS
SELECT 
dm.emp_no, ROUND(AVG(salary), 2)
FROM
salaries s
JOIN dept_manager dm ON dm.emp_no = s.emp_no; 

