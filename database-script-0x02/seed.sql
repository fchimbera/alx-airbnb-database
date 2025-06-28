-- Sample Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'Alice', 'Lee', 'alice@example.com', 'hashed_pw_1', '123-456-7890', 'guest'),
    (gen_random_uuid(), 'Brendon', 'Johnson', 'brendon@example.com', 'hashed_pw_2', '234-567-8901', 'host'),
    (gen_random_uuid(), 'Kate', 'Williams', 'kate@example.com', 'hashed_pw_3', '345-678-9012', 'guest'),
    (gen_random_uuid(), 'Dave', 'Shappel', 'dave@example.com', 'hashed_pw_4', '456-789-0123', 'host');

-- Retrieve host IDs for property linkage
-- NOTE: Run SELECT * FROM users WHERE role = 'host'; to get actual UUIDs before inserting into properties

-- Sample Properties (manually insert host_id from previous step)
-- Replace 'host_id_1' and 'host_id_2' with actual host UUIDs
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
    (gen_random_uuid(), 'host_id_1', 'Modern Loft', 'A cozy loft in downtown', 'New York, USA', 120.00),
    (gen_random_uuid(), 'host_id_2', 'Seaside Bungalow', 'Peaceful stay near the beach', 'Cape Town, South Africa', 90.00);

-- Retrieve guest and property IDs for bookings
-- Run: SELECT * FROM users WHERE role = 'guest';
-- Run: SELECT * FROM properties;

-- Sample Bookings (replace UUIDs accordingly)
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (gen_random_uuid(), 'property_id_1', 'guest_id_1', '2025-07-01', '2025-07-05', 480.00, 'confirmed'),
    (gen_random_uuid(), 'property_id_2', 'guest_id_2', '2025-07-10', '2025-07-12', 180.00, 'pending');

-- Sample Payments (link to booking_id)
-- Replace with booking UUIDs
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (gen_random_uuid(), 'booking_id_1', 480.00, 'credit_card'),
    (gen_random_uuid(), 'booking_id_2', 180.00, 'paypal');

-- Sample Reviews
-- Replace with actual user_id and property_id combinations
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (gen_random_uuid(), 'property_id_1', 'guest_id_1', 5, 'Amazing stay! Clean and central.'),
    (gen_random_uuid(), 'property_id_2', 'guest_id_2', 4, 'Nice and quiet, would recommend.');

-- Sample Messages
-- Replace with valid sender/recipient user_id
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (gen_random_uuid(), 'guest_id_1', 'host_id_1', 'Hi, is your property available for early check-in?'),
    (gen_random_uuid(), 'host_id_1', 'guest_id_1', 'Yes, you can check in by noon.');