# SQL SELECT STATEMENT (data manipulation tools)WEEK 4 DAY 4.

# SELECT ...FROM
/*Select from allows us to retrieve data from database objects like tables .It is used to querry data from a data base.
it allows you to extract a fraction of the entire data set
# the basic select statement syntax is SELECT column_1, column_2,..column n
# FROM table_name;
# when extracting information select goes with FROM for instance the employee table contains 6 tables in the database
(namely, department, dept_emp, dept_manager, employees,salaries, titles.)we can also expand the employees section and 
see that the column section contains 6 columns.Assumming you are interested in exploring the names of all the employees */


SELECT first_name, last_name
FROM employee;
 # using beautify CTRL + B
 
 SELECT 
    *
FROM
    employees;
    
    
/* Assumming you are interested in exploring the names of all the employees ,
the syntax to use is 
# SELECT column_1, column_2,..column n 
FROM table_name;
SELECT first_name , last_name
FROM employees;
this will be the querry that will return the entire first and last name from the employees table , now lets run the code.*/

SELECT 
    first_name, last_name
FROM
    employees;
    
    
# Another way to select our code is using the wild card character which means all and everything.* SELECT * FROM employees;

SELECT 
*
FROM 
employees;

# EXERCISE
/* Select the information from the "dept_no" column of the "departments" table.
Select all data from the "departments" table.*/

Use employees;


SELECT 
    dept_no
FROM
    departments;
    
    SELECT 
    *
FROM
    departments;
 # THE WHERE CLAUSE (adding a where clause to the select statement)
 
 # It allows us to set a codition upon  which we will specify what part of the data we would like to remove from the database. like we learnt before select allows you to retrieve entire data from table of interest.
 # eg.SELECT * FROM employees or we can use select with the column name to designate which column from this table you would like to see displayed eg. SELECT column_1, column_2, ... column..n 
 # FROM table_name;
 # WHERE condition ; (specify a condition) eg. a verification that a certain information is available, a check or a mathematical expression
 
 # WHERE 
 # First_name = 'Denis';( pls dont forget to add single or double quote to Denis else your query will not work. 
 # The = sign reps the fact that the selection of the data is based on the condition that the individual name is Denis.
 
# study example
    
  SELECT 
    *
FROM
    employees;
WHERE 

  first_name = 'Dennis'
 

 # EXERCISE 
 /*Select all people from the "employees" table whose first name is "Elvis"*/

SELECT
    *
FROM
    employees;
    
WHERE
    first_name = 'Elvis'
    
 # ADD (= EQUAL OPERATOR )
/* In SQL, there are many other linking keywords  and symbols called operators, that you can use with the WHERE clause.
 AND , OR, IN -NOT LIKE, BETWEEN -AND, COMPARISON OPERATORS ETC.
 The ADD operator allows you to logically combine two statements in the condition code block
 eg,when you want to retieve information on the employees whose name is  Dennis and who are male, the syntax to use is 
 SELECT column_1 column ...n,; from table_name , where condition 1 and 2 .., the first condition name denis, second condition male. 
 The 'AND' operator allows us to narrow the output we would like to extract from our data.
 
 WHERE 
 first_name = 'Dennis' AND gender = 'M';  this is because not all staff called denis will be male*/
 
 # EXAMPLE
 
 SELECT
	* 
 FROM 
		employees;
 
      first_name ='Denis' AND gender = 'M';
 
 # EXERCISE ON ADD 
 /* Retrieve a list with all female employees whose first name is Kellie.*/
 
 SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
   # THE OR OPERATOR
  /* We use OR on conditions set on the same column but AND is used on conditions set on different columns.
   AND binds SQL to meet both conditions enlisted in the WHERE simultaneously.(WHERE first_name = 'Denis' or first_name ='Elvis') */
    
    SELECT 
    *
FROM
    employees
WHERE
   
 first_name = 'Denis' OR first_name = 'Elvis';   
 
 # OPERATOR PRECEDENCE
 /* This is an SQL rule stating that in the execution of the querry ,the operate AND is applied first while the operator OR is applied second.
 AND > OR regardless of the order in which you use .these operators,SQL will always start by reading the conditions around the AND OPERATOR 
 (always try to cross check your results). parenthesis () can help u re order the logic within the operation.also note that if you do not put the gender in parenthesis the code will also run but the result may not be exactly what we want.*/

  SELECT 
    *
FROM
    employees
WHERE
   
 last_name = 'Denis' AND (gender = 'M' OR gender = 'F');
 
# EXERCISE
# Retrieve a list with all female employees whose first name is either Kellie or Aruna.

 SELECT 
    *
FROM
    employees
WHERE
   
 first_name = 'Kellie'  OR 'Aruna';
 
 # IN -NOT IN 
 /* The IN operator allows SQL to retun the names written in parenthesis, if they exist in our table. When many conditions are to be applied in a query the IN operator will be preferred.for instance you want to extract data for 3 person whose names are either catty, martin or nathan. here we are looking at meeting up with 3 conditions.To solve this you can use select statement and the where clause or seperate it by the OR operator.*/
 # see example below
 
 SELECT 
    *
FROM
    employees
WHERE
   
 first_name = 'Cathie' 
 OR First_name = 'Mark'
 OR first_name = 'Nathan';
 
 # Nevetheless, there is a more quicker way to do it. here you need the IN operator.
 
 SELECT 
    *
FROM
    employees
WHERE
   
	first_name IN ('Cathie','Mark','Nathan');
    
    # note the second way was quicker and is preferred by sql professionals, overall, when many conditions are applied in a query the IN operator is preferred.
 # NOT IN OPERATOR
 # In this case ,every name order than Cathie,Mark and Nathan will be displayed
 
SELECT 
    *
FROM
    employees
WHERE
   
	first_name NOT IN ('Cathie','Mark','Nathan');
    
  # EXERCISE  
   /*Task 1,Use the IN operator to select all individuals from the â€œemployeesâ€ table, whose first name is either 
â€œDenisâ€, or â€œElvisâ€.
Task 2:
Extract all records from the â€˜employeesâ€™ table, aside from those with employees named John, Mark, or Jacob.*/

   SELECT 
    *
FROM
    employees
WHERE
   
	first_name IN ('Dennis','Elvis'); 
    
    # Task 2
    
     SELECT 
    *
FROM
    employees
WHERE
   
	first_name NOT IN ('John','mark','Jacob');
    
    # LIKE NOT -LIKE
    /* .Imagine you like to fetch from employees table, all people whose first names begins with 'Mar'Such names are Mark, Martin, Margaret etc. 
    To obtain the desired output,you must as usual use the WHERE clause, first_name ,then like in parenthesis() and apply a techinique called patern matching. The % sign is used to indicate that pattern. Here is how to put your query,
    WHERE fisrt_name LIKE ('Mar' %) you write 'Mar' where first_name NOT LIKE ('Mar').It is called pattern matching %.it is used when you need a pattern in your code.% sign is a substitute for a sequence of character.% sign is a substitute for a sequence of character.
    it reps 0 or more letters that subsides those that comes before it. What happens when we put the % before 'ar',('% ar') if we do this all the name ending with 'ar' will appear.Note that my sql is not case sensitive
    Sometimes you dont need to look for a specific pattern in a column. Another pattern you can use is  _underscore, this helps you to match a single character while  % is used to substitute a sequence of characters */
    
    
      SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE ('Mar%');
   
   # if we remove the letter 'M' we wil retrieve of all name starting with 'ar'
SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE ('ar%');
   
 # when we put % sign before 'ar' all names ending with 'ae' appears.
 
   SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE ('%ar');
   
   # we can use two % around designated letters. when we do that we will retrive names that have 'ar' somewhere in the indidual,s first name.
   
    SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE ('%ar%');
# if you like to fetch all names written with 'Mar'and written with 4 letters ,use ('Mar_');

SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE ('Mar_');
   
   # NOT LIKE
   # IT Carries out the exact opposite operation.
   SELECT 
    *
FROM
    employees
WHERE
   first_name NOT LIKE ('Mar_');
   
   # EXERCISE
   
  /* Working with the "employees" table, use the LIKE operator to select the data about all individuals, whose first name starts with "Mark"; specify that the name can be succeeded by any sequence of characters.
Retrieve a list with all employees who have been hired in the year 2000.
Retrieve a list with all employees whose employee number is written with 5 characters, and starts with "1000".*/

# SOLUTION 1, by any sequence of character means?
   SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE ('MarK%');
   
  # TASK 2 
      SELECT 
    *
FROM
    employees
WHERE
   hire_date LIKE ('2000%');
   
   # TASK 3
SELECT 
    *
FROM
    employees
WHERE
   emp_no LIKE ('1000_');
   
   
    # WILD CHARACTER ( % , _ , * )
    
   /* You need a wild card character when you want to put anything on its place. eg. taking a wild guess. % sign is used as substitute for a sequence of characters.
    .LIKE('Mar' %) Mark, Martin, Margaret. The _ underscore helps you to march a single character,it provides a potential outcome widely. LIKE('Mar_') Mark, MarV, Mar).
    The % sign and  _ underscore  are used for string values.(%,_) The * symbol will deliver a list of all columns in a table SELECT * FROM employees;
    it can also be used to count all rows on a table.*/
    
    # EXERCISE
    /*Extract all individuals from the "employees" table whose first name contains "Jack".
Once you have done that, extract another list containing the names of employees that do not contain "Jack".*/

    # TASK 1 not done yet
    
SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE ('Jack %');
   
   # TASK 2 
   
   SELECT 
    *
FROM
    employees
WHERE
   first_name NOT LIKE ('Jack %');
   
    # BETWEEN ...AND
    /*It helps us to designate the inteval to which a given value belongs, thats why it is always used in combination with the AND operator. 
    If you want to obtain a list of people hired btw 1st of Jan('1990-01-01') AND ('2001-01-01'), use 'BETWEEN AND operator. note, 
    both values will be included in the retrieved list of records*/
    
SELECT 
    *
FROM
    employees
WHERE
   hire_date BETWEEN '1990-01-01'AND '2000-01-01';
   
   # NOT BETWEEN AND
 /*  This refers to intervals composed of two parts; ,an interval below the first value indicated a second interval above the second value. 
 the syntax to use SELECT *FROM employees WHERE hire_date is NOT BETWEEN THE '1990-01-01' AND '2000-01-01'; or  the hire_date is after '2000-01-01'
 (Note, '1990-01-01' AND '2000-01-01' are not included in the intervals.Finally, BETWEEN...AND  is not used for only date values , 
 it could also be applie to strings and numbers.*/
 
  # EXAMPLE ( not done)
  
  SELECT 
    *
FROM
    employees
WHERE
   hire_date NOT BETWEEN '1990-01-01'AND '2000-01-01';
   
   # EXERCISE
   
  /* Select all the information from the "salaries" table regarding contracts from 66,000 to 70,000 dollars per year.
Retrieve a list with all individuals whose employee number is not between "10004" and "10012".
Select the names of all departments with numbers between "d003" and "d006".*/

# TASK 1

SELECT 
    *
FROM
    salaries
WHERE
   salary_from_date BETWEEN '66000'AND '70000';
   
   # TASK 2.
   SELECT 
    *
FROM
    employees
WHERE
   emp_no NOT BETWEEN '10004'AND '10012';
   
   # TASK 3
   SELECT 
    *
FROM
    departments
WHERE
   dept_no  BETWEEN 'd003'AND 'd006';
   
   # IS NOT NULL - IS NULL
   /* It is used to extract values that are NOT NULL. the syntax is intuitive, SELECT column_1,column_2, ...column_n
   from table _name where column name is NOT NULL, For eg if you are to reteieve records of all employees whose first_name are not null
   or return a list in which the values of the first name columns are not missing.*/
   
   SELECT 
    *
FROM
    employees
WHERE
   first_name is NOT NULL;
   
   # IS NULL will give an empty output

   SELECT 
    *
FROM
    employees
WHERE
first_name IS NULL;

# OTHER COMPARISON OPERATORS.
/* These are derived from mathematics, ;SQL,  = (equal to),> (greater than) , < (lee than), >=(greater than or qeual to, < = (less than or qual to), 
NOT QUAL OPERATORS IN SQL;  <>, != (not equal, different from), To use it ,you must attach the angle bracket or exclamation mark.
How to apply it in SQL*/

SELECT 
    *
FROM
    employees
WHERE
first_name = 'Mark';

# to do the opposite ie names in the list other than mark
  SELECT 
    *
FROM
    employees
WHERE
first_name <> 'Mark';

# We can obtain same result using !=  (exclamation mark and equal sign is used also to indicate iniquality) 

SELECT 
    *
FROM
    employees
WHERE
first_name != 'Mark';

/* suppose your boss told you to produce a list of people hired after the 1st of January, 2000. Note you need to specify you are interested in a hire_date.(after '2000' can be reps by the > greater than sign)
 see result below. */

SELECT 
    *
FROM
    employees
WHERE
hire_date > '2000-01-01';

# Note that the year '2000-01-01' was excluded from the result if you must include it,you need to use the greater than or equal to sign >=*/

SELECT 
    *
FROM
    employees
WHERE
hire_date >= '2000-01-01';


# To avoid obtaining a large amount of data, lets check if someone was employed before the '1st of feb 1985' 
 # use hire_date <= '1985-02-01'

SELECT 
    *
FROM
    employees
WHERE
hire_date <'1985-02-01';

# note 1985-02-01 will be omitted to retrieve it use <= comparison operator less than or equal to sign ie hire_date <= '1985-02-01' and it will be included.

# EXERCISE

/* Retrieve a list with data about all female employees who were hired in the year 2000 or after.
Hint: If you solve the task correctly, SQL should return 7 rows.
Extract a list with all employees' salaries higher than $150,000 per annum.*/

#TASK 1 cross check pls

SELECT 
    *
FROM
    employees
WHERE 
gender = 'F'
AND hire_date >='2000 -01 -01';

# TASK 2

SELECT 
    *
FROM
    salaries
WHERE
    salary >'150000';
    
    # SELECT DISTINCT
    
/* The select statement can retrieve rows from a designated column given some criteria .what if there are duplicate values given in this field,
the selct statement works in retrieving duplicate values and hence it will extract them all. look at this example, we will obtin the information we have in the gender table(gender ENUM'M', 'F')
 the list is long so we will need to reduce it to maybe 1000'*/
        
SELECT
	gender 
FROM 
	employees;
    
 /* How can you retrieve a list that contains both genders but contains no duplicate values. in such a situation the statement used is not simply select but SELECT DISTINCT,
 The syntax to use is SELECT DINSINCT column_1, column_2, ... column_n  FROM table_name; it wil show all distinct values in one roll,ie one for 'F' and one for 'M'(2 rows in total).*/
 
 SELECT DISTINCT
	gender 
FROM 
	employees;

# EXERCISE

/* Obtain a list with all different "hire dates" from the "employees" table.
Expand this list and click on "Limit to 1000 rows". This way you will set the limit of output rows displayed back to
 the default of 1000.*/
 # TASK 1
 SELECT 
	hire_date
FROM 
	employees;
    
# INTRODUCTION TO AGGREGATE FUNCTIONS
/* They are applied on multiple rows of  single column of a table and returns an output of a single values.There are 5 aggregate functions.
COUNT(); counts the number of non null records in a field .
SUM () sums all the non null values in a column
MIN(); Returns the minimum value from the entire list
Max () returns thenmaximum value from the entire list.
AVG(); calculates the average of all non-null values belonging to a certain column of a table.
cOUNT() it is frequently used in combination with the reserved word 'DISTINCT'
The syntax is SELECT COUNT (Column_name), from table_name. Note the parenthesis after count must start right after the key word , 
not after the keyword ,not after a white space else your query will not work,
 for example if you are asked to find how many employees are registered in our database?
(Note, numbers are primary keys in employees table)*/

SELECT COUNT(emp_no)
FROM
employees;

# you can substitute the emp_no with first_name and you will get same result.
select count (first_name);
/* Refering to the IS null . this is what we did and we use the same thing in count.*/

SELECT 
*
FROM
employees
WHERE
First_name is NULL;
# To use count you will use do this

SELECT 
    COUNT(first_name)
FROM
    employees;
    
    # COUNT DISTINCT 
/*This is supposed to deliver the number of differnt names found throughout the data table . 
for example your boss may ask you to find out how many diff. names that can be found in the employees table ?
 count distinct will help you this time.but the distinct syntax must be written before the column name.*/
 
 
SELECT 
COUNT(DISTINCT first_name)
FROM
    employees;

/* important features of aggregate functions is that they Ignore NULL values unless told not to.
 so if there were null values count will not count them unless told not to*/

# EXERCISE ON AGGREGATE FUNCTION COUNT()

/*How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table? 
How many managers do we have in the â€œemployeesâ€ database? Use the star symbol (*) in your code to solve this exercise.*/

# SOLUTION 
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
/* If your boss ask you to order the people by first_name instead of by employees number.you can use THE ORDER BY clause*/

SELECT 
    *
FROM
    employee
ORDER BY first_name ASC;

# we can use one or two reserved words in order by clause, ASC -ascending

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

# we can also use DESC- Descending order.

# WE CAN ALSO ORDER EMPLOYEES BY FIRST AND LAST NAME in same query

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name ASC;


/* note ; order by does not wprk for columns containing strings values only . This clause can handle numbers as well . we can also use ASC or DESC in emp_no select*from employees;
ORDER BY emp_no DESC; You can also order your result by more than one field ie, you can re order employees by first_name and last_name,ORDER BY first_name ASC; To do for both last and first name.
 ORDER BY first_name, last_name ASC; */
 
# EXERCISE
# Select all data from the "employees" table, ordering it by "hire date" in descending order.

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

 
 # GROUP BY
/* This is used by more advanced SQL Querries .if you dont know it you may fall into great troble .When working in SQL,results can be grouped according to a specific field or fields. 
GROUP BY must be placed immediately after the WHERE CONDITIONS, if any,and just before the ORDER BY clause. GROUP BY is one of the most powerful and useful tools in SQL.
The syntax to use
SELECT column_name(s)
FROM table_name
WHERE CONDITIONS
GROUP BY column_name(s)
ORDER BY column-name(s);*/
/* What will happen if we select the first name column from an employees table, we will obtain an unsorted list of the names registered in the database, 
see what happens when we GROUP the output by first_name , the result will be shorter as only DISTINCT values will be selected. 
If a value within the first name field appears in a table more than once by using GROUP BY it will be displayed only in a single roll*/

 
SELECT 
first_name
FROM
employees
GROUP BY first_name;

/*(NOTE only distinct values will be selected ) we can also get the same result if we also use the well known SELECT DISTINCT structure but we will notice that the structure is diff but same result.*/

SELECT DISTINCT
first_name
FROM
employees;

/* If you notice , GROUP BY function is slower than SELECT DISTINCT function, but we need to know how to use
GROUP BY function whenever we want to solve issues involving AGGREGATE FUNCTIONS is essential.In most cases, when you need an aggregate function,
you must add a GROUP BY clause in your query, too,Assuming you need a list composed of two field, the first must contain a distinct first name and
 the second the number of times this first_name is encountered in our database,(looking at a single total value may ring a bell) if we type 
 select count first-name from employees, we will get the total value of records in this table then if we add GROUP BY first_name , 
 we will split the result gotten from the select statement into groups, but we dont see the names these values refer to. hence, 
 this is a rule professionals adhere to, 'ALWAYS  INCLUDE THE RESULT YOU HAVE GROUPED YOUR RESULT BY IN THE SELECT STATEMENT !
 it also improves the organisation and readeability of your code.
*/

# SOLUTION
SELECT
COUNT(first_name)
FROM
employees
GROUP BY first_name;

# Always include the field you have grouped your results by in the SELECT statement because your query may not run ifis ot included.
SELECT
first_name,COUNT(first_name)
FROM
employees
GROUP BY first_name;

# you can also use ORDER BY if you want to add the first name in descending order,ORDER BY first_name DESC;

SELECT
first_name,COUNT (first_name)
FROM
employees
GROUP BY first_name
ORDER BY first_name DESC;

# Note all blocks of codes are mandatory but you must get use to the order in which you state these blocks in the flow. 
SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
ORDER BY column_name(s);

# USING ALIASES (AS)

/*This will be a slightly more sophisticated task.if you look at the output from the last lecture you will notice that there are 
two problems with the name of that second column,Note that it is not professional to leave COUNT(first_name) 
the function key word as the column names of the output secondly, it would be much better to see a name that 
explains better the reasoning behind using aggregate function..both problems can be solved using ALIASES.
An alias(alias name) is used to rename a selection from your query.
in our example the first_name( 1 selection) ,and the counted number of first_name in each group is another
 selection by using the keyword AS you could rename a selection.NOW you will add to your query AS name count. and see the result below.*/
 
 
 SELECT
first_name,COUNT (first_name) AS names_count
FROM
employees
GROUP BY first_name
ORDER BY first_name ;

 
/*Hence, using aliases does not change your output (AS names_count) first_name, count(first_name) As name_count. 
This techinque is constantly applied in qeuries as it clarifies the analysis undertaken..*/


# EXERCISE ON ALIASES

 /*write a query that contains two columns
 the first column must contain annual salaries higher than 80,000 dollars The second column renamed to 'emp_with_same_salary',
 must show the number of employees contracted to that salary, lastly, sort the output by the first column*/
 # NOT CLEAR PLEASE
 
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
/* This is a clause frequently implemented with GROUP BY .
This is because it refines the output from records that do not satisfy a certain condition
. Having needs to be inserted between the GROUP BY and ORDER BY clause.
see example below,

SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
HAVING conditions
ORDER BY column_name(s);

HAVING is like WHERE but applied to the GROUP BY block.HAVING and GROUP BY can give you same result but diff.is this,
 After HAVING, you can have a condition with an aggregate function,
 while WHERE cannot use aggreate functions within its conditions.HAVING is like where but applied to GROUP BY block.
 
 HAVING and GROUP BY can give you same result but the difference is this .After HAVING, 
 you can have a condition with an aggregate function ,
 while WHERE cannot use aggregate functions within its conditions .
 HAVING is like WHERE but applied to GROUP BY block.
 lets look at this example, select all employees hired after 2000-01-01.
 (The retrieved table will be the same whether we use WHERE OR HAVING block ,
 but WHERE block is forbidden on  subset of AGGREGATE GROUP eg. column*/
 
 SELECT 
first_name
FROM
employees
HAVING
hire_date >= '2000-01-01';
# When is the right time to use WHERE clause or HAVING ?
/* If you want to extract a list with all first_name(s) that appeared more than 250 times on the employees table, 
if you try to set this condition in the WHERE clause workbench will say there is a mistake in your code
(invalid use of group functions)
once you notice this you need to change the keyword to  HAVING;*/

# WRONG APPROACH

 SELECT
first_name,COUNT (first_name) AS names_count
FROM
employees
WHERE
COUNT(first_name)> 250
GROUP BY first_name
ORDER BY first_name ;

# RIGHT APPROACH ;you need to include HAVING

SELECT
first_name,COUNT (first_name) AS names_count
FROM
employees
GROUP BY first_name
HAVING COUNT(first_name)> 250
ORDER BY first_name ;

 # When is the right time to use WHERE clause or HAVING ?
/*lets look at the example above, the instruction is to extract all first names 
that appear more than 250 times in the employees table
COUNT() an aggregate function  should be used.Having 250 TIMES means
 counting numbers and this can be executed through the COUNT function .*/

# EXERCISE ON HAVING;

/*Select all employees whose average salary is higher than $120,000 per annum.
Hint: You should obtain 101 records.
Compare the output you obtained with the output of the following two queries:
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
HAVING AVG(salary) > 120000;*/

# SOLUTIN ON HAVING
# TASK 1 ALL EMP with avg .sal > 120000

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

# task 2

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

# WHERE VS HAVING PART 1
# It's important to decide whether to use where or having in certain situations
# WHERE allows us to set conditions that refer to subsets of individual rows which
# are applied before re-organising the output into groups. Once the rows that satisfy the 
# WHERE conditions are chosen, they progress in the data retrieval process and can be grouped by
# DISTINCT values recorded in a field(s). The output can be further improved or filtered with
# with a condition specified in the HAVING clause, You could then sort the records of the final list
# to the ORDER BY clause


/* it is important to decide which one to use.
 WHERE allows you to set conditions that refers to 
subsets of individual rows applied before re-organizung the output into groups(GROUP BY),note,
 you must GROUP BY first_name. WHERE - HAVING - ORDER BY*/
 
/* IF we are asked to extract a list of all names that are encountered less than 200 times . 
hint ; let the data refer to people hired after the '1st of January 1990' only.*/

/* Lets create the query
1. Select the first names and the number of times the first names are encountered.
2.Dsignate the table we will retrieve data from employees;
3.Should we use only WHERE? HAVING ? or both keywords while setting the conditions.

TO solve this puzzle there are two conditions to consider;
a. Encountered less than 200 times COUNT() must be used and it must go with HAVING
b. People hired after the '1st of Jan ,1999'(this refers to all indidual rows in the employees table(WHERE CLAUSE)
(between the WHERE clause and HAVING we need to  include the GROUP BY (Note,by first name )
finally , the question refers to the number of certain first name*/

SELECT
first_name,COUNT (first_name) AS names_count
FROM
employees
WHERE
hire_date >'1990-01-01'
GROUP BY first_name
HAVING COUNT(first_name) <200
ORDER BY first_name DESC;
#(How do you know when to use desc)

# WHERE VS HAVING PART 2;
/* It is important to note that if you need to use to work with
 AGGREGATE functions use GROUP BY and HAVING, if you need to apply general conditions use WHERE.
 ( I NEED TO CLARIFY FROM INSTRUCTOR ,WHICH ONE IS GENERAL CONDITIONS ?)
 
 THE SYNTAX

 SELECT column _name(s)
(first_name,COUNT (first_name) AS names_count)
FROM table_name
(employees)
WHERE conditions
GROUP BY column_name(s)
(GROUP BY first_name)
HAVING conditions
(HAVING COUNT(first_name)> 250)
ORDER BY column_name
(ORDER BY first_name ;)

 when first_name and count appear many times in your query there is no problems with that,
 all you need to do is to master the query structure well.*/
 
 # EXERCISE ON WHERE VS HAVING
 # Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
 # Hint: To solve this exercise, use the "dept_emp" table.
 
 # SOLUTION
 
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


# LIMI
 # Note that when you have a code in this format below both will not run.
 
 SELECT
 *
 FROM 
 employees
 HAVING hire_date>='2000-01-01'   (non aggregated)
 HAVING COUNT(first_name) > 250   (aggregated)
 ORDER BY first_name
 # Both cannot work together in the same code.
  
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

# EXERCISE ON HAVUNG VS WHERE

/*Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
Hint: To solve this exercise, use the "dept_emp" table*/.

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    dept_emp
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200


 # LIMITS
 
 # example ,Select all rows from the salary table ( you can expand the limit on the workbench because default is at 1000 rows)
 ELECT 
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


# LIMIT
 SELECT
 *
 FROM
 salaries;
 
 # How to avoid seeing so many records in your output.
 /* for example if your boss just told you to show him the employee numbers of the 10 highest paid employees in the database  
 ,NOTE,you are looking for top performance ,think of solving the qeury in desc order .*/
 
 SELECT
 *
 FROM
 salaries
 ORDER BY salaries DESC
 LIMIT 10;
 
 # If we substitute the salaries with employ_no desc, see below
 SELECT
 *
 FROM
 salaries
 ORDER BY emp_no DESC
 LIMIT 10;
 
 /* the code will run but we will get 10 employees in desc order but 
 they are not the highest paid individuals so it means our result will 
 e incorrect.Hence, we ned to be prudent . Note, you need to put the LIMIT statement
 at the end of the querry ,no matter how long the querry is.alterthe syntax
 
SELECT column _name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
HAVING conditions
ORDER BY column_name(s)
LIMIT number;*/

# EXERCISE
# Select the first 100 rows from the dept_emp table (pls cross check result with instuctor)

SELECT
 *
 FROM
 departments
 ORDER BY dept-emp DESC
 LIMIT 100;
 
 # SQL INSERT STATEMENT
# HOW TO CREATE a record from the employee table.
# To insert into a database, the syntax is
# INSERT INTO table_name(column_1, column_2)
# VALUES (value_1, value_2)
# Note, data must be within parenthesis as well.

# EXAMPLE
# EXTRACT 10 records from the employee table to see how the infor.is organized there,
# we are going to retrieve 10  rows so our limit will be 10 rows,
# once we run the code we will have the following, emp_no, birth_date, first_name,last_name, gender,hire_date.
# ( we have 6 columns but we dont need to insert all but only the ones related to our work)

SELECT 
    *
FROM
    employees
LIMIT 10;
# Go to info section-Columns to get the types of data the columns are
# Create a record of an individual named John Smith
# ( specify the column and seperate them by a column, this infor. is alrealy in our sql
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
		
 