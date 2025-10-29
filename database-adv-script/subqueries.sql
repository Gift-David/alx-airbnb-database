SELECT
p.property_id,
p.name
FROM
properties p
WHERE
p.property_id IN (
SELECT
r.property_id
FROM
ratings r
GROUP BY
r.property_id
HAVING
AVG(r.rating) > 4.0
);


SELECT
u.user_id,
u.username
FROM
users u
WHERE
(
SELECT
COUNT(b.booking_id)
FROM
bookings b
WHERE
b.user_id = u.user_id
) > 3;