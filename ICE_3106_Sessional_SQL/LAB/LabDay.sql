select * from authors;
select * from titleauthor;
select * from titles;
select * from publishers;

select title,ytd_sales from titles where ytd_sales>8000;

select title,royalty from titles where royalty>=12 and royalty<=24;

select title,royalty from titles where royalty between 12 and 24 order by royalty;

select "Max"=MAX(royalty)  from titles;

select type,avg(royalty) from titles group by type;


select type,AVG(price) as Avg_price,sum(ytd_sales) as total from titles group by type;

select * from authors;
select * from titleauthor;
select * from titles;
select * from publishers;

select "Name"=au_fname+ ' ' + au_lname,title  from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id;


select "Name"=au_fname+ ' ' + au_lname,title,pub_name  from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id join publishers on titles.pub_id=publishers.pub_id;


select au_fname+au_lname as Name,authors.city  from authors join publishers on authors.city=publishers.city;


select MAX(royalty) from titles;

select au_fname+au_lname as Name  from authors join titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id where royalty in (select MAX(royalty) from titles);