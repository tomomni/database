--1--

SELECT ordno, dollars
FROM Orders;

--2--

SELECT name, city
FROM agents
WHERE name = 'Smith';

--3--

SELECT pid, name, priceUSD
FROM products
WHERE quantity > 200000

--4--

SELECT name, city
FROM customers
WHERE city = 'Dallas'

--5--

SELECT name
FROM agents
WHERE city != 'New York'
AND city != 'Tokyo' 

--6--
SELECT *
FROM products
WHERE city != 'Dallas'
AND city != 'Duluth'
AND priceUSD >= 1.00

--7-- 
SELECT *
FROM orders 
WHERE mon = 'jan' 
OR mon = 'may'

--8--
SELECT *
FROM orders
WHERE mon = 'feb'
AND dollars >= 500

--9-- 
SELECT *
FROM orders
WHERE cid = 'c005'

--there are no orders for customer with cid c005--