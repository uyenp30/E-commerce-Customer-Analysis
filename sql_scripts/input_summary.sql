# Check the input data
SELECT * FROM ecommerce_orders LIMIT 10;

# Check customers and orders' information
SELECT
	COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(order_id) AS total_orders,
    MIN(order_date),
    MAX(order_date)
FROM ecommerce_orders;