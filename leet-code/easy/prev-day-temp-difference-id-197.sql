/*

Write a solution to find all dates' 
id with higher temperatures compared to its previous dates (yesterday).

*/


SELECT
    id
FROM
(SELECT
    id,
    temperature AS temp,
    LAG(temperature) OVER(ORDER BY recordDate) AS prevTemp,
    DATEDIFF(day, LAG(recordDate) OVER(ORDER BY recordDate), recordDate) AS diffdate
FROM Weather) t
WHERE temp > prevTemp AND diffdate = 1
