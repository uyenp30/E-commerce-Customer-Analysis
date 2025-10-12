CREATE TABLE ecommerce_orders (
    order_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id VARCHAR(10),
    product_category VARCHAR(50)
);