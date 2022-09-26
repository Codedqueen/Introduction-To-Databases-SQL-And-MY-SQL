# SQL INSERT STATEMENT.

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
# note the all values must be written in single Quote besides the employees number.
# To find the data type go to infor .center on work bench

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

INSERT INTO employees
(
emp_no,
birth_name,
first_name,
last_name,
gender,
hire_date)
VALUES
(999901,
'1986-04-21'
'John'
'Smith'
'M'
'2011-01-01'
);
# the code is not giving me the correct figure?...
 # INSERT CLAUSE PART 2
 /* Usually database administration follow the order of columns in terms of the way they appear on a given table
 but in some ocassion they pefer inserting data values in a diff.order. My SQL allows for such type of data, for instance, 
 should we create a data record about 'Patricia' 'Lawrence'we will insert her birth_date first, then insert the rest of 
 the value in the designated order, pls keep in mind we must put the values in the exact order we have listed the column names
 Another interesting feature of the insert syntax, techically the first pair of parenthesis along with the column name
 between then can be omitted,only insert into the column names and the value part are mandatory,if you ommit it in the
 value session, 'YOU WILL HAVE TO SPECIFY AS MANY DATA VALUES AS THERE COLUMNS IN THE DATA TABLE, ALSO, YOU WILL HAVE 
 TO ADD THEM IN THESAME ORDER IN WHICH THEY APPEAR IN THE TABLE. For eg. we can use the structure below 
 to create a record in the employees table*/
 
 
 INSERT INTO employees
VALUES
(
    999903,
    '1977-09-14',
    'Johnathan',
    'Creek'
);
# if we use only 4 instead of all 6 columns, sql will display an error, but if we try to add all 6 columns , the query will run.

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


SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

# EXERCISE 
/* Select ten records from the â€œtitlesâ€ table to get a better idea about its content.
Then, in the same table, insert information about employee number 999903. State that he/she is a â€œSenior Engineerâ€, who has started working in this position on October 1st, 1997.
At the end, sort the records from the â€œtitlesâ€ table in descending order to check if you have successfully inserted the new record.
Hint: To solve this exercise, youâ€™ll need to insert data in only 3 columns!
Donâ€™t forget, we assume that, apart from the code related to the exercises, you always execute all code provided in the lectures. This is particularly important for this exercise. If you have not run the code from the previous lecture, called â€˜The INSERT Statement â€“ Part IIâ€™, where you have to insert information about employee 999903, you might have trouble solving this exercise!
Code:
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

Task 2:
Insert information about the individual with employee number 999903 into the â€œdept_empâ€ table.
 He/She is working for department number 5, and has started work on October 1st, 1997; her/his 
 contract is for an indefinite period of time.
Hint: Use the date â€˜9999-01-01â€™ to designate the contract is for an indefinite period.*/

# SOLUTION

INSERT INTO titles (emp_no, title, from_date)
VALUES (999903, 'senior_engineer', '1997-10-01');
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (999903, 'd005', '1997-10-01', '9999-01-01');

# INSERTING DATA INTO A NEW TABLE

# Inserting Data into a new table
# To create a table departments_dup
/* THE Syntax to use;
INSERT INTO table_2 (column_1, column_2, ...column_n)
SELECT column_1, column_2...column_n
FROM table_1
WHERE conditions;
first thing to do is to check the columns of the dept*/

SELECT
     *
FROM
   departments
LIMIT 10;

# WE HAVE 2 COLUMNS, dept_no, dept_name



# The next thing to do is to create departments duplicate ie (departments_dup) 
# it will be a replica of the existing dept. our task is to import 
# all the information on department_table
# syntax to use is below

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

# Execute the above and refresh the schema secion on work bench and you will see the new table on the list.
# you can check to comfirm if you have any infor. on the departments_dup table created using this syntax;

SELECT
	* 
FROM
departments_dup;

/*we will now insert the dept_name and dept_no into the departments_dup created
 everything we can import from the departments table.pls note that since dept 
 contains the same number and type of column it is not necessary to add specific 
 conditions to the data retrieved from the departments_table, hence the starwild 
 character will do the job .Always remember that unless the new data you are inserting 
 satisfies the constraints, mysql will show an error message.
 we made sure not to put data that does not satisfy the existing constraints.
 Also keep in mind that complying with constraints is important as they will always play a major role while inserting data*/

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
 # Complying with constraints is essential.
 
# EXERCISE

/* Create a new department called "Business Analysis". Register it under number "d010".
Hint: To solve this exercise, use the "departments" table.*/

# SOLUTION

 CREATE TABLE Business_Analysis (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL);
    
 Insert into Business_Analysis(dept_no, dept_name)
select * from departments;

Insert into Business_Analysis(dept_no, dept_name)
values('d010', 'business_analysis');

SELECT 
    *
FROM
    business_analysis
ORDER BY dept_no desc; 

DROP TABLE business_analysis;

INSERT INTO departments
VALUES ('d010', 'business_analysis');

SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC
LIMIT 10;

# SQL UPDATE STATEMENT
# TCL's Commit and Rollback (TCL means transaction control language)
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

/* to practice this you need to switch off the following features of word bench 
click on edit
prefernces
on the left side choose SQL EDITOR
on the right hand side scoll down 
to get to the box that says
(safe update ;reject update, delete with no restriction
choose safe update)by so doing the soft ware could prevent
 you from loosing large amount of data or changes you made earlier
 it could also eliminate the possibility of controlling the state of the data,
 non of this features will help us so pls turn it off.After turning it off,
 you must be very careful when updating and deleting data in MYSQL.
 To properly switch off the safe update,Reconnection to the data base is required.
 Hence, EXIT the connection,reconnect and type in the pasword.*/
 
/* The Update Statement part 1
 Used to update the values of an existing record in a table
 UPDATE table_name
 SET column_1 = value _1,column_2 =value_2....  (that must be satisfied)
 WHERE conditions*/
 
 /* Using the data we have already to update means to change the details 
 of an old employee with a new one but the id_no will not change because
 if you change the id_no it will still update but you will have zero record. (Use employeees)*/
 
 SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    # run the qurey to get the data of the satff with the id no in this case 'John' 'Smith'
    # and update the record with that of the new staff 'Stella' 'Parkinson'...
    
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
  
  # The Update Statement 2
 /* When updating the table the WHERE clause is CRUCIAL.It is set by default in my sql . 
  if you dont provide a WHERE condition all rows of the table will be updated.
  Hence, when using UPDATE STATEMENT,Please always INCLUDE the WHERE clause so
  that all rows in the existing table will not be effected.*/

/* check what we have in the department_dup table( 9 rows and 2 columns with information,
 for the sake of this exercise we will change all the dept_no and names in this table,
 but before that we will execute the commit command so that it will save the original data*/

  SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

/* it will give you same result for all the 9 rows ie quality contol 
, to correct it we need to apply thr roll back command. if we have 
applied the commit command before it will take us to the last commit statement 
but if we didnt use commit we will loose alot of data , thats why is always good to
 use the COMMIT COMMAND.REMEMBER,ONCE YOU EXECUTE COMMIT YOU CANNOT REVERSE ANY CHANGE.*/

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
 
 # EXERCISE
 
/*Cange the "Business Analysis" department name to "Data Analysis".
Hint: To solve this exercise, use the "departments" table.*/


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


/* SQL Delete Statement PART 1

It deals with removing data from the database, before deleting, ensure you run the COMMIT stmt
so that you can ROLLBACK after Deleting the data
DELETE FROM table_name
WHERE conditions*/
# If you delete it by mistake,use commit , then apply a roll back command to bring it back.
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

