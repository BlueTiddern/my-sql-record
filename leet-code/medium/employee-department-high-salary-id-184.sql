/*

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

*/

SELECT
    Department,
    Employee,
    Salary
FROM
(SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary,
    MAX(e.salary) OVER(PARTITION BY d.name) AS MAX_salary
FROM Employee AS e
INNER JOIN Department AS d
ON e.departmentId = d.id
) t
WHERE Salary = MAX_salary
