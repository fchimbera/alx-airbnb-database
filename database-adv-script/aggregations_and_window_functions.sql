-- This script demonstrates the use of aggregations and window functions in SQL
-- Query to count the total number of bookings for each user
-- This query aggregates the Booking table to count how many bookings each user has made
-- The result will show each user_id along with the total number of bookings they have made 
SELECT
    property_id,
    COUNT(*) AS total_bookings
FROM
    Booking
GROUP BY
    property_id;


-- Query to rank properties based on the number of bookings
-- This query uses a window function to assign ranks to properties based on their booking counts
-- The properties with the highest number of bookings will have the lowest rank number (1)
-- The query first counts the total bookings for each property and then ranks them accordingly  
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name

SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name