use pubs
select *from titleauthor
select *from authors
alter procedure Author
@title_id char(100)
AS
BEGIN
SELECT "Authors Last Name"=au_lname FROM authors where au_id in (select au_id from
titleauthor where title_id=@title_id)
END

Author @title_id='BU1032';
drop proc Author;
select *from titles;

SELECT * FROM titles WHERE royalty = (SELECT avg(royalty) FROM titles);

select au_fname from authors,titles where royalty=(select MAX(royalty) from titles);

use University
select building,"dept_count"=COUNT(dept_name),"Average"=AVG(budget) from department group by building having AVG(budget)>50000 order by building desc;


create view viewname as select *from department 

select *from viewname

select *from department cross join instructor;
select *from department;
select *from instructor;

select  *from department inner join instructor on department.dept_name=instructor.dept_name;

select instructor.name,department.dept_name,instructor.salary from department inner join instructor on department.dept_name=instructor.dept_name;

select instructor.name,department.dept_name,instructor.salary from department left outer join instructor on department.dept_name=instructor.dept_name;

select *from department left outer join instructor on department.dept_name=instructor.dept_name;

select instructor.name,department.dept_name,instructor.salary from department right outer join instructor on department.dept_name=instructor.dept_name;

select instructor.name,department.dept_name,instructor.salary from department full outer join instructor on department.dept_name=instructor.dept_name;

select *from department;
select *from instructor;

select COUNT(dept_name) as Total_Department from department;

select Max(budget) as Max_Budget from department;

select MIN(budget) as Min_Budget from department;
 0

create trigger dept on department for insert
as
begin
print'Data inserted in department table'
end

select *from department;
insert into department values('ICE','WajedMia',45000)

delete from department where dept_name='ICE'

create table CustomerAndSuppliers(
cusl_id char(6) primary key check(cusl_id like'[CS][0-9][0-9][0-9][0-9][0-9]'),
cusl_fname char(15) not null,
cusl_lname varchar(15),
cusl_address text,
cusl_telno char(12) check(cusl_telno like'[0][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cusl_city char(12) default'Rajshahi',
sales_amnt money check(sales_amnt >=0),
proc_amnt money check(proc_amnt >=0)
);

insert into CustomerAndSuppliers(cusl_id ,cusl_fname,cusl_lname,cusl_address,cusl_telno,sales_amnt,proc_amnt) values('S51234','Md.Abu','Yousuf','Natore','017-12345623',21,22);
select *from CustomerAndSuppliers;

insert into CustomerAndSuppliers values('S61234','Md.Abu','Yousuf','Natore','017-12345623',default,21,22);

use University;
drop table Item
drop table CustomerAndSuppliers

create table Item(
item_id char(6) primary key check(item_id like'[P][0-9][0-9][0-9][0-9][0-9]'),
item_name char(12),
item_category char(10),
item_price float check(item_price >=0),
item_qoh int check(item_qoh >=0),
item_last_sold date default getdate(),
);

insert into Item values('p10001','Rice','Food',22.33,12,DEFAULT)
insert into Item values('p10002','Burger','Food',22.33,12,DEFAULT)
select * from Item;
delete from Item where item_id='p10001';

drop table Transactions
use University

create table Transactions(
tran_id char(10) primary key check(tran_id like'[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id char(6) foreign key references Item(item_id),
cusl_id char(6) foreign key references CustomerAndSuppliers(cusl_id), 
tran_type char(1) check(tran_type like'[SO]'),
tran_quantity int check(tran_quantity >=0),
tran_date datetime default getdate(), 
);

select * from Transactions
insert into Transactions values('T123456789','p10001','S51234','S',2,default)
insert into Transactions values('T123456785','p10001','S61234','o',6,default)

use pubs

select * from authors;
select * from publishers;
select * from titleauthor;
select * from titles;
select * from pub_info;

select au_lname+au_fname as FullName,authors.city,publishers.pub_name from authors join publishers on authors.city=publishers.city;
