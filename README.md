# 🛒📊 E-Commerce Customer Analytics with SQL
Which customers are most valuable? Are customers returning?
This SQL project analyzes e-commerce transaction data to understand customer behavior, segment users, and drive business strategy.

---

## 📌 Project Objectives

This project aims to leverage SQL to perform deep dives into e-commerce customer transaction data. The primary goal is to uncover actionable insights that can drive targeted marketing campaigns, improve customer retention, and enhance overall business strategy. Specifically, it focuses on answering the following key business questions:

-   **👑 Who are the best customers? (RFM Analysis)**

    → Segmenting customers based on their Recency, Frequency, and Monetary value to identify VIPs, at-risk customers, and more, enabling personalized engagement strategies.

-   **💰 What is the Customer Lifetime Value (CLV)?**

    → Calculating the long-term value each customer brings to the business, helping to prioritize customer relationship management and resource allocation.

-   **🔄 Do customers keep coming back? (Cohort Analysis)**

    → Analyzing customer retention rates over time to understand loyalty, identify critical churn points, and evaluate the effectiveness of retention initiatives.

After that, I will translate this complex SQL analysis into intuitive dashboards (using Tableau) for stakeholders to make informed, data-driven decisions.

---

## 📁 Dataset

-   **Source**: ShopNow's E-commerce Orders Dataset
-   **Rows**: ~5,000 orders from ~500 customers
-   **Features**:
    -   `order_id`: Unique identifier for each order
    -   `customer_id`: Unique identifier for each customer
    -   `order_date`: Date the order was placed (2019-2024)
    -   `amount`: Value of the order
    -   `product_id`: Identifier for the product
    -   `product_category`: Category of the product (e.g., Fashion, Books)

---

## 🛠️ Tools & Libraries

![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=sql&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=flat&logo=tableau&logoColor=white)

---

## 📈 Workflow Summary

1.  **Database Setup:** Loaded the raw CSV data into a MySQL database and created the table schema.
2.  **RFM Analysis:** Wrote complex SQL queries using CTEs and the `NTILE()` window function to calculate Recency, Frequency, and Monetary scores, then segmented customers into groups like 'Champions' and 'At Risk'.
3.  **CLV Calculation:** Developed a simplified CLV model in SQL to rank customers by their long-term value, combining Average Order Value and Purchase Frequency.
4.  **Cohort Analysis:** Used advanced date functions like `DATE_FORMAT()` and `TIMESTAMPDIFF()` to group customers into monthly cohorts and track their retention over a 60-month period.
5.  **Data Visualization:** Exported the analysis results to CSV and connected them in Tableau. Built a comprehensive, interactive dashboard with multiple charts to visualize the findings and tell a clear data story.


---

## 🧠 Results

![E-Commerce Dashboard Preview_1](./Dashboard%20Preview/RFM%20Customer%20Segment%20-%20CLV%20Dashboard.png)

### Insight 1: The Customer Base is Severely Polarized.

The analysis reveals a stark contrast between a small, highly valuable group and a large, inactive base. The **'Lost'** segment is the largest single group with 159 customers, but the **'Champion'** (98) and **'Loyal'** (117) segments are the clear revenue drivers. For example, 89% of 'Champions' (87 out of 98) are classified as 'High Value' customers.

### Insight 2: High-Value Customers are at Significant Risk of Churning.

A critical finding is that the **At Risk** segment contains a large number of previously valuable customers. Specifically, 61 **'High Value'** and 87 **'Medium Value'** customers are in this group, meaning 148 valuable customers have not purchased recently and are in danger of being lost permanently.



![E-Commerce Dashboard Preview_1](./Dashboard%20Preview/Cohort%20Retention%20Dashboard.png)

### Insight 3: First-Month Retention is Critically Low, but Long-Term Loyalty Exists.

The Cohort Heatmap shows a consistent and dramatic drop-off immediately after the first purchase. For most cohorts, Month 1 retention (the second column) falls to **between 25% and 35%**, indicating a failure to engage new customers for a second purchase. However, the data also shows that customers who remain active past the first few months, like the **December 2021** cohort, can show strong long-term retention, with rates staying between **5-15%** even after a year.

---

## 💼 Business Impact and Suggestions

### Suggestion 1: Nurture High-Value Customers
-   **Action:** Implement a VIP program for the **'Champions'** and **'Loyal'** segments. Offer exclusive perks like early access to sales, personalized recommendations, and a points-based reward system.
-   **Impact:** Increase retention of the most profitable customer groups and solidify their brand loyalty.

### Suggestion 2: Launch a Targeted Win-Back Campaign
-   **Action:** Immediately target the **'High Value'** and **'Medium Value'** customers within the **'At Risk'** segment with a personalized "We Miss You" campaign, offering a compelling, time-sensitive discount to encourage their next purchase.
-   **Impact:** Prevent churn of valuable customers and recapture a significant portion of at-risk revenue.

### Suggestion 3: Improve the New Customer Onboarding Experience
-   **Action:** Develop an automated welcome email series for all new customers. Include a special offer or free shipping on their second purchase to incentivize a quick return.
-   **Impact:** Improve Month 1 retention rates across all future cohorts, increasing the overall Customer Lifetime Value.

---

## ✨ Key Learnings

-   **Advanced SQL:** Gained proficiency in writing complex queries with multiple CTEs, using window functions (`NTILE`) for ranking, and performing advanced date manipulation (`TIMESTAMPDIFF`, `DATE_FORMAT`) for cohort analysis.
-   **Customer Segmentation:** Applied industry-standard marketing analytics models (RFM, CLV, Cohort Analysis) to translate raw data into strategic, behavior-based customer segments.
-   **Data Visualization & Storytelling:** Learned to build a multi-sheet, interactive dashboard in Tableau that effectively communicates key insights and tells a clear, data-driven story.
-   **Business Acumen:** Practiced translating analytical findings into actionable business recommendations aimed at driving revenue and improving customer retention.

---

## 🌱 About Me

I'm a self-taught data enthusiast and economics student passionate about using data to solve real-world problems.  
This project was part of my learning journey in Data Analytics, and you can find more of my work [here](https://github.com/uyenp30/Data-Projects) 💻🌻

---

*Thank you for reading!* ✨  
*If you found this useful or have feedback, feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/uyen-pham-data/).*  
