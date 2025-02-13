-- Answer 6
SELECT
 date(g.lpep_pickup_datetime),
 zdo."Zone",
 g."DOLocationID" AS DOloc,
 zpu."Zone",
 g."PULocationID" AS PUloc,
 g.tip_amount
FROM
 green_data as g
JOIN
  zones as zpu ON g."PULocationID" = zpu."LocationID"
 JOIN
  zones as zdo ON g."DOLocationID" = zdo."LocationID"
WHERE
 extract(year from g.lpep_pickup_datetime) = 2019
 AND extract(month from g.lpep_pickup_datetime) = 10
 AND zpu."Zone" LIKE '%East Harlem North%'
ORDER BY
 g.tip_amount DESC
LIMIT 5;