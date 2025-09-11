/*

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+

Write a solution to find the employees who earn more than their managers.

*/


SELECT
e.name AS Employee
FROM Employee AS m
INNER JOIN Employee AS e
ON m.id = e.managerId
WHERE m.salary < e.salary
