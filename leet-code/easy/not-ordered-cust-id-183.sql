/*

Write a solution to find all customers who never order anything.

Return the result table in any order.

*/


SELECT
    c.name AS CUstomers
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.id = o.customerId
WHERE o.customerId IS NULL
