/*

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

*/



SELECT DISTINCT
    num AS ConsecutiveNums
FROM
    (SELECT
        num,
        CASE
            WHEN 
                num = LAG(num) OVER(order by id)
                AND 
                num = LEAD(num) OVER(order by id)
            THEN 1
            ELSE 0
        END AS flag
    FROM Logs) t
WHERE flag = 1;
