-- This query retrieves detailed information about bookings, including user and property details, along with payment information if available. It joins the Booking table with User, Property, and Payment tables to provide a comprehensive view of each booking.
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed'
    AND p.payment_date IS NOT NULL;

-- This query analyzes the performance of the above query by using `EXPLAIN ANALYZE`. It provides insights into how the database executes the query, including the time taken for each operation and whether indexes are being utilized effectively.
-- The `EXPLAIN ANALYZE` command will show the execution plan and performance metrics
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id;

-- Indexes to improve performance for the above query
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_property_property_id ON Property(property_id);


-- This materialized view aggregates booking information along with user and property details, providing a summary of bookings.
-- It can be used for reporting or analytics purposes, allowing for faster access to booking summaries without the need to join multiple tables repeatedly.
-- The materialized view can be refreshed periodically to keep the data up-to-date.
CREATE MATERIALIZED VIEW booking_summary AS
SELECT ...
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id, 
    pay.amount,
    pay.payment_date
FROM
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id;