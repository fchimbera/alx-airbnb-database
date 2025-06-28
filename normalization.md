### User Table
*user_id (PK), first_name, last_name, email, password_hash,
phone_number, role, created_at*

### Property Table
*property_id (PK), host_id (FK), name, description,
location, pricepernight, created_at, updated_at*

### Booking Table
*booking_id (PK), property_id (FK), user_id (FK),
start_date, end_date, total_price, status, created_at*

### Payment Table
*payment_id (PK), booking_id (FK), amount,
payment_date, payment_method*

### Review Table
*review_id (PK), property_id (FK), user_id (FK),
rating, comment, created_at*

### Messege Table
*message_id (PK), sender_id (FK), recipient_id (FK),
message_body, sent_at*

- All fields are atomic.
- There are single primary keys and no partial dependencies.
- All non-key attributes are fully dependent on the only the primary key






