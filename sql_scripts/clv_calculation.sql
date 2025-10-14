# Task 2: CLV (Customer Lifetime Value) Calculation

-- Note: I'm using a simplfied CLV formula, which is better for comparison among customers
-- CLV = Average Order Value x Purchase Frequency
-- in which
-- 		Average Order Value = Monetary Value / Frequency Value
-- 		Purchase Frequency = Frequency Value / Total Number of Customers

# Step 1: Calculate each customer's frequency and monetary values for calculating Average Purchase Value
WITH customer_metrics AS (
SELECT
	customer_id,
    COUNT(order_id) AS frequency,
    SUM(amount) AS monetary
FROM ecommerce_orders
GROUP BY customer_id
),

# Step 2: Calculate Average Order Value and Purchase Frequency
aov_and_purfreq AS (
SELECT
	customer_id,
    monetary / frequency AS avg_order_value,
    frequency / (SELECT COUNT(DISTINCT customer_id) FROM ecommerce_orders) AS purchase_freq
FROM customer_metrics
GROUP BY customer_id
)

# Step 3: Calculate CLV and assign labels for future strategies
SELECT 
	customer_id,
    avg_order_value,
    purchase_freq,
    (avg_order_value * purchase_freq) AS clv,
    CASE 
		WHEN (avg_order_value * purchase_freq) >= 5 THEN 'High Value'
        WHEN (avg_order_value * purchase_freq) >= 3 THEN 'Medium Value'
        ELSE 'Low Value'
	END AS customer_segment
FROM aov_and_purfreq
ORDER BY clv DESC;