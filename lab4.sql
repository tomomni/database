
--1--
SELECT city
FROM agents
WHERE aid IN (SELECT aid
			FROM Orders
			WHERE orders.cid = 'c006');

--2--
SELECT pid
FROM Orders
WHERE aid IN (SELECT aid 
			FROM orders
			WHERE cid IN (SELECT cid 
					FROM customers
					WHERE city = 'Kyoto'))
GROUP BY pid					
ORDER BY pid DESC;


--3--
SELECT cid, name
FROM customers
WHERE cid IN (SELECT cid
				FROM orders
				WHERE aid != 'a03');

--4--
SELECT cid
FROM orders 
WHERE pid = 'p01'

INTERSECT 

SELECT cid
FROM orders
WHERE pid = 'p07'

--5--
SELECT pid
FROM orders 
WHERE cid in(
			SELECT cid
			FROM orders

			EXCEPT

			SELECT cid
			FROM orders
WHERE aid = 'a05'
            );

--6--
SELECT name,city,discount
FROM customers
WHERE cid in (SELECT cid
		FROM orders	
		WHERE aid in (SELECT aid 
				FROM agents
				WHERE city = 'Dallas' OR city = 'New York'
				)
		);

--7--
SELECT name, discount
FROM customers
WHERE discount in (SELECT discount
			FROM customers
			WHERE city = 'Dallas' OR city ='London'

			INTERSECT

			SELECT discount 
			FROM customers) 

EXCEPT

SELECT name, discount
FROM customers
WHERE city = 'Dallas' OR city = 'London'

--8--
/*  

Check Constraints

The CHECK constraint is tool used to limit the range of values which can be placed in a 
column. If a user places a CHECK constraint on a single column it means that column will
 only allow values within the range defined by the CHECK constraint. CHECK constraints 
can also be placed on entire tables to limit the values in certain columns based on the
 values in other columns within the row. CHECK constraints allow a user to disallow 
particular data entries, this can be beneficial for preventing user errors and ensuring 
the accuracy of data. By utilizing this tool in the creation of a database one may provide
 their data base with a certain level of "integrity" by guaranteeing that the values 
stored within are all within a possible range. Some examples of good CHECK constraints 
would be on a column titled "Age" where the check constraint would ensure that the data 
inserted must be non-negative. Another example could be a check constraint that would 
limit the quantity of a product being ordered to the amount available in inventory. 
In contrast a poor use of a CHECK constraint would be on a quality like color. This
 kind of constraint would check to make sure the color being entered is an actual color.
 This is a poor use of a check constraint because it would limit new entries to existing
 colors, so if a company decided to offer a product in a new color this database would
not allow entry of the product since the color would not exist in the defined CHECK 
parameters. Checking to ensure a quality is within an appropriate range can be beneficial
 in terms of something like Age however, when the constraint checks a quality 
where the range of possible values can change, the constraint acts more as a hindrance.

*/