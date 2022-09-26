#WEEK 4 DAY 3, MY SQL CONSTRAINTS (How to assign constraints on tables) PRIVATE KEY, FOREIGN KEYS.....

/* PRIVATE KEYS CONSTRAINTS: constraints are specific rules or limits that we can define in our tables.
The role of constraints is to outline the existing relationship between diff. tables in our datbase.eg,
 NOT NULL is a constraint that can be assigned to a given table,IN relational schema we spoke about PRIMARY ,
 FOREIGN AND UNIQUE KEYS as keys that defines the relationship
btw tables and designate whether is possible to see duplicate values in the same column, to apply them in practice , 
you must define them in SQL through their respective constraints'
we wil work with the same sales table, SALES TABLE; purchase_number:  date_purchase ,customer_id,(fk) item_code (fk) */

 CREATE TABLE sales
(
     purchase_number INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
	 date_of_purchase DATE NOT NULL,

  customer_id INT,
     item_code VARCHAR(10) NOT NULL
 );
 
# you can only use AUTO INCREMENT if you are workng with primary key , unique keys or index. 
# There is another way to do the same job we may not need to mention the name of the constraint
 # (primary key) but we ll have other things intact.
   
 CREATE TABLE sales
(
     purchase_number INT NOT NULL  AUTO_INCREMENT ,
	 date_of_purchase DATE NOT NULL,

  customer_id INT,
     item_code VARCHAR(10) NOT NULL,
     PRIMARY KEY(purchase_number)
 );
 
 
 /* to prove that we did our job correctly in the schema section in work bench ,click the first button, click on sales,
 go to tables, click on i which stands for imformation,infor gives you some geneal data about the table,
 for instance,column gives you information about the tables and the respective data type
 it shows you whether you have added an extra constraint,you can also refer to the DDLtab , 
 t is an extract of the ddl table.in the ddl tab you will always find the information you need.*/
 
  # EXERCISE
# Drop the "customers" table and re-create it using the following code:
 
CREATE TABLE customers

(

customer_id INT,

first_name varchar(255),

last_name varchar(255),

email_address varchar(255),

number_of_complaints int,

primary key (customer_id)

); /
/* then, create the "items" table

(columns - data types:

item_code - VARCHAR of 255,

item - VARCHAR of 255,

unit_price - NUMERIC of 10 and 2,

company_id - VARCHAR of 255),

and the "companies" table

(company_id - VARCHAR of 255,

company_name - VARCHAR of 255,

headquarters_phone_number - integer of 12).*/


# SOLUTION

CREATE TABLE customers
(
 customer_id INT,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int,
primary key (customer_id)

);

 # ITEM TABLE
 
 CREATE TABLE items
 columns data types,
item_code VARCHAR(255),
item VARCHAR (255),
unit_price NUMERIC (10 ,2),
company_id  VARCHAR (255),
company_id  VARCHAR (255,
company_name VARCHAR (255,
headquarters_phone_number int (12)
);

# FOREIGN KEYS
/*It points to columns of another table and thus links the two tables. collection of table from child table to another 
table called the parent table = referencing table.child table = referenc table(sales table) parent table = reference 
 table(customers table).Foreign key in MY SQL is defined through a foreign key constraint.
The foreign key maintains the referential integrity with the data base. How can we establish the relationship btw 
two tables. we also apply what we call on delete cascade.it is a specific value from the parent table ,s primary 
 key has been deleted , all the records from the child,s table refering to this value will be removed as well.
 #EXAMPLE OF FOREIGN KEY COMMAND
 
 DROP TABLE sales;
 
     CREATE TABLE sales
(
     purchase_number INT AUTO_INCREMENT ,
	 date_of_purchase DATE ,
     customer_id INT,
     item_code VARCHAR(10) ,
     PRIMARY KEY(purchase_number),
     FOREIGN KEY (customer_id) REFERENCES
     customer(customer_id)DELETE CASCADE customer(customer_id0 ON DELETE CASCADE
 );

# when you run this code it will tell you table sales already exists sales , you can do 3 things. 
#we can drop the table, if we choose this approach we can put a (DROP TABLE sales;)on top of the code.and copy all together and the code will run. we c
# we can alter the table( ALTER TABLE table_name ADD...;)

 CREATE TABLE sales
(
     purchase_number INT AUTO_INCREMENT ,
	 date_of_purchase DATE ,
     customer_id INT,
     item_code VARCHAR(10) ,
     PRIMARY KEY(purchase_number),
     
     ALTER TABLE table_name,
     ADD FOREIGN KEY(customer_id) REFERENCES customers(customers_id) ON DELETE CASCADE
     );
     
     ALTER TABLE sales
     DROP FOREIGN KEY sales_ibfk_1;
     
     
     # check the ddl infor you will see the foreign key created with is number in this case ibfk_j .
     # you can drop this paticular table using the following syntax
     # ALTER TABLE sales
     # DROP FOREIGN KEY sales_ibfk_1; then run the code . you will see that the foreign key has been removed.
     
     # HOW TO ADD A FOREIGN KEY IN MY SQL WORKBENCH
     /* Right click on the name of the sales table, click on infor, click on alter table and a new window will 
     appaer and you ll be able to add the name of the constraint which may not coinscide with the name of the column.
	This is just an option for naming the constraint and not renaming the column. you can now pick the refernced 
    parent table from the list.finally on delete cascade can be added from the little list on the right side,
	then press the apply button to add the foreign key to the table. To verify that this happen ,look for more 
    information on the ddl table,we also have a foreign key tab that contains a list of foreign keys 
	assigned to the table on the right side, you can see h referenced table ; customers, referenced column customer _id */
     
     
     # FOREGN KEYS PART 2 EXERCISE
    # Looking to the next few lectures of the course, drop all tables from the "Sales" database in the following order:
    
	# first drop "sales", then "customers", "items", and finally "companies".
     
 DROP TABLE sales;
 
 DROP TABLE customers;
 
 DROP TABLE item;
 
 DROP TABLE companies;
 
 
CREATE TABLE sales
(
     purchase_number INT AUTO_INCREMENT ,
	 date_of_purchase DATE ,
     customer_id INT,
     item_code VARCHAR(10) ,
     PRIMARY KEY(purchase_number),
     
	ALTER TABLE table_name,
     ADD FOREIGN KEY(customer_id) REFERENCES customers(customers_id) ON DELETE CASCADE
     );
     
     
     
     # UNIQUE CONTRAINT 
     /*Unique keys used whenever you would like to specify that you dont want to see duplicate data in a given field.
     You need to ensure that as values in a column(or a set of columns) are different.Unique keys are implemented in 
     SQL through a constraint .The UNIQUE CONSTRAINT. If you attempt to insert an already existing duplicate value
      in the unique column,SQL will display an error.An example of unique constraint is email_address is unique 
      because is impossible to have same e mail address.you can comfirm this by opening the ddl tab
     UNIQUE KEY syntax */
     
     ALTER TABLE table_name  
     ADD UNIQUE KEY (column_num);

     #EXAMPLE 
     
     CREATE TABLE customers (
     customer_id  INT,
     first_name VARCHAR(255),
     last_name  VARCHAR(255),
     email_address VARCHAR(255),
     number_of_complaints INT,
     PRIMARY KEY (customer_id)
     UNIQUE KEY(email_address)
     );
     
     # DROPPING THE TABLE AND RECREATING THE TABLE WITHOUT SETTING A UNIQUE KEY
     
     /*ALTER TABLE customers
     ADD UNIQUE KEY(email_address);*/
     
     
   DROP TABLE customers
   
	CREATE TABLE customers 
    (
     customer_id  INT,
     first_name VARCHAR(255),
     last_name  VARCHAR(255),
     email_address VARCHAR(255),
     number_of_complaints INT,
     PRIMARY KEY (customer_id)
     );
     
     # Another way to add the unique key constraint is through the alter table statement
     
    
    
     
     # DROPPING E MAIL
     ALTER TABLE customers
     DROP INDEX email_address;
     
     
     # INDEXES
     /* Unique keys in MySQL have the same role as indexes.But remeber the reverse isn't TRUE. Index of a table is an
     organizational unit that helps retrieve data more easily.it takes more time to update a table cos indexes must be
	 updated too, and that's time consuming.Indexes is frequently used to retrieve information. 
     The syntax is ALTER TABLE.table_name
     Drop index unique_key_field */
     
    #  syntax for dropping index;
     
     /*ALTER TABLE.table_name
     DROP INDEX unique_key_field;*/
     
     CREATE TABLE customers (
     customer_id  INT,
     first_name VARCHAR(255),
     last_name  VARCHAR(255),
     email_address VARCHAR(255),
     number_of_complaints INT,
     PRIMARY KEY (customer_id)
     UNIQUE KEY(email_address);
     
     ALTER TABLE customers
     DROP INDEX email_address;
     
     # you can check the ddl infor to comfirm
     
     # EXERCISE ON UNIQUE CONSTRAINTS.
    /* Drop the â€œcustomersâ€ table, and then recreate it using the following code.
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

Then run the following code that will add a â€œgenderâ€ column in the â€œcustomersâ€ table,
 and will then insert a new record in it.
Donâ€™t worry if you donâ€™t understand the meaning of the code perfectly â€“ we will discuss 
these structures later on in the course in more detail.
 We will just use them now to insert a row in our â€œcustomersâ€ table.
 ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365datascience.com', 0)*/

#SOLUTION 1 ALTER TABLE

 ALTER TABLE customers;
 
 CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

# TASK 2 RECREATE TABLE.
 
CREATE TABLE customers (
customer_id  INT,
first_name VARCHAR(255),
last_name  VARCHAR(255),
ADD COLUMN gender ENUM('M','F')
email_address VARCHAR(255),
number_of_complaints INT,
PRIMARY KEY (customer_id),
UNIQUE KEY(email_address);
VALUES('John', 'Mackinley', 'M', 'john.mckinley@365datascience.com',DEFAULT 0)
);

      

# DEFAULT CONSTRAINT 
/* it helps us to assign a particular default value to every row of a column.A value diff from the default
 can be stored in a field where the DEFAULT CONSTRAINT has been applied only if specifically indicated.
 eg, is number of complaints columns. it can be added at the end of the row. 
We will apply the default syntax using 0 with or without quote(DEFAULT 0 OR "0  OR '0') 
IS ACCEPTABLE. THIS should come after the number of complaints.
     ALTER TABLE table_name
     CHANGE COLUMN...;
     
     # ALTER TABLE customers
    #CHANGE COLUMN number_of_complaints number_of complaints INT DEFAULT 0;*
	
INSERT INTO customers(first_name,last_name,gender)
VALUES('Peter','Figaro' 'M')
);

SELECT * FROM customers;
ALTER TABLE table_name
ALTER COLUMN column _name  DROP DEFAULT 

# HOW TO DROP IT 
ALTER TABLE customers
ALTER COLUMN number_of_complaints
DROP DEFAULT;
DATA DEFINITION LANGUAGE(DDL syntax)
CREATE
ALTER
DROP*/

# EXAMPLE
 CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of complaints INT DEFAULT 0;


INSERT INTO customers(first_name,last_name,gender)
VALUES('Peter','Figaro' 'M')
);

 SELECT * FROM customerS;
 
 ALTER TABLE customers
ALTER COLUMN no_of_complaints DROP DEFAULT;



/*we can check the ddl to find out if the default values were applied correctly. 
to achieve this task we must insert a new record delibrately leaving the number of complaints with no value.
to see if 0 will appear automatically and is important to add a name,last name and gender as we declared it cannot be null and customer id, 
the e mail_address is not compulsory so me may leave it.lets improvise with(Peter Figaro 'M') 
This record will be added to the customers table, to prove this type SELECT * FROM customers. 
he ddl tab tells if we have implemented a command properly,
 THE DEFAULT COMMAND can be dropped as welI using the above syntax
 ALTER TABLE table_name
ALTER COLUMN column _name  DROP DEFAULT; 
	

# EXERCISE ON UNIQUE CONSTRAINT
/*Recreate the â€œcompaniesâ€ table
(company_id â€“ VARCHAR of 255,  
company_name â€“ VARCHAR of 255,  
headquarters_phone_number â€“ VARCHAR of 255),    
This time setting the â€œheadquarters phone numberâ€ to be the unique key,
 and default value of the company's name to be â€œXâ€.*/  

# SOLUTION
CREATE TABLE cutomers
company_id VARCHAR(255),
company_name VARCHAR(255),
headquaters_phone_number UNIQUE KEY,
 VALUE company_name DEFAULT a€œXâ€;

# NOT NULL CONSTRAINT (PART 1)
/* Difference between primary keys and unique keys. primary keys field all your values must be unique and you 
 may not have no values, but allIgn Unique keys all ur values must be unique but you may have No values in some records.
 The 'not null' restriction is  applied through the NOT NULL contraint. when you insert values in the table you cannot 
 leave the respective field empty.if you do, my sql will show an error message.  it deals with company name/phone number
we dont need the varchar every time .Note; we dont use the maximum VARCHAR every time.VARCHR(65335)
 e dont need to omit the company_name and we must add the not null constraint, 
 by doing this we ensurebthat there is no missing data in the company name column to drop the nut null constraint ,
 you must MODIFY the constraint to go back to null*/
 
 CREATE TABLE companies
(
     companies_id INT AUTO_INCREMENT,
     headquarters_phone_number VARCHAR(255),
     companies_name VARCHAR(255) NOT NULL,
     PRIMARY KEY (company_id)
     );
   
# HOW TO DROP NOT NULL CONSTRAINT
ALTER TABLE companies
MODIFY company_name company_name VARCHAR (255) NOT NULL;

# HOW TO ADD THE NUT NULL CONSTRAINT
ALTER TABLE COMPANIES
CHANGE COLUMN company_name company_name
VARCHAR(255) NOT NULL;

INSERT INTO companies(headquarters_phone_number,company_name);
VALUES ('+1(202) 555-0196','Company A');

# HOW TO CHECK IF NEW ENTERIES ARE INCLUDED
SELECT * FROM companies;

# EXERCISE
/*Using ALTER TABLE, first add the NULL constraint to the headquarters_phone_number field in the "companies" table,
 and then drop that same constraint.*/
 
ALTER TABLE companies
MODIFY company_name company_name VARCHAR (255) NOT NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name
VARCHAR(255) NOT NULL;
('+1(202) 555-0196','Company A') NOT NULL;




# NOT NULL CONSTRAINT PART 2
/* Dont comfuse a null value with the value of  0 or with a 'NONE' response! Think of a NULL VALUE as a missing value.
 NONE is assigned by the user  and NULL is assigned by the computer. for example 0 is a value so the response is NOT NULL, if the response is NONE ,
 it means is a not null response ,but in a situation the column is empty with no value at all ,them we can say is a NULL response*/
 
 # CODING TECNIQUES AND BEST PRACTICE PART 1
 
/* Complying with coding style is crucial.You will always work with  team. Your code needs to be clean .
clean code is a code that is focused and understandeable which means it must be readeable,logical and changeable.
.Note, code code is not the one ones computer understands rather is the ones humans understand.
Code in general can be organized in several ways.Good practice implies you will chose the version that wil be easiest to read and understand.
Assumption; At your work place you will always type codes cleanly- as simple as posible,perfectly oganized,maintaining a steady logical flow.
NOTE; when assigning names to variables or SQL objects , always choose shorter meaningful names , conveying specific information.
By meaningful we mean pronounceable, where one word per concept has been picked .eg. purchase_name, PurchaseNumber, is good but purcase number is not acceptable.
Names will constitute more than 80 % of your code(it matters which one you want).capital or small letters depends on your style or your company,s standard .
READEABILITY of your code.; you cant leave a blank space btw words. we have horizontal or vertical organization of code. The next one is colour, you need to orgainse your code horizontally and vertically.
Words can be written in diff. colours SQL keywords are written in blue,objects name in black,numbers in orange and so on.

3 ways to maintain your code well

1. PROFESSIONALS use ad-hoc software that re -organize code and colours diff words consistently, IN=n a more dynamic environment,
TIME is a factor & Unification of codes is top priority.it wil be impossible to have 50 professionals all writting in the same style.
 it is unprofessional to merge code written in the same language but in a diff style, so when completed pieces of working code goes 
 through such a software and your boss will have a pile of code all written in thesame style.
2.  USE the relevant analogical tools provided in workbench to beautify your code. CTRL + B.
3. If you would prefer to clean your code differently you should INTERVENE manually and adjust your code as you like.*/
 
 # CODING TECH .PART 2. PRACTICAL EXAMPLE
 
 # CREATE TABLE IF NOT EXISTS sales(numbers  INT(10),
# WORDS VARCHAR (10); USE (use CTRL + B TO beautify your code)
 
 use sales;
 
CREATE TABLE IF NOT EXISTS test (
    numbers 	INT(10),
    words 		VARCHAR(10)
);


 /* you can use the tab button to indent your work 
 ,it is called indentation ie the column names and their data types where indented to the right.*?
 
 # Another way of maintaining coding styles is using comments.
# They are lines of text that workbench will not run as code;
 /*They convey a message to someone who reads our code. example /* ,,,*/ ( for large comments use forward slash aned a star) , for one line comments (# or --) 
 lighting symbol helps you to execute your code  to diffirentiate them MySQL masks all comment in grey  Your code is seperated in blocks as marked by the semi column ; seperator/*
 
 # LOODING THE DATA
 /*PROGRAMERS uses GITHUB ; it is the best possible choice for laying the foundations of working with my SQL and relational data bases.
 also used for challenging task*/
 
