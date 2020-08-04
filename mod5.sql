set echo on;
spool c:\cprg250\module5\mod5spool.txt

--Question 1:
set linesize 75
set pagesize 50
TTITLE CENTER "Customer/Title Information" SKIP CENTER "Customer Order Evaluation" SKIP 2
BTITLE SKIP 5 CENTER'Internal Use Only' 
column title format heading 'Book |Title' 
column lastname format A10 heading 'Last|Name'
column firstname format A10 heading 'First|Name' 
column cost format $999.99 heading 'Book|Cost'
break on title
select title, lastname, firstname, cost
from  books b, customers c, orders o, orderitems oi
where b.isbn=oi.isbn and c.customer#=o.customer# and o.order#=oi.order#
order by title, lastname;

--Question 2:
set pagesize 35
SET RECSEP WRAPPED
SET RECSEPCHAR "*"
TTITLE CENTER "Author/Title Information" SKIP CENTER "Author Book Cost Evaluation" SKIP 2
BTITLE CENTER'Internal Use Only'
column name format heading 'Publisher Name' skip 1 word_wrapped
column pubID format heading 'ID' skip 1 word_wrapped
column title format heading 'Book|Title'
column cost format heading 'Book|Cost'
break on name on pubID
compute sum label "Total Cost:" of cost on name 
select name, p.pubID, title, cost
from publisher p, books b
where p.pubID=b.pubID
order by name;

spool off
