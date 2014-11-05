--Simple Queries

--Query 1
SELECT * FROM Customer WHERE Country = "USA"

--Query 2
SELECT City, State FROM Customer WHERE Country = "USA"


-- functions that summarize and aggregate

-- Query 3
SELECT CustomerId, count(*) AS num_orders, sum(total) AS total_amount, avg(total) AS average,  max(total) AS biggest_order, min(total) AS smallest_order  
FROM Invoice GROUP BY CustomerId


-- using values in parenthesis = really handy!

-- Query 4
SELECT * FROM Customer
WHERE Country IN ("Norway", "Canada")


-- Even better:  a query-within-a-query (formally called "sub-queries")

-- First, lets get an idea with what we're doing.

-- Query 5
SELECT * FROM Invoice WHERE InvoiceDate >= "2009-01-01" AND InvoiceDate <= "2009-03-31"

-- Now lets just restrict the number of fields we return by removing * and adding the field names:

-- Query 6

SELECT distinct(CustomerId) FROM Invoice WHERE InvoiceDate >= "2009-01-01" AND InvoiceDate <= "2009-03-31"

-- Now lets combine the previous two into something very useful:

-- Query 7

SELECT * FROM Customer WHERE CustomerId IN (SELECT distinct(CustomerId) FROM Invoice WHERE InvoiceDate >= "2009-01-01" AND InvoiceDate <= "2009-03-31")


-- Advanced:  Using a join to pull together information from > 1 table

-- Query 8
SELECT Customer.*, Invoice.* FROM customer 
JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
ORDER BY CustomerId ASC