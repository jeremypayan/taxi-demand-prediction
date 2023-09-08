SELECT TIMESTAMP_TRUNC(trip_end_timestamp,DAY) AS day,  ROUND(SUM(fare), 1) AS daily_revenues, COUNT(DISTINCT unique_key) AS total_rides
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
WHERE CAST(trip_end_timestamp AS DATE) < DATE_SUB(CURRENT_DATE(), INTERVAL 38 DAY)
GROUP BY day
ORDER BY day DESC;
