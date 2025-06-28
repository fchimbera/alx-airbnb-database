# 🏠 AirBnB Clone Database Schema

This project defines the database schema for an AirBnB-style application. It manages users, property listings, bookings, payments, reviews, and messaging functionality.

---

## 📦 Entity-Relationship Overview

The system models six core entities:

- **Users** – Guests, Hosts, and Admins
- **Properties** – Listings created by hosts
- **Bookings** – Reservations made by guests
- **Payments** – Linked to bookings
- **Reviews** – Feedback on properties
- **Messages** – Direct messages between users

Each entity includes necessary relationships, constraints, and indexes to ensure data integrity and optimal performance.

---

## 🗃️ Database Tables

### 👤 `users`

Stores all platform users, including guests, hosts, and admins.

| Column         | Type         | Constraints                         |
|----------------|--------------|-------------------------------------|
| user_id        | UUID         | Primary Key, auto-generated         |
| first_name     | VARCHAR      | Not Null                            |
| last_name      | VARCHAR      | Not Null                            |
| email          | VARCHAR      | Unique, Not Null, Indexed           |
| password_hash  | VARCHAR      | Not Null                            |
| phone_number   | VARCHAR      | Optional                            |
| role           | ENUM         | guest, host, admin (Not Null)       |
| created_at     | TIMESTAMP    | Default: current timestamp          |

---

### 🏡 `properties`

Listings created by users with the host role.

| Column        | Type        | Constraints                         |
|---------------|-------------|-------------------------------------|
| property_id   | UUID        | Primary Key, auto-generated         |
| host_id       | UUID        | Foreign Key → users(user_id)        |
| name          | VARCHAR     | Not Null                            |
| description   | TEXT        | Not Null                            |
| location      | VARCHAR     | Not Null                            |
| pricepernight | DECIMAL     | Not Null                            |
| created_at    | TIMESTAMP   | Default: current timestamp          |
| updated_at    | TIMESTAMP   | Auto-updated on record change       |

---

### 📅 `bookings`

Records of property reservations made by guests.

| Column       | Type      | Constraints                         |
|--------------|-----------|-------------------------------------|
| booking_id   | UUID      | Primary Key, auto-generated         |
| property_id  | UUID      | Foreign Key → properties(property_id) |
| user_id      | UUID      | Foreign Key → users(user_id)        |
| start_date   | DATE      | Not Null                            |
| end_date     | DATE      | Not Null                            |
| total_price  | DECIMAL   | Not Null                            |
| status       | ENUM      | pending, confirmed, canceled        |
| created_at   | TIMESTAMP | Default: current timestamp          |

---

### 💳 `payments`

Captures payment details for bookings.

| Column         | Type      | Constraints                         |
|----------------|-----------|-------------------------------------|
| payment_id     | UUID      | Primary Key, auto-generated         |
| booking_id     | UUID      | Foreign Key → bookings(booking_id) |
| amount         | DECIMAL   | Not Null                            |
| payment_date   | TIMESTAMP | Default: current timestamp          |
| payment_method | ENUM      | credit_card, paypal, stripe         |

---

### ⭐ `reviews`

User feedback on properties.

| Column       | Type     | Constraints                              |
|--------------|----------|------------------------------------------|
| review_id    | UUID     | Primary Key, auto-generated              |
| property_id  | UUID     | Foreign Key → properties(property_id)    |
| user_id      | UUID     | Foreign Key → users(user_id)             |
| rating       | INTEGER  | Check: 1 ≤ rating ≤ 5                    |
| comment      | TEXT     | Not Null                                 |
| created_at   | TIMESTAMP| Default: current timestamp               |

> Optional: Add a unique constraint on `(property_id, user_id)` to prevent multiple reviews by the same user.

---

### 💬 `messages`

Private messages between users.

| Column         | Type      | Constraints                         |
|----------------|-----------|-------------------------------------|
| message_id     | UUID      | Primary Key, auto-generated         |
| sender_id      | UUID      | Foreign Key → users(user_id)        |
| recipient_id   | UUID      | Foreign Key → users(user_id)        |
| message_body   | TEXT      | Not Null                            |
| sent_at        | TIMESTAMP | Default: current timestamp          |

---

## 🔗 Relationships Summary

| Table       | Relationship                         |
|-------------|--------------------------------------|
| properties  | Many-to-One → users (host)           |
| bookings    | Many-to-One → users (guest)          |
| bookings    | Many-to-One → properties             |
| payments    | One-to-One → bookings                |
| reviews     | Many-to-One → properties, users      |
| messages    | Many-to-Many (via sender and recipient user_ids) |

---

## 🚀 Performance Optimizations

- **Indexes**: Email (users), Foreign keys (host_id, property_id, booking_id)
- **UUIDs**: Used as primary keys for scalability
- **ENUMs**: Improve validation and reduce invalid data
- **Timestamps**: Automatically track creation and updates

---

## 🧱 Setup Instructions

1. Enable UUID generation in PostgreSQL:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "pgcrypto";


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
\i path/to/seed.sql

**Verify data:**
sql
SELECT * FROM users;
SELECT * FROM properties;
