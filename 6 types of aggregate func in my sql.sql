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
		
 