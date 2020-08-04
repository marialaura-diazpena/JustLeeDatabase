-build database
@c:\cprg250\Build_JLDB.sql

--Question 0: settings for output
set echo on;
set linesize 132;
set pagesize 66;
spool c:\cprg250\module4\mod4part6spool.txt

--Question 1: 
select firstname, lastname
from customers
where firstname not like '%LEILA%' and lastname != '%SMITH%' and state = 
(select state
from customers
where firstname like '%LEILA%');

--Question 2: 
select lastname, max(title), retail, avg(distinct retail)over () AS "Avg"
from customers c, books b, orders o 
where retail > (select avg(retail) from books)
and o.customer#=c.customer#
having count(title) = 1 and count(lastname)=1
group by lastname, retail
order by lastname;

--Question 4:
--4.a:
select fname ||' '|| lname as Author, max(title) as "Last Book", MAX(pubdate) as "Date Pub"
from author a, books b, bookauthor ba
where ba.authorid=a.authorid and b.isbn=ba.isbn  
group by fname, lname
order by lname, fname;

--4.b:
select fname ||' '|| lname as Author, max(title) as "Last Book", MAX(pubdate) as "Date Pub"
from author a join bookauthor ba using (authorid) join books using (isbn)
group by fname, lname
order by fname, lname;

--Question 5:
select firstname, lastname, count(order#)
from customers c, orders o
where c.customer#=o.customer# 
group by firstname, lastname
order by count(order#) desc, lastname asc
offset 10 rows fetch next 4 rows only;

--Question 6: 
select c.customer#, max(o.order#) as "Order#", sum(quantity*paideach)as"Value of Largest Order"
from customers c, orderitems oi, orders o
where c.customer#=o.customer# and o.order#=oi.order#
group by c.customer#
order by 1, 2;

spool off