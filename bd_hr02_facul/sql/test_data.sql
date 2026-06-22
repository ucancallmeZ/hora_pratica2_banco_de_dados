INSERT INTO ua4.customers (full_name, email) VALUES
('Ana Souza','ana+demo@exemplo.com'),
('Bruno Lima','bruno+demo@exemplo.com'),
('Carla Dias','carla+demo@exemplo.com');

SELECT * FROM ua4.customers;

INSERT INTO ua4.products (name, category, price) VALUES
('Fone X200','Audio',299.90),
('Mouse Pro','Perifericos',149.90),
('Teclado Mecanico','Perifericos',499.00);

SELECT * FROM ua4.products;

INSERT INTO ua4.orders (customer_id, status, order_date)
VALUES
(1,'paid', NOW() - INTERVAL '20 days'),
(1,'paid', NOW() - INTERVAL '2 days'),
(2,'paid', NOW() - INTERVAL '35 days'),
(3,'canceled', NOW() - INTERVAL '1 day');

SELECT * FROM ua4.orders;

INSERT INTO ua4.order_items (order_id, product_id, quantity, unit_price)
VALUES
(1,1,1,299.90),
(1,2,2,149.90),
(2,3,1,499.00),
(3,1,1,299.90),
(4,2,1,149.90);