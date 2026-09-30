-- How does delivery delay affect review scores?
SELECT
    o.order_id,
    r.review_score,
    julianday(o.order_delivered_customer_date) - julianday(o.order_estimated_delivery_date) AS delivery_delay_days
FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL;