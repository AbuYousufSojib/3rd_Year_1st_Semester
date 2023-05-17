 use University

create table department(
--Taking Variable called dept_name, setting it as Primary Key, Variable type is varchar and it'll take most of 20 character--
dept_name varchar (20) primary key,
building varchar (15),
--Variable type Numeric, Valid: 12.03,13.04,=!:12.004-- 
budget numeric (12,2),
);
--Inserting desired values using insert keyword--
insert into department values('Biology', 'Watson', 90000),('Comp. Sci.', 'Taylor', 100000),('Elec. Eng.', 'Taylor', 85000),('Finance', 'Painter', 120000),('History', 'Painter', 50000),('Music', 'Packard', 80000),('Physics', 'Watson', 70000);
--We can insert one by one as well,but it'll much more time consuming--

select *from department;

alter table department
drop column email;

drop table department;

select *from department 
where dept_name='Music';


use pubs

select *from authors;
select *from discounts;
select *from employee;
select *from jobs;
select *from pub_info;
select *from publishers;
select *from roysched;
select *from sales;
select *from stores;
select *from titleauthor;
select *from titles; 

select state,COUNT(*) from authors group by state having COUNT(*)<3;


use University

select *from course;
select *from department;
select *from instructor;
select *from section;

select building,course_id from department,course where department.dept_name=course.dept_name;

