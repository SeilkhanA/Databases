--1
CREATE DATABASE Lab6Joins
  OWNER postgres;

--2
CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR (12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY ,
  department_name VARCHAR (50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
  employee_id serial primary key,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50),
  phone_number varchar(20),
  salary integer,
  department_id integer references departments
);


INSERT INTO locations VALUES(DEFAULT, 'asd','asd','asd','asd'),
                            (DEFAULT , 'dsa','dsa','dsa','dsa'),
                            (DEFAULT , 'qwe','qwe','qwe','qwe');

INSERT INTO departments VALUES (DEFAULT ,'q',10,1),
                               (default ,'a',10,2),
                               (11,'z',10,1),
                               (12,'s',10,2);

INSERT INTO employees VALUES(default,'sam','smith','gmail','asdaf',23,default ),
                            (default , 'dan','fort','mail','asd',23,default ),
                            (default, 'jeck','head','gmail', 'aqwer',34,default );



select * from employees,departments,locations;
--3
SELECT first_name, last_name, departments.department_id, departments.department_name
FROM employees INNER JOIN departments ON employees.department_id = departments.department_id;


--4
SELECT first_name, last_name, departments.department_id, departments.department_name
FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
WHERE departments.department_id IN(40,80);

--5
SELECT first_name, last_name, departments.department_id, departments.department_name, locations.city, locations.state_province
FROM employees INNER JOIN departments ON employees.department_id = departments.department_id
               INNER JOIN locations ON departments.location_id = locations.location_id;

--6
SELECT departments.department_id, department_name, first_name, last_name
FROM departments LEFT JOIN employees e ON departments.department_id = e.department_id;

--7
SELECT first_name, last_name, departments.department_id, department_name
FROM employees LEFT JOIN departments on employees.department_id = departments.department_id;