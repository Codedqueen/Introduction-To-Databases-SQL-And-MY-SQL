USE employees;

COMMIT;
-- We will ROLLBACK after this triggers exercise.

# MySQL TRIGGERS

# Is a type of stored program, associated with a table, 
# that will be activated automatically once a specific event related to the table of association occurs. 

# This event must be related to one of the following three DML statements: INSERT, UPDATE, or DELETE. 
# Therefore, triggers are a powerful and handy tool that professionals love to use where database consistency 
# and integrity are concerned.

-- BEFORE INSERT TRIGGER
DELIMITER $$
CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
IF NEW.salary < 0 THEN
SET NEW.salary = 0;
END IF;
END $$

DELIMITER ;

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
    INSERT INTO salaries VALUES ('10001', -92891, '2010-06-22', '9999-01-01');
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
    # BEFORE UPDATE TRIGGER:
    
    DELIMITER $$
    CREATE TRIGGER before_salaries_update
    BEFORE UPDATE ON salaries
    FOR EACH ROW
    BEGIN
    IF NEW.salary < 0 THEN
    SET NEW.salary = OLD.salary;
    END IF;
    END $$
    DELIMITER ;
    
    UPDATE salaries
    SET
    salary = 98765
    WHERE
    emp_no = '10001'
    AND from_date = '2010-06-22';

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
    UPDATE salaries 
SET 
    salary = -50000
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
        SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001' 
    AND from_date = '2010-06-22'; 
    -- The salary did not change.
    
    -- There are system variables known as system functions. System Functions = Built-In Functions
    -- Often applied in practice, they provide data about the moment of the execution of a certain query.
    
    SELECT SYSDATE();  # delivers the system date and time
    
    SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;  # delivers today's date according to the format
    
    # Illustration
    /* A new employee has been promoted to a manager
    Annual salary should immediately become 20000 dollars higher than the highest
    annual salary they'd ever earned until that moment. A new record in the 'department manager' table
    Create a trigger that will apply several modifications to the 'salaries' table once the relevant
    record in the 'department manager' table has been inserted. 
		Make sure that the end date of the previously highest salary contract of that employee is 
        the one from the execution of the insert stmt. 
        Insert a new record in the 'salaries' table about the same employee that reflects their next
        contract as a manager. 
        - A start date the same as the new 'from date' from the newly inserted record in 'department manager'
        - A salary equal to 20000 dollars higher than their highest ever salary
        - Let that be a contract of indefinite duration. You can display that as a contract ending on the 1st of 
        January in the year 9999.*/
        
    
    DELIMITER $$
    CREATE TRIGGER trig_ins_dept_mng
    AFTER INSERT ON dept_manager
    FOR EACH ROW
    BEGIN
    DECLARE v_curr_sal int;
    
    SELECT 
    MAX(salary)
    INTO v_curr_salary FROM salaries
    WHERE emp_no = NEW.emp_no;
    
    IF v_curr_salary IS NOT NULL THEN
    UPDATE salaries
    SET to_date = SYSDATE()
    WHERE
    emp_no = NEW.emp_no and to_date = NEW.to_date;
    INSERT INTO salaries
    VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
    END IF;
    END $$
    DELIMITER ;
    
    INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%y-%m-%d'), '9999-01-01');
    
    SELECT * FROM dept_manager WHERE emp_no = 111534;
    
    
    
    ROLLBACK
    
  /* Assignment
Create a trigger that checks if the hire date of an employee is higher than the current date. 
If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).*/


# MYSQL INDEXES:

/* They work like the indexes found in the library. The index of a table works like the index of a book
Basically, data is taken from a column of the table and is stored in a certain order in a distinct place,
called an index.
Working with small datasets will return results fast, But Your datasets will typically contain thousands
 of millions of records. Logically, the larger a dataset is, the slower the process of finding the
 record or records you need. 
 For a large database such as the employees database, we can use an index that'll increase the speed of the 
 searches related to a table. The Syntax is;
 CREATE INDEX index_name
 ON table_name (column_1, column_2, ...); The parentheses serve us to indicate the column names on which
 our search will be based. It'll be sped up and the data will be filtered in a quicker way. Technically, the idea is
 to choose columns so your search will be optimised. These must be fields from your data table you'll search frequently.*/
-- E.g
-- How many pple have been hired after the 1st of Jan 2000?

SELECT * FROM employees WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);  # the above query will now run faster than when no index was created

# Select all employees bearing the name 'Georgi Facello'

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';

-- Another useful feature is the COMPOSITE INDEXES
-- They are applied to multiple columns and not just a single one.
-- The syntactical structure is the same as indexes. 
CREATE INDEX index_name
 ON table_name (column_1, column_2, ...);
 -- All a programmer needs to do is to pick the columns that'll optimize your search
 
 SELECT * FROM employees WHERE hire_date > '2000-01-01';
 
 SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';
        
 CREATE INDEX i_composite ON employees(first_name. last_name); # Run this query and re-run the above query, it will be returned quicker
 
 -- There are other types of indexes in MySQL, such as PRIMARY and UNIQUE KEYS.
 -- They represent columns on which a person can base his search
 -- E.g the primary key emp_no from the employees table represent unique values an Analyst could take
 -- advantage of to extract distinct values from the data table. 
 
 # To show created indexes;
 
 SHOW INDEX FROM employees FROM employees;
	# OR
 -- Open the info section of the database in use and select the indexes tab. 
 
 -- SQL specialists are always aiming for a good balance btw the improvt of speed search and the resources
 -- used for its execution. 
 -- For small datasets - The ost of having an index might be higher than the benefits. 
 -- For large datasets - A well optimized index can make a positive impact on the search process. 
 
/* Assignment
Task 1:
Drop the â€˜i_hire_dateâ€™ index.
Task 2:
Select all records from the â€˜salariesâ€™ table of people whose salary is higher than $89,000 per annum.
Then, create an index on the â€˜salaryâ€™ column of that table, and check if it has sped up the search of the same SELECT statement.*/


# THE CASE STATEMENT
/* There are many ways a condition can be expressed in SQL. One may want to run an output when a certain condition has been satisfied
and another output when a certain condition has not been satisfied.One way to apply such conditions is the Coalesce or Ifnull stmts. 
Another type of conditional construct is the CASE STATEMENT
It's used within a select stmt when we want to return a specific value based on some condition. 
It's syntax can vary depending on what we want to show.
SELECT 
column_name (s)
CASE condition_field
WHEN condition_field_value_1 THEN result_1
WHEN condition_field_value_2 THEN result_2
.....ELSE END AS FROM table_name; */
-- E.g
-- Here, when the value of a column is M, we'll return Male, when F, we'll return Female.

SELECT emp_no, first_name, last_name, CASE
WHEN gender = 'M' THEN 'Male'
ELSE 'Female'
END AS gender FROM employees;

-- We can obtain the same result by puting the name of the column once after the word CASE,
-- then write the corresponding value after the WHEN keyword without using  the equals operator

SELECT emp_no, first_name, last_name, 
CASE gender
WHEN 'M' THEN 'Male'
ELSE 'Female'
END AS gender FROM employees;

-- This technique won't work in all cases
 
 SELECT
 e.emp_no,
 e.first_name,
 e.last_name,
 CASE
 WHEN dm.emp_no IS NOT NULL THEN 'Manager'
 ELSE 'Employee'
 END AS is_manager
 FROM
 employee e
 LEFT JOIN
 dept_manager dm ON dm.emp_no = e.emp_no
 WHERE e.emp_no > 109990;
 
-- If we re-write dm.emp_no and place it right after CASE, the query won't return the correct result but employee only. 
 -- As seen bellow. This is bcos, IS NULL and IS NOT NULL are not values that smth can be compared to. So the correct
 -- way of writing this condition is CASE, WHEN, and then putting the condition that contain IS NULL or IS NOT NULL. 
 SELECT
 e.emp_no,
 e.first_name,
 e.last_name,
 CASE dm.emp_no
 WHEN NOT NULL THEN 'Manager'
 ELSE 'Employee'
 END AS is_manager
 FROM
 employee e
 LEFT JOIN
 dept_manager dm ON dm.emp_no = e.emp_no
 WHERE e.emp_no > 109990;
 
 -- Another E.g. Here we use the IF construct. The 1st condition within the parentheses is what we want to be TRUE, If TRUE,
 -- the 2nd expression is returned, if FALSE, the 3rd. The IF stmt has some limitations compared to CASE. With CASE, 
 -- we can have multiple conditional expressions, while IF is just one.
 
 
 SELECT emp_no, first_name, last_name, IF (gender = 'M', 'Male', 'Female')
 AS gender FROM employees;
 
 -- E.g By executing the query bellow, we can obtain the increase in salaries of all dept managers based on some conditions. 
 -- By using WHEN expression, we can obtain more than 2 values in the salary increase column. This output cannot be 
 -- obtained by a simple IF stmt.
 
 SELECT
 dm.emp_no,
 e.first_name,
 e.last_name,
 MAX(s.salary) - MIN(s.salary) AS salary_difference,
 CASE
 WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
 WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20,000 but less than $30,000'
 ELSE 'Salary was raised by less than $20,000'
 END AS salary_increase
 FROM dept_manager dm JOIN employees e
 ON e.emp_no = dm.emp_no
 JOIN salaries s ON s.emp_no = dm.emp_no
 GROUP BY s.emp_no;
 
/* Assignment
Task 1:
Similar to the exercises done in the lecture, obtain a result set containing the employee number, 
first name, and last name of all employees with a number higher than 109990. Create a fourth column in the query,
 indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee.
Task 2:
Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
Add two columns at the end â€“ one showing the difference between the maximum and minimum salary of that employee, 
and another one saying whether this salary raise was higher than $30,000 or NOT.
If possible, provide more than one solution.
Task 3:
Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, 
called â€œcurrent_employeeâ€ saying â€œIs still employedâ€ if the employee is still working in the company, 
or â€œNot an employee anymoreâ€ if they arenâ€™t.
Hint: Youâ€™ll need to use data from both the â€˜employeesâ€™ and the â€˜dept_empâ€™ table to solve this exercise.*/
 
 