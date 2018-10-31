-- create database lab7
--   owner postgres;
--
--
-- create index country_name on countries(name);
--
-- create index employee_ns on employees(name,surname);
--
-- create unique index salary_comp on employees(salary)
--   where salary > value1 and salary < value2;
--
-- create index sub_name on employees(substring(name from 1 to 4));
--
-- create index id_salary on employees(department_id, salary)
--   where salary < value2;
--
-- create index id_budget on departments(department_id, budget)
--   where budget > value2;



create database Lab8;

CREATE TABLE salesman(
  salesman_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  commision DOUBLE PRECISION
);

CREATE TABLE customers(
  customer_id INTEGER PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INTEGER,
  salesman_id INTEGER REFERENCES salesman(salesman_id)
);

CREATE TABLE orders(
  ord_no INTEGER PRIMARY KEY,
  pursh_amt DOUBLE PRECISION,
  ord_date date,
  customer_id INTEGER REFERENCES customers(customer_id),
  salesman_id INTEGER REFERENCES salesman(salesman_id)
);

INSERT INTO customers VALUES(2001,'lki','Edinburgh',100,5001);

INSERT INTO customers VALUES(3001,'asd','fg',134,5002);

INSERT INTO salesman VALUES(5001,'James Hoog','New York',0.15),
                           (5002,'Nail Knite','Paris',0.13),
                           (5006, 'Mc Lyon', 'Paris', 0.14);

INSERT INTO orders VALUES (1,120,'2012-10-10',2001,5001);

CREATE ROLE gunior_dev LOGIN;

CREATE VIEW New_York_salesmen AS (select * from salesman
                                  where city = 'New York');

SELECT * from New_York_salesmen;

CREATE VIEW order_inf AS(SELECT name, cust_name from salesman,customers,orders
                         WHERE customers.customer_id = orders.customer_id AND orders.salesman_id = salesman.salesman_id);
SELECT * from order_inf;

GRANT ALL PRIVILEGES ON order_inf TO gunior_dev;

CREATE VIEW cust_with_maxgrade AS(SELECT * FROM customers
                                  WHERE grade = (Select grade from customers
                                                 ORDER By grade desc
                                                 LIMIT 1));

SELECT * FROM cust_with_maxgrade;

GRANT SELECT ON cust_with_maxgrade TO gunior_dev;

CREATE VIEW number_salesman_in_city AS(SELECT count(salesman_id) FROM salesman
                                       GROUP BY (city));

SELECT * from number_salesman_in_city;

CREATE VIEW salesman_with_many_cust AS(SELECT * from salesman
                                       WHERE salesman_id IN
                                             (select salesman_id from customers
                                              GROUP by(customers.salesman_id)
                                              HAVING count(cust_name)>1));

CREATE ROLE intern;

GRANT intern TO gunior_dev;