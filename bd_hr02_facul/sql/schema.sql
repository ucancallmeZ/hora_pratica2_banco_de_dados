CREATE SCHEMA IF NOT EXISTS ua4;

CREATE TABLE ua4.customers (
 customer_id SERIAL PRIMARY KEY,
 full_name VARCHAR(150) NOT NULL,
 email VARCHAR(150) UNIQUE NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE ua4.products (
 product_id SERIAL PRIMARY KEY,
 name VARCHAR(150) NOT NULL,
 category VARCHAR(80),
 price NUMERIC(12,2) NOT NULL CHECK (price >= 0),
 created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE ua4.orders (
 order_id SERIAL PRIMARY KEY,
 customer_id INT NOT NULL REFERENCES ua4.customers(customer_id),
 status VARCHAR(30) NOT NULL,
 order_date TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE ua4.order_items (
 order_item_id SERIAL PRIMARY KEY,
 order_id INT NOT NULL REFERENCES ua4.orders(order_id),
 product_id INT NOT NULL REFERENCES ua4.products(product_id),
 quantity INT NOT NULL,
 unit_price NUMERIC(12,2)
);