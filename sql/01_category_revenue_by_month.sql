-- Which product categories drive the most revenue, and how has that shifted month to month?
SELECT
    p.product_category_name,
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS revenue,
    COUNT(DISTINCT oi.order_id) AS num_orders
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name, month
ORDER BY month, revenue DESC;