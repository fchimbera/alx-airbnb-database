-- This SQL script demonstrates the use of subqueries to filter properties based on average ratings.
-- It retrieves properties that have an average rating greater than 4.0.
SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- This SQL script retrieves users who have made more than 3 bookings.
-- It uses a subquery to count the number of bookings for each user and filters those with
SELECT u.user_id, u.first_name, u.last_name, u.email
FROM "User" u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
) > 3;