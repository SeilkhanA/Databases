create database lab7
  owner postgres;


create index country_name on countries(name);

create index employee_ns on employees(name,surname);

create unique index salary_comp on employees(salary)
  where salary > value1 and salary < value2;

create index sub_name on employees(substring(name from 1 to 4));

create index id_salary on employees(department_id, salary)
  where salary < value2;

create index id_budget on departments(department_id, budget)
  where budget > value2;