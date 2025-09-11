
/* 

Write a solution to find the second highest distinct salary from the Employee table.
If there is no second highest salary, return null 

*/


SELECT
    (SELECT MAX(salary) 
FROM Employee 
WHERE 
  salary < (SELECT 
              MAX(salary) 
            FROM 
              Employee)) AS SecondHighestSalary 
