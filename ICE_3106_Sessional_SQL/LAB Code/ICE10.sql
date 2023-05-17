create database University
use University
create table department(
dept_name varchar(20),
Building varchar(15),
Budget numeric(12,2),
primary key (dept_name),
);
insert into department values('ICE','Wajed Mia',42.06);
select *from department
insert into department values('ICE','Wajed Mi','42.06')