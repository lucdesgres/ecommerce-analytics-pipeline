-- Which states generate the most revenue, and how does delivery speed vary by region?
SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS num_orders,
    SUM(oi.price) AS total_revenue,
    AVG(julianday(o.order_delivered_customer_date) - julianday(o.order_purchase_timestamp)) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY total_revenue DESC;