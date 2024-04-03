# Sales Analysis with SQL

## Introduction
This project aims to analyze sales data using SQL queries. The dataset used for analysis contains information about shipments, salespersons, products, and customers. The goal is to derive insights from the data by answering various questions related to sales performance and trends.

---

## Dataset Description
The dataset consists of the following tables:
- `shipments`: Contains details of each shipment including shipment ID, salesperson ID, product ID, amount, boxes, and date.
- `salespersons`: Includes information about salespersons such as salesperson ID and name.
- `products`: Provides details about products including product ID and name.
- `customers`: Contains information about customers such as customer ID and country.

---

# Question To Solve!

## INTERMEDIATE PROBLEMS

1. **Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?**
   - Task: Retrieve shipment details meeting specific criteria.
   - Criteria: Amount > 2,000 and Boxes < 100.
   - Action: Write SQL query to filter shipments based on criteria.

---

2. **How many shipments (sales) each of the sales persons had in the month of January 2022?**
   * Task: Calculate the number of shipments per salesperson.
   * Timeframe: January 2022.
   * Analysis: Determine distribution of workload among salespersons.

---

3. **Which product sells more boxes? Milk Bars or Eclairs?**
   + Task: Identify the product with the highest sales volume.
   + Comparison: Milk Bars vs. Eclairs.
   + Measure: Total boxes sold.

---

4. **Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?**
   - Task: Determine product performance during specified timeframe.
   - Period: First 7 days of February 2022.
   - Products: Milk Bars and Eclairs.
   
---

5. **Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?**
   * Criteria: Less than 100 customers and less than 100 boxes.
   * Day Analysis: Check if any shipments occurred on Wednesday.

## HARD PROBLEMS

1. **What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?**
   - Timeframe: First 7 days of January 2022.
   - Requirement: Salesperson with at least one shipment.
   - Task: Retrieve names of qualifying salespersons.

---

2. **Which salespersons did not make any shipments in the first 7 days of January 2022?**
   * Duration: First 7 days of January 2022.
   * Criteria: No shipments made by salespersons.
   * Analysis: Identify salespersons with zero activity.

---

3. **How many times we shipped more than 1,000 boxes in each month?**
   + Threshold: More than 1,000 boxes per shipment.
   + Period: Analyze each month.
   + Task: Count occurrences exceeding the threshold.

---

4. **Did we ship at least one box of 'After Nines' to 'New Zealand' on all the months?**
   - Product: 'After Nines'.
   - Destination: 'New Zealand'.
   - Requirement: At least one shipment in each month.
   
---

5. **India or Australia? Who buys more chocolate boxes on a monthly basis?**
   * Countries: India and Australia.
   * Product: Chocolate boxes.
   * Analysis: Compare monthly purchase volumes.


## Conclusion
This project provides insights into sales performance and trends by analyzing the provided dataset using SQL queries. The queries address various questions related to shipments, salespersons, products, and customers, allowing stakeholders to make informed decisions based on the findings.
