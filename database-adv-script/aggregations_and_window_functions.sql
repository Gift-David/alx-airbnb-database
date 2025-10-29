SELECT user_id, COUNT(booking_id) AS total_bookings_made FROM bookings GROUP BY user_id ORDER BY total_bookings_made DESC;

WITH PropertyBookingCounts AS (
    SELECT
        property_id,
        COUNT(booking_id) AS total_bookings_received
    FROM
        bookings
    GROUP BY
        property_id
)

SELECT property_id, total_bookings_received, RANK() OVER (ORDER BY total_bookings_received DESC) AS property_rank FROM PropertyBookingCounts ORDER BY property_rank ASC, total_bookings_received DESC;

ROW_NUMBER()