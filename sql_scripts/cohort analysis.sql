# Task 3: Cohort Analysis

WITH 
# Step 1: Find the first purchase month for each customer (the cohort)
first_order AS (
SELECT
	customer_id,
    DATE_FORMAT(MIN(order_date), '%Y-%m-01') AS cohort_month # Normalize the time format
FROM ecommerce_orders
GROUP BY customer_id
),

# Step 2: Join with all orders to calculate the month index for each subsequent purchase
orders_with_cohort AS (
SELECT
	eo.customer_id,
	f.cohort_month,
    TIMESTAMPDIFF(MONTH, f.cohort_month, eo.order_date) AS month_index
FROM ecommerce_orders eo
JOIN 
	first_order f ON eo.customer_id = f.customer_id
)

# Step 3: Count the number of unique customers for each cohort and month index
SELECT
    cohort_month,
    month_index,
    COUNT(DISTINCT customer_id) AS num_customers
FROM orders_with_cohort
GROUP BY cohort_month, month_index
ORDER BY cohort_month, month_index;