EXPLAIN ANALYZE
SELECT
 p.product_id,
 p.name,
 SUM(oi.quantity * oi.unit_price) AS revenue_30d
FROM ua4.orders o
JOIN ua4.order_items oi ON oi.order_id = o.order_id
JOIN ua4.products p ON p.product_id = oi.product_id
WHERE o.status = 'paid'
AND o.order_date >= NOW() - INTERVAL '30 days'
GROUP BY p.product_id, p.name
ORDER BY revenue_30d DESC
LIMIT 5;