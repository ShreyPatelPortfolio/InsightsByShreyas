# SQL Basics — Retail Sales Dataset
**Learning Lab Project 01 | Shreyas Patel**

---

## What This Is

My first real SQL project. I built a small retail sales database from scratch in MySQL, then wrote queries to answer real business questions — monthly revenue trends, best-selling products, and which categories have high return rates.

Nothing complex. Just learning how SQL actually works by running it on real data instead of reading about it.

---

## Files in This Folder

| File | What It Does |
|------|-------------|
| `01_setup.sql` | Creates the database, tables, and loads all sample data. **Run this first.** |
| `02_revenue_by_month.sql` | Total revenue grouped by month. Taught me DATE_FORMAT and basic aggregation. |
| `03_top_products.sql` | Top 10 products by revenue using a JOIN. My first JOIN query. |
| `04_return_rates.sql` | Return rate by category using CASE WHEN and HAVING. |

---

## How to Run This

### What You Need
- **MySQL Workbench** (free): https://www.mysql.com/products/workbench/
- Or any MySQL-compatible tool (DBeaver, TablePlus, etc.)

### Steps
1. Open MySQL Workbench and connect to your local server
2. Open `01_setup.sql` and run the whole file (Ctrl+Shift+Enter)
3. You should see a result confirming 20 products and 100 orders loaded
4. Open any query file and run it — results will appear in the output panel

---

## What the Database Looks Like

**products table** (20 rows)
```
product_id | product_name          | category    | cost_price
-----------|-----------------------|-------------|----------
1          | Wool Blend Overcoat   | Jackets     | 85.00
4          | Running Pro Sneakers  | Footwear    | 42.00
10         | Cotton Oxford Shirt   | Tops        | 18.00
...
```

**orders table** (100 rows)
```
order_id | product_id | order_date | sale_price | status    | region
---------|------------|------------|------------|-----------|--------
1001     | 1          | 2022-01-03 | 152.00     | Completed | Ontario
1004     | 7          | 2022-01-08 | 40.00      | Returned  | BC
...
```

---

## Sample Results

**Query 02 — Revenue by Month (first 3 months)**
```
month   | total_orders | total_revenue | avg_order_value
--------|--------------|---------------|----------------
2022-01 | 12           | 1,137.00      | 94.75
2022-02 | 11           | 1,044.00      | 94.91
2022-03 | 16           | 1,436.00      | 89.75
```

**Query 03 — Top Products by Revenue**
```
product_name          | category | units_sold | total_revenue
----------------------|----------|------------|---------------
Wool Blend Overcoat   | Jackets  | 8          | 1,217.00
Leather Chelsea Boots | Footwear | 7          | 883.00
Leather Tote Bag      | Accessories | 6       | 604.00
```

---

## What I Learned

- **JOIN** is just matching rows from two tables on a shared column — like VLOOKUP in Excel but more powerful
- **WHERE vs HAVING**: WHERE filters rows before grouping, HAVING filters groups after. You need HAVING when filtering on COUNT() or SUM()
- **ROUND()** everything — raw decimal outputs are unreadable for currency values
- **CASE WHEN** inside an aggregate lets you count only specific rows (like counting only returned orders)
- Filtering out returned orders with `WHERE status != 'Returned'` made every revenue calculation accurate

---

## Tools Used

- MySQL 8.0
- MySQL Workbench (free)
- Dataset: Fictional retail data I built myself

---

*Part of my Learning Lab series as I transition into data analytics.*
*Portfolio: https://shreypatelportfolio.github.io/InsightsByShreyas*
