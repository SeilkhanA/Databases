CREATE DATABASE Lab4
  OWNER postgres;

CREATE TABLE customers(
  customer_id INTEGER PRIMARY KEY,
  cust_name VARCHAR(100),
  city VARCHAR(80),
  grade INTEGER,
  salesman_id INTEGER REFERENCES salesman(salesman_id)
);

CREATE TABLE orders(
  ord_no INTEGER,
  purch_amt DOUBLE PRECISION,
  ord_date TIME,
  customer_id INTEGER REFERENCES customers(customer_id),
  salesman_id INTEGER REFERENCES salesman(salesman_id)
);

CREATE TABLE salesman(
  salesman_id INTEGER PRIMARY KEY ,
  name VARCHAR(100),
  city VARCHAR(80),
  commission DOUBLE PRECISION
);


INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3002,'Nick Romando', 'New York', 100,5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3003,'Alice Durnb', 'California', 101,5002);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3004,'Fabian Johns','Paris',300,5006),
                                                                                (3007,'Brad Davis','New York',200,5001),
                                                                                (3009,'Geoff Camero','Berlin',100,5003),
                                                                                (3008,'Julian Green','London',300,5002);
SELECT * FROM customers;


--3

SELECT sum(purch_amt) FROM orders;

--4
SELECT avg(purch_amt) FROM orders;

--5
SELECT count(cust_name) FROM customers WHERE cust_name IS NOT NULL;

--6
SELECT min(purch_amt) FROM orders;

--7
SELECT * FROM customers
    WHERE cust_name LIKE '%b';


--8

--SELECT * FROM orders
--WHERE (SELECT customer_id FROM customers WHERE (SELECT city FROM customers WHERE city = 'New York'));
SELECT * FROM orders
WHERE customer_id IN
      (SELECT customer_id FROM customers WHERE city='New York');
--9
--SELECT * FROM customers WHERE (SELECT customer_id FROM orders WHERE (SELECT purch_amt FROM orders WHERE purch_amt > 10));
SELECT * FROM customers
WHERE customer_id IN
      (SELECT customer_id from orders WHERE purch_amt > 10);
--10
SELECT sum(grade) FROM customers;

--11
SELECT * FROM customers WHERE cust_name IS NOT NULL;

--12
SELECT max(grade) FROM customers;
--DROP TABLE customers;
--DROP TABLE orders;
