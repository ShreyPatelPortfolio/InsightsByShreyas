# Python Basics — My First Data Script
**Learning Lab Project 03 | Shreyas Patel**

---

## What This Is

I literally just started learning Python. This is my very first script. The goal was simple: load a CSV file without it crashing, look at the data, and check for any blank cells.

No dashboards, no machine learning, no complex libraries. Just the basics. I wanted to understand what Python actually does before trying to do anything impressive with it.

---

## Files in This Folder

| File | What It Does |
|------|-------------|
| `data_check.py` | The Python script — load it and run it |
| `sales.csv` | The data file the script reads (50 rows of retail sales) |
| `README.md` | Setup instructions |

---

## How to Run This

### Step 1 — Install Python

Download Python 3 from: https://www.python.org/downloads/

During installation on Windows, check the box that says **"Add Python to PATH"** — this is easy to miss and causes problems if you skip it.

### Step 2 — Install Pandas

Open your terminal (Command Prompt on Windows, Terminal on Mac) and type:

```bash
pip install pandas
```

Wait for it to finish. You only need to do this once.

### Step 3 — Put Both Files in the Same Folder

The script and the CSV file need to be in the same folder. If they are in different places, the script cannot find the data file.

### Step 4 — Run the Script

In your terminal, navigate to the folder where the files are:

```bash
cd Desktop/my-project-folder
```

Then run:

```bash
python data_check.py
```

---

## What the Output Looks Like

```
Loading data from sales.csv... Done!

Here is a preview of the data:
   OrderID           ProductName  Category   OrderDate  SalePrice  ...
0     1001   Wool Blend Overcoat   Jackets  2022-01-03     152.00  ...
1     1002  Running Pro Sneakers  Footwear  2022-01-05      80.00  ...
2     1003   Cotton Oxford Shirt      Tops  2022-01-06      30.00  ...
3     1004       Slim-Fit Chinos   Bottoms  2022-01-08      40.00  ...
4     1005      Leather Tote Bag  Accessories 2022-01-10   100.00  ...

The dataset has 50 rows and 8 columns.

Missing values in each column:
OrderID        0
ProductName    0
Category       1
OrderDate      0
SalePrice      0
CostPrice      0
Status         0
Region         0
dtype: int64

Summary statistics for the numeric columns:
       SalePrice   CostPrice
count  50.000000   50.000000
mean   76.780000   36.540000
std    38.241...   21.432...
min    22.000000   10.000000
max   155.000000   85.000000
```

---

## The Code — Explained Line by Line

```python
import pandas as pd
```
This brings in the Pandas library. Think of it as installing a plugin that gives Python the ability to work with tables and spreadsheets.

```python
df = pd.read_csv('sales.csv')
```
This loads the CSV file into a variable called `df` (short for dataframe — the Pandas word for a table). The whole file loads in under a second.

```python
print(df.head())
```
Shows the first 5 rows. Without `.head()`, printing the whole dataframe at once is hard to read.

```python
print(df.isnull().sum())
```
Checks every column for blank cells. `.isnull()` marks each blank cell as True, then `.sum()` adds up all the Trues in each column.

```python
returned_orders = df[df['Status'] == 'Returned']
```
This filters the data — same as setting a filter in Excel for the Status column. The result is a new table with only returned orders in it.

---

## Common Errors and How I Fixed Them

**ModuleNotFoundError: No module named 'pandas'**
You forgot to run `pip install pandas`. Open terminal and run it.

**FileNotFoundError: sales.csv not found**
The script and the CSV are not in the same folder. Move them together, or check your terminal is pointed at the right folder.

**SyntaxError on a line that looks fine**
Python is case-sensitive. `Print` is not the same as `print`. Check capitalization first.

---

## What I Learned

- Python is case-sensitive. `Pandas` with a capital P will crash the script. Always lowercase.
- Row indexes start at 0, not 1. The first row is row 0. This confused me for a while.
- `.isnull().sum()` is so much faster than manually filtering columns in Excel looking for blanks.
- Error messages look scary but they tell you exactly what line broke and why. Read them carefully.

---

## What's Next

Once I am more comfortable, I want to:
- Use `.groupby()` to calculate revenue totals by category (like GROUP BY in SQL)
- Create a simple bar chart using Matplotlib
- Write a script that cleans messy data automatically

---

*Part of my Learning Lab series as I transition into data analytics.*
*Portfolio: https://shreypatelportfolio.github.io/InsightsByShreyas*
