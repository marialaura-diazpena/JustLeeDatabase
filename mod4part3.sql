-build database
@c:\crpg250\module4\Build_JLDB.sql

--Question 1: settings for output
set echo on;
set linesize 132;
set pagesize 66;
spool c:\cprg250\module4\mod4part3spool.txt

--Question 2: 
--part A
SELECT UNIQUE FirstName, LastName, oi.Order#, Item#,  Title, Gift
FROM Customers c, Orders o, OrderItems oi, Books b, Promotion p
WHERE c.Customer#=o.Customer# and o.order#=oi.order# and oi.isbn=b.isbn and b.retail between p.minretail and p.maxretail
ORDER BY Lastname;

--part B
SELECT Firstname, Lastname, o.Order#, Item#, Title, Tift
FROM Customers c JOIN Orders o ON(c.Customer#=o.Customer#) JOIN Orderitems oi ON(o.Order# = oi.Order#) JOIN Books b ON(oi.isbn=b.isbn) JOIN Promotion p ON(retail BETWEEN minretail and maxretail)
ORDER BY Lastname;

--Question 3: 
--part A
SELECT UNIQUE FirstName ||' '|| LastName AS "Customer name", fname ||' '|| lname AS "Author Name"
FROM customers c, orders o, orderitems oi, books b, bookauthor ba, author a
WHERE c.customer#=o.customer# AND o.order#=oi.order# AND oi.isbn=b.isbn AND b.isbn=ba.isbn AND ba.authorid = a.authorid
ORDER BY "Customer name";

--part B
SELECT UNIQUE firstname ||' '|| lastname AS "Customer name", fname ||' '|| lname AS  "Author Name"
FROM customers NATURAL JOIN orders NATURAL JOIN orderitems NATURAL JOIN books NATURAL JOIN bookauthor NATURAL JOIN author
ORDER BY "Customer Name";

--part C 


--part D 
SELECT UNIQUE firstname ||' '|| lastname as "Customer Name", fname ||' '|| lname as  "Author Name"
FROM  customers c JOIN orders o on(c.customer#=o.customer#) JOIN orderitems oi on (o.order#=oi.order#) JOIN books b on (oi.isbn=b.isbn) JOIN bookauthor ba on (b.isbn=ba.isbn) JOIN author a on (ba.authorid=a.authorid)
order by "Customer Name";

--Question 4:
SELECT fname, lname, title
FROM author FULL OUTER JOIN bookauthor USING(authorid) LEFT OUTER JOIN books USING(isbn)
ORDER BY lname;


spool off