-- lab 6 --

--1--
SELECT c.name, c.city, count(p.pid)
FROM customers c, products p
WHERE c.city = (SELECT p.city
		FROM (SELECT count (pid)
			FROM products p
			WHERE c.city = p.city
			GROUP BY c.city 
			ORDER BY count (pid) DESC
			LIMIT 1) AS most)
GROUP BY c.name, c.city
ORDER BY count(p.pid) DESC
LIMIT 1;
;

-- 2 --
SELECT p.name
FROM products p
WHERE p.priceUSD < (SELECT avg(priceUSD)
				FROM products)
ORDER BY p.name DESC;


--3--
SELECT DISTINCT c.name, pid, dollars
FROM customers c
INNER JOIN orders o
ON c.cid = o.cid
ORDER BY dollars DESC;

--4--
SELECT c.name , COALESCE (sum(o.dollars),0)
FROM customers c
FULL OUTER JOIN orders o
ON c.cid = o.cid
GROUP BY c.name
ORDER BY c.name DESC;

--5--
SELECT c.name, a.name, p.name
FROM customers c
FULL OUTER JOIN orders o
ON c.cid = o.cid
FULL OUTER JOIN products p
ON o.pid = p.pid
FULL OUTER JOIN agents a
ON o.aid = a.aid
WHERE a.city = 'Tokyo'

--6--
SELECT *
FROM orders o
FULL OUTER JOIN products p
ON o.pid = p.pid
FULL OUTER JOIN customers c
ON o.cid = c.cid
WHERE o.dollars != ((1-(c.discount/100))*(p.priceUSD * o.qTy))

/*  

A Left outer join returns all of the rows from the first (left) table and joins (combines) it with corresponding rows from the second (right) table. 
In the case where the left table has rows which do not correspond to the right table, nulls will be used to fill the tablespace. 
A right outer join returns all of the rows from the second (right) tables and joins (combines) it with the corresponding rows from the first (left) table.
Thus, it is the opposite of a left outer join (as one might expect) and also fills in spaces that do not correspond with nulls.
For example, say there are two (for purposes of this example, overly simple) tables, where one table is called Customers and has the columns name and customerid
and another table called OrderDate has the columns orderid, dateoflastorder, and customerid. If a user wanted to know the name of each customer along with the date they last placed 
an order the could write a query like the following:
 [ 
 SELECT customers.name, orderdate.dateoflastorder
 FROM Customers
 LEFT OUTER JOIN OrderDate
 ON Customers.customerid = OrderDate.customerid;
 ]
 Conversely, if a user only wanted to know the names of customers who have placed orders (Assuming those who have not will have a null for orderdate)
 They could use a query like this:
 [
 SELECT  customers.name, orderdate.dateoflastorder
 FROM OrderDate
 RIGHT OUTER JOIN Customers
 ON orderDate.customerid = Customers.customerid;
 ]

*/
