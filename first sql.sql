CREATE DATABASE company_employee;
USE company_employee;
create table employee(
	id INT NOt NULL auto_increment,
    name varchar(255) NOT NULL,
    primary key(id)
);

-- alter table ...
-- add ..... varchar(255);

create table projects(
	id INT NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    ship_year INT,
    employee_id INT NOT NULL,
    Primary KEY(id),
    Foreign key (employee_id) references employee(id)
);

INSERT INTO employee(name)
values('chris');

insert INTO employee(name)
values('clair'), ('leon'), ('jill');

SELECT * FROM employee;

-- select * From employee limit 2;
-- select name From employee(no id);

select id as 'ID', name AS 'employee name' from employee;

-- SELECT * FROM employee ORDER by name;
-- SELECT * FROM employee ORDER by name ASC;
-- SELECT * FROM employee ORDER by name DESC;

insert into projects (name, ship_year, employee_id)
values('java project', 2002, 1),
      ('javascript project', 2004, 1),
      ('python project', 2017, 2),
	  ('java project', 2006, 3),
      ('test project', null, 3);
      
select * From projects;

-- select name From projects(no id);

Select distinct name from projects;

UPDATE projects 
set ship_year = 2003 where id = 1;
       
 -- select * From projects where ship_year<2008;
 -- select * From projects where name like '%java%';
-- select * From projects where name like '%java%' or project_id = 2;
-- select * From projects where ship_year 2017 = or project_id = 1;
select * From projects where ship_year between 2000 and 2009;

select * From projects where ship_year is null;

DELETE FROM projects where id = 5;

select * from employee 
join projects ON employee.id = projects.employee_id;

-- inner join 
select * from employee 
left join projects ON employee.id = projects.employee_id;

-- right join projects ON employee.id = projects.employee_id;


select avg(ship_year) from projects;
-- select sum(ship_year) from projects;
-- select count(ship_year) from projects;

select employee_id, count(employee_id) from projects
group by employee_id;


select e.name as employee_name, count(p.id) as num_projects
from employee as e
Left join projects as p on e.id = p.employee_id
Group by e.id
having num_projects =1;