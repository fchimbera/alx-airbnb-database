## Partitioning Performance Report

### Objective:
To improve query performance on the large Booking table by partitioning data based on the `start_date` column.

### Implementation:
- Table was partitioned by RANGE of `YEAR(start_date)`
- Partitions created: p2023, p2024, p2025, and p_future

### Query Tested:
```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
