-- What does customer repeat-purchase behavior look like (one-time vs. repeat buyers)?
SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS num_orders,
    SUM(oi.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY num_orders DESC;