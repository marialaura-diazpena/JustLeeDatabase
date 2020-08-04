-build database
@c:\cprg250\Build_JLDB.sql

--Question 1: settings for output
set echo on;
set linesize 132;
set pagesize 66;
spool c:\cprg250\module4\mod4part5spool.txt

--Question 2 
SELECT initcap(firstname) as "first", initcap(lastname) as "last", oi.order#, sum(quantity*paideach)"Order Ttl"
from customers c, orderitems oi, orders o
where c.customer#=o.customer# and oi.order#=o.order#
group by firstname, lastname, oi.order#
order by lastname, firstname, 4;


--Question 3 
select round(avg(count(a.authorid)), 2) "Average"
from author a, bookauthor b
where a.authorid=b.authorid
group by a.authorid;

--Question 4 
select distinct Category, count(*) AS "Num of Books", TO_CHAR(AVG(retail), '$9999.00')
from books
group by category
having COUNT(category) > 1
order by category;

--Question 5 
select fname, lname, sum(quantity)
from author a, bookauthor b, orderitems oi, orders o
where a.authorid=b.authorid and oi.order#=o.order# and oi.isbn=b.isbn
group by fname, lname
having sum(quantity) >9
order by lname;

--Question 6
SELECT initcap(firstname) as "FIRST", initcap(lastname) as "LAST", oi.order#, sum(quantity*paideach)"Value"
from customers c, orderitems oi, orders o
where c.customer#=o.customer# and oi.order#=o.order#
group by rollup((firstname, lastname), oi.order#)
order by lastname, firstname, oi.order#;

spool off