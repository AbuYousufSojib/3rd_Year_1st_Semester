use pubs

select *from authors;
select *from discounts;
select *from employee;
select *from jobs;
select *from pub_info;
select *from publishers;
select *from sales;
select *from stores;
select *from titleauthor;
select *from titles;


update jobs
set max_lvl=10
where max_lvl=14;
