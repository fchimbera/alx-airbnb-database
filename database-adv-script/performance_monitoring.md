Here’s a complete step-by-step example to help you fulfill that objective:

---

## 📊 1. Monitor Performance Using `EXPLAIN ANALYZE` or `SHOW PROFILE`

### ✅ Sample Query (pre-optimization):

```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 42;
```

### 🔎 Result (example):

- type: ALL (full table scan)
- key: NULL
- rows: 100000
- Extra: Using where

🔴 **Diagnosis**: No index used; full scan — not optimal for a large bookings table.

---

## 🛠 2. Suggest Schema Adjustments

### ✅ Add Index:

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
```

✔️ This index will speed up WHERE clauses filtering by `user_id`.

---

## 🔂 3. Re-Test Performance

```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 42;
```

### 🟢 Expected Improved Output:

- type: ref
- key: idx_bookings_user_id
- rows: ~5
- Extra: Using index condition

🎉 The query now uses the index, reducing rows scanned and overall execution time.

---

## 📝 4. Sample Report File: `performance_monitoring.md`

```markdown
## 📈 Performance Monitoring & Refinement Report

### Query Monitored
```sql
SELECT * FROM bookings WHERE user_id = 42;
```

### Issue Detected
- Full table scan was performed
- No index used on `user_id`

### Schema Adjustment
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
```

### Post-Change Results
- Execution plan shifted to index lookup (ref)
- Rows examined dropped from 100,000 → 5
- Execution time reduced by ~95%

### Conclusion
Adding an index on `user_id` significantly improved performance for one of the most frequent queries. Further review recommended for `start_date` and `property_id` usage patterns.
