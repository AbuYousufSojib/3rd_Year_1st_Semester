use pubs
select *from authors;
select *from titleauthor;
select *from titles;
select *from publishers;

select au_lname,city,title_id,royaltyper from authors join titleauthor on authors.au_id=titleauthor.au_id;

select au_lname,city,title_id, from authors join titleauthor on authors.au_id=titleauthor.au_id;
select title,au_fname+au_lname as Name  from titleauthor join titles on titleauthor.title_id=titles.title_id join authors on titleauthor.au_id=authors.au_id;
select title,au_fname+au_lname as Name,pub_name from authors join titleauthor on titleauthor.au_id=authors.au_id join titles on titleauthor.title_id=titles.title_id join publishers on titles.pub_id=publishers.pub_id;

select au_lname+au_lname as Au_Name,pub_name from authors,publishers where authors.city=publishers.city;

---Nested Query---
select *from titles where royalty=(select AVG(royalty) from titles);
select AVG(royalty) as Average_Royalty from titles;
select au_fname+au_lname as Name from authors join titleauthor on titleauthor.au_id=authors.au_id join titles on titleauthor.title_id=titles.title_id where (royalty in(select avg(royalty) from titles)); 

CREATE TABLE CustomerAndSuppliers
(
cusl_id CHAR (6) PRIMARY KEY CHECK (cusl_id LIKE '[CS][0-9][0-9][0-9][0-9][0-9]'),
cusl_fname CHAR(15) NOT NULL,
cusl_lname VARCHAR (15),
cusl_address TEXT,
cusl_telno CHAR (12) CHECK (cusl_telno LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cusl_city CHAR (12) DEFAULT 'Rajshahi',
sales_amnt MONEY CHECK (sales_amnt>=0),
proc_amnt MONEY CHECK (proc_amnt>=0)
);
INSERT CustomerAndSuppliers
(cusl_id,cusl_fname,cusl_lname,cusl_address,cusl_telno,cusl_city,sales_amnt,proc_amnt) VALUES
('C00001','Iqbal','Hossain','221/B Dhanmondi','017-00000000','Dhaka',0,0);

INSERT into CustomerAndSuppliers
 VALUES
('C00003','Iqsbala','Hossaidna','221/B Dhanmondi','017-00000000','Dhaka',0,0);

select *from CustomerAndSuppliers;

drop table CustomerAndSuppliers

create table Item
(
	item_id char(6) primary key check(item_id like'[P][0-9][0-9][0-9][0-9][0-9]'),
	item_name char(12),
	item_category char(10),
	item_price float(12),
	item_qoh int,
	item_last_sold date,
);
insert into Item values('P12345','NotSold','Shitty',44.56,23,'2021-2-21'),
('P12346','NotSdold','Shitsty',44.56,23,'2021-4-21');

select *from Item;

drop table Item;
select CURRENT_TIMESTAMP;
create table Item1
(
	item_id char(6) primary key check(item_id like'[P][0-9][0-9][0-9][0-9][0-9]'),
	item_name char(12),
	item_category char(10),
	item_price float(12),
	item_qoh int,
	item_last_sold datetime DEFAULT CURRENT_TIMESTAMP
);
insert into Item1 values('P12345','NotSold','Shitty',44.56,23,'2021-2-21'),
('P12346','NotSdold','Shitsty',44.56,23,'');
select *from Item1;
drop table Item1;
update Item1 
set item_qoh=25 
where item_id='P12345';
