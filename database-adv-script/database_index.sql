-- Users Table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Bookings Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Properties Table
CREATE INDEX idx_properties_owner_id ON properties(owner_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);


-- Analyze index usage on bookings table
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 1;

-- Analyze index usage on properties table
EXPLAIN ANALYZE SELECT * FROM properties WHERE location = 'New York';

-- Analyze index usage on users table by created_at
EXPLAIN ANALYZE SELECT * FROM users WHERE created_at > '2023-01-01';

-- Analyze index usage on bookings by status
EXPLAIN ANALYZE SELECT * FROM bookings WHERE status = 'confirmed';
