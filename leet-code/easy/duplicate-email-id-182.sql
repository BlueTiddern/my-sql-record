
/* 

Write a solution to report all the duplicate emails.
Note that it's guaranteed that the email field is not NULL.

*/

SELECT DISTINCT
    email
FROM
    (SELECT 
        email,
        COUNT(*) AS ct
    FROM Person 
    GROUP BY email) t
WHERE ct > 1
