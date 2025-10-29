SELECT
    *
FROM
    bookings b
INNER JOIN
    users u ON b.user_id = u.user_id
INNER JOIN
    properties p ON b.property_id = p.property_id
INNER JOIN
    payments pay ON b.payment_id = pay.payment_id;


SELECT
    b.booking_id,
    b.start_date,
    u.username,
    u.email AS user_email,
    p.name AS property_name,
    p.city,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM
    bookings b
INNER JOIN
    users u ON b.user_id = u.user_id
INNER JOIN
    properties p ON b.property_id = p.property_id
INNER JOIN
    payments pay ON b.payment_id = pay.payment_id
WHERE
    b.start_date >= '2024-01-01'
ORDER BY
    b.start_date DESC;


AND
EXPLAIN