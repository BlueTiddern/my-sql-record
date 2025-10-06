/*


Table: Trips

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| client_id   | int      |
| driver_id   | int      |
| city_id     | int      |
| status      | enum     |
| request_at  | varchar  |     
+-------------+----------+
id is the primary key (column with unique values) for this table.
The table holds all taxi trips. Each trip has a unique id, while client_id and driver_id are foreign keys to the users_id at the Users table.
Status is an ENUM (category) type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').

Table: Users

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| users_id    | int      |
| banned      | enum     |
| role        | enum     |
+-------------+----------+
users_id is the primary key (column with unique values) for this table.
The table holds all users. Each user has a unique users_id, and role is an ENUM type of ('client', 'driver', 'partner').
banned is an ENUM (category) type of ('Yes', 'No').

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.

Return the result table in any order.


*/
/* Write your T-SQL query statement below */
WITH cte1 AS
(
    SELECT 
        t.id,
        t.client_id,
        t.driver_id,
        t.status,
        t.request_at
    FROM Trips AS t
    INNER JOIN Users AS u
    ON t.client_id = u.users_id AND u.role = 'client' AND u.banned = 'No'
    INNER JOIN Users AS d
    ON t.driver_id = d.users_id AND d.role = 'driver' AND d.banned = 'No'
    WHERE t.request_at IN ('2013-10-01','2013-10-02','2013-10-03')
),
cte2 AS
(
    SELECT
        request_at,
        count(status) AS total_c
    FROM cte1
    GROUP BY request_at
),
cte3 AS
(
    SELECT
        request_at,
        count(status) AS cancel_c
    FROM cte1
    WHERE status != 'completed'
    GROUP BY request_at
)

SELECT 
    tot.request_at AS Day,
    ROUND(CAST(COALESCE(canc.cancel_c, 0) AS FLOAT) / tot.total_c, 2) AS [Cancellation Rate]
FROM cte2 AS tot
LEFT JOIN cte3 AS canc
ON tot.request_at = canc.request_at

    
