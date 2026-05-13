# Excel Dashboard — Monthly Sales Tracker
**Learning Lab Project 02 | Shreyas Patel**

---

## What This Is

A sales performance dashboard I built in Excel from scratch. I wanted to go beyond basic spreadsheets and actually build something a manager could use — KPI summary at the top, Pivot Tables for analysis, charts, and conditional formatting that flags problems automatically.

The data file (`sales_data.csv`) is included so you can import it and build the workbook yourself.

---

## Files in This Folder

| File | What It Does |
|------|-------------|
| `sales_data.csv` | 100 rows of retail sales data — import this into Excel to get started |
| `README.md` | Full instructions for building the dashboard step by step |

---

## How to Build the Dashboard

### Step 1 — Import the Data

1. Open Excel and create a new workbook
2. Go to **Data > Get Data > From Text/CSV**
3. Select `sales_data.csv` and click Import
4. In the preview, make sure the delimiter is set to **Comma** and click **Load**
5. Rename this sheet `Orders`

---

### Step 2 — Format as a Table

1. Click anywhere in your data
2. Press `Ctrl + T` to format as a Table
3. Name it `Orders` in the Table Design tab (top left box)
4. This lets formulas reference column names like `Orders[SalePrice]` instead of `$D$2:$D$101`

---

### Step 3 — Create a Summary Sheet

Create a new sheet called `Dashboard`. This is where all your KPIs and charts will live.

---

### Step 4 — Add KPI Formulas

In your Dashboard sheet, set up these four KPI cells:

**Total Revenue (completed orders only)**
```excel
=SUMIF(Orders[Status],"Completed",Orders[SalePrice])
```

**Total Orders**
```excel
=COUNTIF(Orders[Status],"Completed")
```

**Average Order Value**
```excel
=IFERROR(
    SUMIF(Orders[Status],"Completed",Orders[SalePrice])
    / COUNTIF(Orders[Status],"Completed"),
0)
```

**Return Rate**
```excel
=IFERROR(
    COUNTIF(Orders[Status],"Returned") / COUNTA(Orders[Status]),
0)
```
Format this last one as a percentage.

---

### Step 5 — Revenue by Month (SUMIFS)

This formula pulls revenue for a specific month. Set up a column of month labels (Jan, Feb, Mar...) then use this in the next column:

```excel
=SUMIFS(
    Orders[SalePrice],
    Orders[Status], "Completed",
    Orders[OrderDate], ">="&DATE(2022,ROW(A1),1),
    Orders[OrderDate], "<"&DATE(2022,ROW(A1)+1,1)
)
```

Copy this down 6 rows (one for each month in the dataset).

---

### Step 6 — XLOOKUP for Product Lookup

If you want to look up a product name by its ID, use XLOOKUP instead of VLOOKUP:

```excel
=XLOOKUP(B2, Orders[ProductID], Orders[ProductName], "Not Found")
```

Why XLOOKUP and not VLOOKUP?
- VLOOKUP breaks if you insert a column to the left of your lookup column
- XLOOKUP works left-to-right or right-to-left and handles errors with a clean fallback value

---

### Step 7 — Month-over-Month Change

Once you have your monthly revenue column set up, add a MoM change column next to it:

```excel
=IFERROR((C3-C2)/C2, 0)
```

Format as a percentage. Then apply conditional formatting:
- Go to **Home > Conditional Formatting > Color Scales**
- Or set a rule: cells below 0 show red, cells above 0 show green

---

### Step 8 — Pivot Table for Category Breakdown

1. Click on your Orders table
2. Go to **Insert > PivotTable** and place it on the Dashboard sheet
3. Set up:
   - **Rows:** Category
   - **Values:** SalePrice (Sum) — rename to "Revenue"
   - **Values:** OrderID (Count) — rename to "Orders"
   - Add a filter: Status = Completed only

4. Right-click the Pivot Table > **Show Values As > % of Grand Total** on the Revenue column to see category share

---

### Step 9 — Add a Bar Chart

1. Select your monthly revenue column
2. Go to **Insert > Bar Chart > Clustered Bar**
3. Right-click the chart > **Select Data** to add month labels on the axis
4. Format: remove gridlines, set bar color to match your theme, add data labels

---

### Step 10 — Conditional Formatting on MoM Column

1. Select your MoM % change column
2. Go to **Home > Conditional Formatting > New Rule**
3. Set: *Format cells that are LESS THAN 0* — fill red
4. Add another rule: *GREATER THAN 0* — fill green
5. This makes performance drops visible without anyone needing to look for them

---

## Key Formulas Reference

| Formula | Purpose |
|---------|---------|
| `=SUMIF(range, criteria, sum_range)` | Sum values that match one condition |
| `=SUMIFS(sum_range, range1, crit1, range2, crit2)` | Sum with multiple conditions |
| `=COUNTIF(range, criteria)` | Count rows matching one condition |
| `=XLOOKUP(lookup, search_range, return_range, fallback)` | Look up a value (better than VLOOKUP) |
| `=IFERROR(formula, 0)` | Show 0 instead of an error when formula fails |
| `=(new-old)/old` | Percentage change calculation |

---

## What I Learned

- **XLOOKUP beats VLOOKUP** because it searches by column name, not position. Adding a column never breaks it.
- **Named table ranges** make formulas readable. `Orders[SalePrice]` is cleaner than `$D$2:$D$101`.
- **Conditional formatting is automated alerting.** Once rules are set, the dashboard flags problems without anyone manually checking.
- **Pivot Tables need clean source data.** My first one gave wrong results because category names had inconsistent capitalization. Always clean data first.
- **IFERROR is always worth adding.** It stops ugly `#DIV/0!` errors from showing when data is missing.

---

## Tools Used

- Microsoft Excel (Office 365)
- Dataset: `sales_data.csv` (100 rows, fictional retail data)

---

*Part of my Learning Lab series as I transition into data analytics.*
*Portfolio: https://shreypatelportfolio.github.io/InsightsByShreyas*
