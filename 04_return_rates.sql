-- ============================================================
--  QUERY 3: Categories with High Return Rates
--  File:    04_return_rates.sql
--  Author:  Shreyas Patel
--
--  WHAT THIS DOES:
--  Calculates the return rate for each product category.
--  Uses CASE WHEN to count only returned orders, then
--  divides by total orders to get a percentage.
--  Uses HAVING to filter out low-return categories.
--
--  WHAT I LEARNED:
--  WHERE vs HAVING was confusing at first.
--  - WHERE filters individual rows BEFORE grouping
--  - HAVING filters the grouped results AFTER grouping
--  You cannot use WHERE to filter on COUNT() or SUM()
--  because those don't exist yet at the WHERE stage.
--
--  PREREQUISITE: Run 01_setup.sql first.
-- ============================================================

USE retail_sales;

-- Find product categories where return rate is above 15%

SELECT
    p.category,
    COUNT(o.order_id)                                    AS total_orders,
    SUM(CASE WHEN o.status = 'Returned' THEN 1 ELSE 0 END)  AS total_returns,
    ROUND(
        SUM(CASE WHEN o.status = 'Returned' THEN 1 ELSE 0 END) * 100.0
        / COUNT(o.order_id), 2
    )                                                    AS return_rate_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
HAVING return_rate_pct > 15
ORDER BY return_rate_pct DESC;


-- ============================================================
--  BONUS: Full return rate summary for ALL categories
--  (Remove the HAVING filter to see everything)
-- ============================================================

SELECT
    p.category,
    COUNT(o.order_id)                                    AS total_orders,
    SUM(CASE WHEN o.status = 'Returned' THEN 1 ELSE 0 END)  AS total_returns,
    ROUND(
        SUM(CASE WHEN o.status = 'Returned' THEN 1 ELSE 0 END) * 100.0
        / COUNT(o.order_id), 2
    )                                                    AS return_rate_pct,
    ROUND(SUM(CASE WHEN o.status = 'Returned' THEN o.sale_price ELSE 0 END), 2) AS revenue_lost
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY return_rate_pct DESC;
