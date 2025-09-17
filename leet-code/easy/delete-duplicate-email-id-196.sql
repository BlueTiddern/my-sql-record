/*

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

*/


DELETE 
FROM Person
WHERE id NOT IN (
SELECT id FROM
(
    SELECT
        id,
        email,
        ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rk
    FROM Person
) t
WHERE rk = 1)
