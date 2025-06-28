# 🌱 Seed Data – (`seed.sql`)

This SQL script populates the AirBnB database with **realistic sample data** for development and testing purposes. It includes records for:

- Users (hosts and guests)
- Property listings
- Bookings
- Payments
- Reviews
- Messages

> ⚠️ This script is designed for **PostgreSQL** and assumes the schema has been created.
---

## 📋 Requirements

Before running `seed.sql`, ensure that:

1. PostgreSQL is installed and running.
2. You have a database with the correct schema.
3. The `pgcrypto` extension is enabled:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "pgcrypto";

⚙️ How to Use

**Connect to your PostgreSQL database:**

bash
- psql -U your_username -d your_database

**Run the seed script:**

bash
- \i path/to/seed.sql

**Verify data:**

sql
- SELECT * FROM users;
- SELECT * FROM properties;