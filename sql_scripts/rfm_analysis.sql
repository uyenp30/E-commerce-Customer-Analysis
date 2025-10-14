# Task 1: RFM (Recency - Frequency - Monetary) Analysis

-- WITH final AS (
WITH 
# Step 1: Calculate Recency, Frequency, and Monetary values for each customer
rfm_values AS (
SELECT 
	customer_id,
    DATEDIFF('2025-10-11', MAX(order_date)) AS recency, #Using today's date as the reference
	COUNT(order_id) AS frequency,
	SUM(amount) AS monetary
FROM ecommerce_orders
GROUP BY customer_id
),

# Step 2: Assign scores from 1 (worst) to 5 (best) for each criterion
rfm_scores AS (
SELECT
	customer_id,
    recency,
    frequency,
    monetary,
    NTILE(5) OVER(ORDER BY recency DESC) AS r_score, #Lower recency is better, so we sort the `recency` descendingly
    NTILE(5) OVER(ORDER BY frequency ASC) AS f_score,
    NTILE(5) OVER(ORDER BY monetary ASC) AS m_score
FROM rfm_values
)

# Step 3: Sum up the scores and assign customer segment
SELECT *, (r_score + f_score + m_score) AS rfm_score,
CASE
	#Segment 1: Best customers. High scores across the board
	WHEN r_score >= 4 AND f_score >= 4 THEN 'Champion'
	# Segment 2: Loyal customers. High frequency, recent customers
    WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal'
	# Segment 3: Potential loyalists. Recent, higher spending history, but might not have a frequency
    WHEN r_score >= 4 AND m_score >= 4 THEN 'Potential'
	# Segment 4: New customers. Purchased the most recently without long spending history
    WHEN r_score = 4 AND f_score <= 2 THEN 'New'
	# Segment 5: At risk (of churn). Good frequency and spending amount, but haven't been back for a while
    WHEN r_score <= 2 AND m_score >= 4 THEN 'At risk'
	# Segment 6: Lost customers. Low scores across the board
    WHEN r_score <=2 AND f_score <= 2 OR m_score <= 2 THEN 'Lost'
	ELSE 'Other'
END AS customer_segment
FROM rfm_scores
ORDER BY rfm_score DESC
-- )
-- SELECT customer_segment, COUNT(customer_id)
-- FROM final
-- GROUP BY customer_segment;