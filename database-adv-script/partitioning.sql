-- Drop existing Booking table if it exists
DROP TABLE IF EXISTS bookings;

-- Recreate Booking table with partitioning by RANGE on start_date
CREATE TABLE bookings (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p_future VALUES LESS THAN (2030)
);

-- Example of a query that benefits from partitioning
EXPLAIN SELECT * FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
