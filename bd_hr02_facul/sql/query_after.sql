CREATE INDEX IF NOT EXISTS idx_orders_status_date
ON ua4.orders (status, order_date DESC);

CREATE INDEX IF NOT EXISTS idx_order_items_order
ON ua4.order_items (order_id);

CREATE INDEX IF NOT EXISTS idx_order_items_product
ON ua4.order_items (product_id);