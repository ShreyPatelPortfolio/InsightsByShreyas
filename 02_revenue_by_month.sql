-- ============================================================
--  QUERY 1: Total Revenue by Month
--  File:    02_revenue_by_month.sql
--  Author:  Shreyas Patel
--
--  WHAT THIS DOES:
--  Groups all completed orders by month and calculates
--  total revenue, order count, and average order value.
--
--  WHAT I LEARNED:
--  DATE_FORMAT() lets you group by year-month instead of
--  grouping by every single date. Without it you get one
--  row per day, which is hard to read.
--
--  PREREQUISITE: Run 01_setup.sql first.
-- ============================================================

USE retail_sales;

-- Total revenue grouped by month
-- Goal: spot seasonal trends in sales performance

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id)                  AS total_orders,
    ROUND(SUM(sale_price), 2)        AS total_revenue,
    ROUND(AVG(sale_price), 2)        AS avg_order_value
FROM orders
WHERE status != 'Returned'          -- exclude returns from revenue
GROUP BY month
ORDER BY month ASC;


-- ============================================================
--  BONUS: Same query but broken out by region as well
--  Run this separately to see regional monthly trends
-- ============================================================

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    region,
    COUNT(order_id)                  AS total_orders,
    ROUND(SUM(sale_price), 2)        AS total_revenue
FROM orders
WHERE status != 'Returned'
GROUP BY month, region
ORDER BY month ASC, total_revenue DESC;
