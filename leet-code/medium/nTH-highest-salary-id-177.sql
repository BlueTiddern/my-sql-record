
/*

Write a solution to find the nth highest distinct salary from the Employee table. 
If there are less than n distinct salaries, return null.

*/


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        
        SELECT TOP 1
            salary
            FROM (SELECT
                    salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rk
                  FROM Employee) t
            WHERE rk = @N
  
    );
END
