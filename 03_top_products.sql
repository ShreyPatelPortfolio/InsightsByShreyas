-- ============================================================
--  QUERY 2: Top 10 Best-Selling Products
--  File:    03_top_products.sql
--  Author:  Shreyas Patel
--
--  WHAT THIS DOES:
--  Joins the orders and products tables to find which
--  products drove the most total revenue. Excludes returns.
--
--  WHAT I LEARNED:
--  This was my first JOIN. The key idea: both tables share
--  a column called product_id, so SQL uses that column to
--  "match" each order row with the right product row.
--
--  Think of it like VLOOKUP in Excel — but for two tables
--  that live in the same database.
--
--  PREREQUISITE: Run 01_setup.sql first.
-- ============================================================

USE retail_sales;

-- Top 10 products by total revenue (excluding returns)

SELECT
    p.product_name,
    p.category,
    COUNT(o.order_id)            AS units_sold,
    ROUND(SUM(o.sale_price), 2)  AS total_revenue,
    ROUND(AVG(o.sale_price), 2)  AS avg_selling_price
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.status != 'Returned'
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
--  BONUS: Calculate profit margin per product
--  sale_price - cost_price = profit per unit
-- ============================================================

SELECT
    p.product_name,
    p.category,
    p.cost_price,
    ROUND(AVG(o.sale_price), 2)                             AS avg_sale_price,
    ROUND(AVG(o.sale_price) - p.cost_price, 2)              AS profit_per_unit,
    ROUND((AVG(o.sale_price) - p.cost_price)
          / AVG(o.sale_price) * 100, 1)                     AS margin_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.status != 'Returned'
GROUP BY p.product_id, p.product_name, p.category, p.cost_price
ORDER BY margin_pct DESC;
