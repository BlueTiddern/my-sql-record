/*

A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

*/


SELECT
    Department,
    Employee,
    Salary
FROM
(
    SELECT
        e.name AS Employee,
        d.name AS Department,
        e.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS rk
    FROM Employee AS e
    INNER JOIN Department AS d
    ON e.departmentId = d.id
) t
WHERE rk <= 3
