Use employees;

/* MySQL AGGREGATE FUNCTIONS
They gather data from many rows of a table, and aggregte it into a single value
The INPUT is the info contained in multiple rows while the OUTPUT is the Single value provided
They are also called summarized functions
Why these Functions?
They are a response to info reqts of a coy's difft orgnal levels
Top mgt executives are interested in summerised figs and rarely in details*/

/* COUNT()
Returns the number of data contained in a database
it is applicable to both numeric and non-numeric data*/
# on the salary table we can use count and count distinct

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC  # returns the columns in the salaries table
LIMIT 10;

SELECT 
    COUNT(salary)  # returns the total number of pple that receive salary
FROM
    salaries;
    
    # How many employee start dates are in the database?
    # you can use count from_date
    
    SELECT 
    COUNT(from_date)
FROM
    salaries;
    
    # COUNT DISTINCT
    # Finds the number of times unique values are encountered in a given column
    
     SELECT 
    COUNT(DISTINCT from_date)  # shows number of contracts signed at difft dates
FROM
    salaries;
    
    # Aggregate functions ignore NULL values except a specific column name is in parenthesis is indicated
    
    # Alternatively, COUNT(*) returns the number of rows of the table, NULL values included
    
    SELECT 
    COUNT(*)
FROM
    salaries;
    # The parenthesis and the argument must be attached to the name of the aggregate function
    # No space b4 the parenthesis
/*using the salary table,instead of checking the ddl statement we can use select _table 
to achieve a brief team roll output that  will show us that we have information on the
emmp_no,salary,from_date_to_date of the employee.*/  
    
# SUM()
# Sum all the salaries paid by the firm. if you use * ie select sum(*) from salary it will give an error mssg
 SELECT 
    SUM(salary)
FROM
    salaries;
    # COUNT(*) returns all rows of the table. NULL values included
    # but does not work with other aggregate functions
    # Apart from COUNT, all other aggregate functions work with only numeric data

# MIN() and MAX()
# They return the Minimum and Maximum value of a column
# Which is the highest salary we offer?
SELECT 
    MAX(salary)
FROM
    salaries;
# Which is the lowest?
SELECT 
    MIN(salary)
FROM
    salaries;
/*Assignment
1. Which is the lowest employee number in the database?
2. Which is the highest employee number in the database?*/

SELECT 
    MIN(emp_no)
FROM
    employees;

SELECT 
    MAX(emp_no)
FROM
    employees;

# AVG()
# Extracts the average values of all non-NULL values in a field
# Note, use AVG and not average else your query will not run
# Which is the average annual salary the coy's employees received?

SELECT 
    AVG(salary)
FROM
    salaries;
    
    /* Aggregate functions can be applied to any group of data values within a certain column
    that is why it's frequently used with the GROUP BY clause
    Assignment

What is the average annual salary paid to employees who started after the 1st of January 1997?*/
    
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

/* ROUND() 

ROUND(#, decimal_places) Numeric , or math, function you can use. Usually applied to the 
single values that aggregate functions return. The syntax is ROUND(#) which must be a numeric value 
it can be located anywhere in the query as long as there is a numeric value within the parenthesis precisely.*/

SELECT 
    ROUND(AVG(salary), 2) # rounds to the number of decimal points specified (decimal_places eg. 2 dec.places)
FROM
    salaries;
    
    SELECT 
    ROUND(AVG(salary)) # rounds to the closest integer
FROM
    salaries;
    
/*Assignment
Round the average amount of money spent on salaries for all contracts that started 
after the 1st of January 1997 to a precision of cents.*/   
 
SELECT
ROUND(AVG(salary))
FROM 
salaries
WHERE
from_date > '1997-01-01';
    
    /* COALESCE() - PREAMBLE */
 /*IF NULL and COALESCE are among the advanced sql func. in the toolkit of sql professionals.
 They are used when null values are dispersed in your data table and you would like to 
 substitute the NULL values with another value. So let us adjust the 'Department'duplicate 
 table in a way that suits th purposeof our next video, we will work with  IF NULL() and COALESCE()*/
 
 /* Note, department_name field is  with a NOT NULL constraint.It means we must insert a value in each
 of the its rows.With the ALTER table statement and the CHANGE COLUMN command, we will modify this 
 constraint and allow null value to be registered in the 'department name' column, ALTER TABLE department_dup
 CHANGE column dept_name dept_name
 VARCHAR (40) NULL;*/
 
 /* Right after the insert into the department number column of this table, a couple of data values D-10, D-11,
 the numbers of the next two potential depts in the 'Department Duplicate' INSERT INTO department_dup(dept_no) 
 values('d010' NULL),('d011' NULL); (run the query) select*from departments_dup ORDER BY dept_no ASC;
 Hence, we have two new department numbers listed and in the department name column we will see two NULL values(d010,d011)
 Workbench will indicate that avvalue in a cell is missing by attaching a 'NULL'label to it.*/
 
 /* The next adjustment is adding a third column called 'Department Manager'It will indicate the manager of the
 respective departments,we will leave it empty for now and add the NULL constraint.Finally, we will place 
 it next to the 'Department name'column by typing AFTER 'Department name' The syntax, ALTER TABLE employees.departments_dup
 ADD column dept_manager VARCHAR(255) NULL AFTER dept_name;
 Ater this we can use the syntax below to check the state of the 'Department_dup, SELECT * FROM departments_dup ORDER BY dept_no ASC;*/
 
 /* The third column is empty we have dept_no, dept_name and dept_manager and we have NULL values in the last two records.
 They are the dept_name and manager fields.To save the 'Departments duplicate table in its current state execute a commit statement
 COMMIT; */
 
    
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


/* IFNUL() and COALESCE

IFNULL (Expression_1, Expression_2)
IFNULL returns the 1st of the 2 indicated values if the data value found in the table is not null,
 and returns the 2nd value if there is a null value and it prints the returned value in the column 
 of the output. It has its own limitation: It cannot contain more than 2 parameters.
 They do not make any changes to the data set, they merely create an output where certain data values
 appear in place of NULL values*/
 
 # When you want to change is null to department name not provided, you will use IF NULL function to achieve it
SELECT 
    dept_no, IFNULL(dept_name, 'Department name not provided')
FROM
    departments_dup;

SELECT 
    dept_no, IFNULL(dept_name, 'Department name not provided') as dept_name
FROM
    departments_dup; 
    
    /* IFNULL has its own limitation: It cannot contain
 more than 2 parameters, That is where COALESCE comes in. 
 
 COALESCE: 
 COALESCE (Expression_1, Expression_2 ....Expression_n)
 Allows you to insert N arguments in the parentheses. It is IF NULL with more than 2 parameters
 It will always return a single value of the ones we have within parentheses, 
 and it will be the 1st non-null value of this list, reading the values from left to right
 If it has 2 expressions, it will work exactly like IF NULL*/
 
    
    SELECT 
    dept_no, COALESCE(dept_name, 'Department name not provided') as dept_name
FROM
    departments_dup;
    
    SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

# Coalesce with 3 arguments

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC;

 /* Note; IF NULL and COALESCE do not make changes to the dataset.
They merely create an output where certain data values appear in place of NULL values*/
        
		
        /* Another way of using COALESCE
We can have a single argument in a given function, the value used as an arguement will be displayed.
It can help you visualise a prototype of the table's final version
Professionals prefers to work with coalesce as it takes more than 2 arguements but in null is max of 2*/
        
        
        
SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM
    departments_dup;
    
   # EXERCISE 
    
/*Task 1:
Select the department number and name from the â€˜departments_dupâ€™ table and add a third column 
where you name the department number (â€˜dept_noâ€™) as â€˜dept_infoâ€™. If â€˜dept_noâ€™ 
does not have a value, use â€˜dept_nameâ€™.
Task 2:
Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() 
function to the values from the first and second column, so that â€˜N/Aâ€™ is 
displayed whenever a department number has no value, and â€˜Department name not providedâ€™ 
is shown if there is no value for â€˜dept_nameâ€™.*/

#SOLUTION NOT DONE YET

