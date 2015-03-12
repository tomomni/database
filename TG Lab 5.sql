-- TG Lab 5 -- 

-- 1 -- 
SELECT a.city
FROM agents a 
INNER JOIN orders o
ON a.aid = o.aid
WHERE o.cid ='c006';

-- 2 -- 
SELECT o2.pid
FROM orders o1
INNER JOIN customers c
ON o1.cid = c.cid
INNER JOIN orders o2 on o2.aid = o1.aid
WHERE c.city = 'Kyoto'
GROUP BY o2.pid
ORDER BY o2.pid DESC;

-- 3 --
SELECT name
FROM customers as c
WHERE cid IN (SELECT cid
		FROM customers
		
		EXCEPT

		SELECT cid
		FROM orders);

--4--
SELECT name
FROM customers as c
FULL OUTER JOIN orders as o1
ON o1.cid = c.cid
WHERE o1.cid is null
-- returns the same if you use a left join instead of an outer join --

--5--
SELECT distinct c.name, a.name
FROM customers c
INNER JOIN orders o1 
ON o1.cid = c.cid
INNER JOIN agents a 
ON o1.aid = a.aid
WHERE c.city = a.city

--6--
SELECT distinct c.name, a.name, c.city, a.city 
FROM customers c
INNER JOIN agents a
ON c.city = a.city

--7--
SELECT c.name, c.city
FROM customers c
WHERE c.city = (SELECT city
		FROM (SELECT count (pid)
			FROM products p
			WHERE c.city = p.city
			GROUP BY c.city 
			ORDER BY count (pid) ASC
			LIMIT 1) as fewest)
LIMIT 1;