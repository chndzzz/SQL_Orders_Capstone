-- QUERY TO CREATE NEW DATABASE
CREATE DATABASE Assignment;


-- QUERY TO ACCESS THE DATABASE
USE Assignment;


-- QUERY TO CREATE CUSTOMER TABLE
CREATE TABLE customer(
customer_id INT,
first_name varchar(25),
last_name varchar(25),
email varchar(30),
address varchar(30),
city varchar(20),
state varchar(20),
zip int);


-- QUERY TO INSERT THE VALUES INTO CUSTOMER TABLE
INSERT INTO customer
values (1,'Geet','Raj','geetraj@gmail.com','BHills-29','San Jose','California',412565),
(2,'John','Deere','john11@gmail.com','Seminary Road','San Jose','California',562341),
(3,'Abram','Khan','khanabram@gmail.com','Moscow Heights - 12','Bangalore','Karnataka',457264),
(4,'Gautam','Sanjeev','sanjugautam12@gmail.com','Falcon Hills - 35','Pune','Maharashtra',444460),
(5,'Gail','Hardy','gail39@gmail.com','Skagen 29','Merida','Mexico',445691);

-- QUERY TO GET THE OUTPUT
SELECT * FROM customer;


-- QUERY TO SELECT FIRST_NAME AND LAST_NAME COLUMNS FROM CUSTOMER TABLE
SELECT first_name,last_name from customer;


-- QUERY TO SELECT FIRST_NAME STARTING WITH "G" AND CITY IS "SAN JOSE"
SELECT * FROM customer
WHERE first_name like 'G%' and city ='San Jose';


-- QUERY TO CREATE ORDERS TABLE
CREATE TABLE Orders (
order_id INT,
order_date DATE,
amount INT,
customer_id INT);


-- QUERY TO INSERT VALUES IN ORDERS TABLE
INSERT INTO Orders
VALUES (101,'01/01/2021',5000,2),
(102,'01/14/2021',6500,3),
(103,'01/27/2021',2300,4),
(104,'02/02/2021',5040,6),
(105,'02/07/2021',1570,8),
(106,'01/23/2021',5000,2),
(107,'01/11/2021',600,3),
(108,'02/02/2021',2300,4),
(109,'02/05/2021',450,4),
(110,'02/07/2021',1530,8);

-- QUERY TO GET OUTPUT
SELECT * FROM Orders;


-- QUERY TO PERFORM INNER JOIN BETWEEN customer AND orders TABLE
SELECT c.customer_id, o.order_id, c.first_name, c.last_name, o.order_date, o.amount,
c.email, c.address, c.city, c.state, c.zip
FROM customer c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;


-- QUERY TO PERFORM LEFT JOIN ON customer AND orders TABLE
SELECT c.customer_id, o.order_id, c.first_name, c.last_name, o.order_date, o.amount,
c.email, c.address, c.city, c.state, c.zip
FROM customer c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;


-- QUERY TO PERFORM RIGHT JOIN ON customer AND orders TABLE
SELECT c.customer_id, o.order_id, c.first_name, c.last_name, o.order_date, o.amount,
c.email, c.address, c.city, c.state, c.zip
FROM customer c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;


-- QUERY TO UPDATE THE AMOUNT AS 100 FOR THE CUSTOMER_ID = 3
UPDATE Orders
SET amount = 100
WHERE customer_id = 3;

SELECT * FROM Orders;

-- QUERY TO FIND MINIMUM, MAXIMUM AND AVERAGE AMOUNT FROM ORDERS TABLE USING INBUILT FUNCTIONS
SELECT MIN(amount) AS 'MINIMUM AMOUNT', MAX(amount) AS 'MAXIMUM AMOUNT', AVG(amount) AS 'AVERAGE AMOUNT' FROM Orders;


-- QUERY TO CREATE USER-DEFINED FUNCTION TO MULTIPLY A GIVEN NUMBER
CREATE FUNCTION PROD (@NUM INT)
RETURNS INT
AS
BEGIN
	RETURN(SELECT @NUM*10)
END;

-- QUERY TO GET THE OUTPUT
SELECT DBO.PROD (5) AS 'MULTIPLICATION';


-- QUERY TO PERFORM CASE STATEMENT
CREATE FUNCTION COMPARISON (@N INT)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @COMP AS VARCHAR(30) = CASE
	WHEN @N<200 THEN CONCAT(@N,' is less than 200.')
	WHEN @N=200 THEN CONCAT(@N,' equal to 200.')
	WHEN @N>200 THEN CONCAT(@N,' is greater than 200.')
	END;
RETURN @COMP
END;

-- QUERY TO PRINT THE OUTPUT
PRINT DBO.COMPARISON (100);


-- QUERY TO ARRANGE ORDERS DATASET IN DECREASING ORDER OF AMOUNT
SELECT * FROM Orders
ORDER BY (amount) DESC;


-- QUERY TO CREATE EMPLOYEE_DETAILS1 TABLE
CREATE TABLE Employee_details1 (
Emp_id INT,
Emp_name VARCHAR(40),
Emp_salary int);


-- QUERY TO INSERT VALUES IN EMPLOYEE_DETAILS1
INSERT INTO Employee_details1
VALUES (101, 'Joseph Tribbiani', 25000),
(102, 'Monica Geller', 30000),
(103, 'Chandler Bing', 50000),
(104, 'Gunther', 15000),
(105, 'Rachel Green', 30000);

SELECT * FROM Employee_details1;


-- QUERY TO CREATE EMPLOYEE_DETAILS2 TABLE
CREATE TABLE Employee_details2 (
Emp_id INT,
Emp_name VARCHAR(40),
Emp_Salary INT);


-- QUERY TO INSERT VALUES IN EMPLOYEE_DETAILS2
INSERT INTO Employee_details2
VALUES (101, 'Joseph Tribbiani', 25000),
(102, 'Phoebe Buffay', 30000),
(103, 'Chandler Bing', 50000),
(104, 'Ross Geller', 70000),
(105, 'Rachel Green', 30000);

SELECT * FROM Employee_details2;


-- QUERY TO APPLY UNION OPERATOR ON BOTH TABLES
SELECT * FROM Employee_details1
UNION
SELECT * FROM Employee_details2;


-- QUERY TO APPLY INTERSECT OPERATOR ON BOTH TABLES
SELECT * FROM Employee_details1
INTERSECT
SELECT * FROM Employee_details2;


-- QUERY TO APPLY EXCEPT OPERATOR ON BOTH TABLES
SELECT * FROM Employee_details1
EXCEPT
SELECT * FROM Employee_details2;


-- QUERY TO CREATE VIEW TO GET OUTPUT OF CUSTOMERS WHO ARE FROM SAN JOSE
CREATE VIEW customer_san_jose
AS
	SELECT * FROM customer
	WHERE city='San Jose';

SELECT * FROM customer_san_jose;


-- QUERY TO PERFORM TRANSACTION ON CUSTOMER TABLE
BEGIN TRANSACTION
UPDATE customer
SET first_name= 'Francis'
WHERE last_name= 'Jordan';


-- QUERY TO ROLLBACK TRANSACTION
ROLLBACK TRANSACTION;


-- QUERY TO SET FIRST NAME AS ALEX FOR THE LAST NAME AS JORDAN
UPDATE customer
SET first_name= 'Alex'
WHERE last_name= 'Jordan';