-- This query retrieves all bookings along with the first and last names of the users who made those bookings.
-- It uses an INNER JOIN to combine the Bookings and Users tables based on the user_id field.
SELECT Bookings.*, Users.first_name, Users.last_name 
FROM Bookings 
INNER JOIN Users ON Bookings.user_id = Users.user_id;

-- This query retrieves allproperties and their reviews including properties that have no reviews.
-- It uses a LEFT JOIN to include all properties and their corresponding reviews, if available.
SELECT Properties.*, Reviews.rating, Reviews.comment 
FROM Properties 
LEFT JOIN Reviews ON Properties.property_id = Reviews.property_id
ORDER BY Properties.property_id;

-- This query retrieves all users and their bookings, including users who have not made any bookings.
SELECT
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM
    User u
FULL OUTER JOIN
    Booking b
ON
    u.user_id = b.user_id;
