-- Main CTE that counts the unique lat and long pairs.
-- Counts the number of the tiv 2015 entires

WITH p_count AS
(
    SELECT
        pid,
        tiv_2015,
        tiv_2016,
        COUNT(pid) OVER(PARTITION BY lat,lon) AS countz,
        COUNT(pid) OVER(PARTITION BY tiv_2015) AS countxv
    FROM Insurance
),

-- Sub CTE for the filter and aggregate on the tiv_2016
  
p_filter AS
(
    SELECT 
        SUM(f.tiv_2016) AS agg_val
    FROM Insurance AS f
    INNER JOIN p_count AS c ON f.pid = c.pid
    WHERE c.countz = 1 AND c.countxv > 1
    GROUP BY f.tiv_2015
)
-- Final cte call and round up to 2 decimal places
SELECT ROUND(SUM(agg_val),2) AS tiv_2016 FROM p_filter
