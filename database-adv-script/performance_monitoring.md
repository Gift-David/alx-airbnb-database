CREATE TABLE bookings (
    booking_id BIGINT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT,
    start_date DATE NOT NULL,
    -- Include other necessary columns from the schema...
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

CREATE TABLE bookings_pre_2023 PARTITION OF bookings
    FOR VALUES FROM ('2000-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_future PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);


CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);

CREATE INDEX idx_bookings_user_prop_id ON bookings (user_id, property_id);


EXPLAIN ANALYZE
SELECT
    booking_id,
    start_date
FROM
    bookings
WHERE
    start_date >= '2024-05-01' AND start_date < '2024-06-01';
