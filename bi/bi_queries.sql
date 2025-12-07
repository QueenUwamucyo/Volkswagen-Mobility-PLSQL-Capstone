-- Total revenue
SELECT SUM(amount) AS total_revenue FROM Payments;

-- Most active driver
SELECT driver_id, COUNT(*) AS trips
FROM Trips
GROUP BY driver_id
ORDER BY trips DESC;

-- Maintenance cost per vehicle
SELECT vehicle_id, SUM(cost) AS total_cost
FROM Maintenance
GROUP BY vehicle_id;
