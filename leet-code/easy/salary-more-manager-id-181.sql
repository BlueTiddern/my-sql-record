/*

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

*/




SELECT
e.name AS Employee
FROM Employee AS m
INNER JOIN Employee AS e
ON m.id = e.managerId
WHERE m.salary < e.salary
