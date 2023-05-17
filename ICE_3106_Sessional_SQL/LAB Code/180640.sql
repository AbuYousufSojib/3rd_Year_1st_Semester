							--This Database Created by--
--Name: Abu Yousuf
--Roll: 180640
--Course Title: Database Management Systems Sessional
--Course Code: 3106

				--From Here--
--Crerating Database Called University--
create database University;
--Using Created Database--
use University;
--Creating Table Named as department--
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

--Showing created Table using select--
select *from department;
--If we execute delete command our values will be deleted not table-- 
delete from department;

--Creating another table called course--
create table course(
course_id varchar (7) primary key,
title varchar (50),
--Introducing Foreign key--
--Foreign key actually nothing but attributes from different table which we're using in current table-- 
dept_name varchar (20) foreign key references department,
credits numeric (2,0)
);
--Inserting values to table course--
insert into course values('BIO-101', 'Intro. to Biology', 'Biology', 4),('BIO-301', 'Genetics', 'Biology', 4),('BIO-399', 'Computational Biology', 'Biology', 3),('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),('CS-190', 'Game Design', 'Comp. Sci.', 4),('CS-315', 'Robotics', 'Comp. Sci.', 3),('CS-319', 'Image Processing', 'Comp. Sci.', 3),('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),('FIN-201', 'Investment Banking', 'Finance', 3),('HIS-351', 'World History', 'History', 3),('MU-199', 'Music Video Production', 'Music', 3),('PHY-101', 'Physical Principles', 'Physics', 4);

--Showing all attributes of table course with foreign key dept_name--
select *from course;
--Drop command will delete the entire table--
drop table course;

create table instructor(
ID varchar (5) primary key,
--Not null will prevent inserting null values--
name varchar (20) not null,
dept_name varchar (20) foreign key references department,
salary numeric (8,2),
);
insert into instructor values('10101', 'Srinivasan', 'Comp. Sci.', 65000),('12121', 'Wu', 'Finance', 90000),('15151', 'Mozart', 'Music', 40000),('22222', 'Einstein', 'Physics', 95000),('32343', 'El Said', 'History', 60000),('33456', 'Gold', 'Physics', 87000),('45565', 'Katz', 'Comp. Sci.', 75000), ('58583', 'Califieri', 'History', 62000),('76543', 'Singh', 'Finance', 80000), ('76766', 'Crick', 'Biology', 72000), ('83821', 'Brandt', 'Comp. Sci.', 92000), ('98345', 'Kim', 'Elec. Eng.', 80000);

select *from instructor;

create table section(
course_id varchar (7) foreign key references course,
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
building varchar (15),
room_number varchar (7),
time_slot_id varchar (4),
--Multiple Primary Key--
primary key (course_id, sec_id, semester, year),
);

insert into section values('BIO-101', '1', 'Summer', 2017, 'Painter', '514', 'B'),('BIO-301', '1', 'Summer', 2018, 'Painter', '514', 'A'),('CS-101', '1', 'Fall',2017, 'Packard', '101', 'H'),('CS-101', '1', 'Spring', 2018, 'Packard', '101', 'F'), ('CS-190', '1', 'Spring', 2017, 'Taylor', '3128', 'E'),('CS-190', '2', 'Spring', 2017, 'Taylor', '3128', 'A'),('CS-315', '1', 'Spring', 2018, 'Watson', '120', 'D'),('CS-319', '1', 'Spring', 2018, 'Watson', '100', 'B'),('CS-319', '2', 'Spring', 2018, 'Taylor', '3128', 'C'),('CS-347', '1', 'Fall', 2017, 'Taylor', '3128', 'A'),('EE-181', '1', 'Spring', 2017, 'Taylor', '3128', 'C'),('FIN-201', '1', 'Spring', 2018, 'Packard', '101', 'B'),('HIS-351', '1', 'Spring', 2018, 'Painter', '514', 'C'),('MU-199', '1', 'Spring', 2018, 'Packard', '101', 'D'),('PHY-101', '1', 'Fall', 2017, 'Watson', '100', 'A');

select *from section;
--Using Master To erase database--
use master
--Droping it by using drop command--
drop database University
