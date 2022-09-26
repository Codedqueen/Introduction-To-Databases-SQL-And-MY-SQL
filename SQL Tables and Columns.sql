use Sales;

# Creating A Table
# Syntax: CREATE DATABASE [IF NOT EXISTS] sales;
# CREATE TABLE table_name (column_names) CONTRAINTS;

DROP TABLE sales;


CREATE TABLE sales
(
purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
date_of_purchase DATE NOT NULL,
customer_id INT,
item_code VARCHAR(10) NOT NULL
);
# Auto increment frees you from having to insert all purchase numbers manually thru d INSERT command later.alter

DROP TABLE customers;


CREATE TABLE customers
(
customer_id INT,
first_name VARCHAR (255),
last_name VARCHAR (255),
email_address VARCHAR (255),
number_of_complaints INT
);

CREATE TABLE Customers
(
customer_id INT,
first_name VARCHAR (255) NOT NULL,
last_name VARCHAR (255) NOT NULL,
email_address VARCHAR (255) NOT NULL,
number_of_complaints INT
);


# Using Databases and Tables
# Queries are used to manipulate data within a database
# To refer to an SQL object in yr query, specify the database to w it is applied
# Set a default database OR Call a table from acertain database
# Syntax database_object . sql_object

USE sales;
SELECT * FROM customer;

SELECT * FROM sales.customer;


# Query is a command you write in SQL to retrieve info from the database you are working on,
# or alternatively, to insert, update, or delete data from it.

# To Drop Table
# DROP TABLE table_name; # used in deleting tables

DROP TABLE Sales;

# Primary Key Constraint:
# Specific Rules or Limits that we Specify in our tables.
# It outlines the r/ship between difft tables in our database.Eg NOT NULL

DROP TABLE customer;

CREATE TABLE customers
(
customer_id INT,
first_name VARCHAR (255),
last_name VARCHAR (255),
email_address VARCHAR (255),
number_of_complaints INT,
PRIMARY KEY (customer_id)
);

CREATE TABLE Item
(
item_code VARCHAR (255),
item VARCHAR (255),
unit_price NUMERIC (10,2),
company_id VARCHAR (255)
);

CREATE TABLE Companies
(
company_id VARCHAR (255),
company_name VARCHAR (255),
headquarters_phone_number INT (12)
);

DROP TABLE customercustomersales;


# Foreign Key Constraint:
# A foreign key points to the column of another table and links the 2 tables.
# It's a child table that points to a column of a Parent table. 
# It's the referencing table while the parent table is the referenced table.
# A FK in SQL is defined thru a FK constraint.It M/10s the referencial integrity within d Dbase
# We can add FK to the (customer_id) referencing d Customers table (customer_id)
# ON DELETE CASCADE-If a specific value from a parent's table primary key has been deleted,
# All the records from the child'd table refering to this value will be removed as well.


CREATE TABLE sales
(
purchase_number INT AUTO_INCREMENT,
date_of_purchase DATE,
customer_id INT,
item_code VARCHAR (10),
PRIMARY KEY (purchase_number)
);



DROP TABLE sales;

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

DROP TABLE sales;

DROP TABLE customers;

DROP TABLE item;

DROP TABLE companies;

# UNIQUE Constraint
# Unique Key is used whenever you would like to specify that you dont want to 
# see duplicate data in a given field. It's implemented thru the nique Constraint
#

CREATE TABLE customers (
customer_id INT,
first_name VARCHAR (255),
last_name VARCHAR (255),
email_address VARCHAR (255),
number_of_complaints INT,
PRIMARY KEY (customer_id),
UNIQUE KEY (email_address)
);

DROP TABLE customers;

CREATE TABLE customers (
customer_id INT,
first_name VARCHAR (255),
last_name VARCHAR (255),
email_address VARCHAR (255),
number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD UNIQUE KEY (email_address);

# Indexes - Unique keys in MySql have the same role as indexes
# But the reverse is not the case. Index of a table is an orgnal unit
# that helps to retrieve data more easily but the cost is that it takes more time
# to update a table cos indexes must be updated too and that's time consuming
# It is assigned to a column for easy retrieval of info, hence the automatic treatment 
# of a Unique Key as an Index in Mysql. To remove a Unique Key from a table, Use;
# ALTER TABLE table_name
# DROP INDEX unique_key_field 

# TO DROP THE UNIQUE KEY CONSTRAINT

ALTER TABLE customers
DROP INDEX email_address;

DROP TABLE customers;

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT,
first_name VARCHAR (255),
last_name VARCHAR (255),
email_address VARCHAR (255),
number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD COLUMN gender ENUM ('M', 'F') AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365datascience.com', 0);

# DEFAULT Contraints
# It assigns a particular default value to every row of a column. A value difft from the default
# can be stored in a field where the DEFAULT Constraint has been applied, 
# only if specifically indicated

CREATE TABLE Customers 
(
customer_id INT,
first_name VARCHAR (255),
last_name VARCHAR (255),
email_address VARCHAR (255),
number_of_complaints INT DEFAULT 0,
PRIMARY KEY (customer_id)
);

# We can reassign the DEFAULT to the number_of_colmns row by dropping the customers table
# and assigning the DEFAULT or Altering the table. With CHANGE, repeat the name of the row

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M')
;

SELECT * FROM customers;


CREATE TABLE companies
(
company_id VARCHAR (255),
company_name VARCHAR (255),
headquarters_phone_number VARCHAR (255),
UNIQUE KEY (headquarters_phone_number)
);

# Primary key constaints:
# Constraints are specific rules, or limits we define in our tables.
# The role of constraints is to outline the existing r/ships btw difft tables in our Dbase.alter





