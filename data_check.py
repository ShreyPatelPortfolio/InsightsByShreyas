# data_check.py
# Author: Shreyas Patel
# Project: Python Basics — My First Script
#
# What this does:
# - Loads a CSV file into Python using Pandas
# - Shows the first 5 rows so I can see the data
# - Checks for any missing (blank) values in each column
# - Prints a basic summary of the numbers in the dataset
#
# This is literally step one of learning Python.
# No fancy stuff — just getting data to load without crashing.


# Step 1: Bring in the Pandas library
# Python does not know how to work with tables by default.
# Pandas is a toolkit that adds that ability.
import pandas as pd


# Step 2: Load the CSV file
# read_csv() reads the file and puts it in a "dataframe"
# A dataframe is basically a table — rows and columns, like Excel
df = pd.read_csv('sales.csv')

print("Loading data from sales.csv... Done!")
print()


# Step 3: Show the first 5 rows
# If you just print(df) it dumps everything — messy.
# .head() shows just the top 5 as a quick sanity check.
print("Here is a preview of the data:")
print(df.head())
print()


# Step 4: Check the size of the dataset
# .shape returns (number of rows, number of columns)
rows, cols = df.shape
print(f"The dataset has {rows} rows and {cols} columns.")
print()


# Step 5: Check for missing values
# In Excel I would use filters to find blank cells.
# .isnull().sum() counts the blanks in every column at once.
print("Missing values in each column:")
print(df.isnull().sum())
print()


# Step 6: Basic summary statistics
# .describe() automatically calculates count, average, min, max
# for any column that has numbers in it
print("Summary statistics for the numeric columns:")
print(df.describe())
print()


# Step 7: A simple filter
# Show only the rows where the order was returned
# This is the Python version of filtering a column in Excel
returned_orders = df[df['Status'] == 'Returned']
print(f"Number of returned orders: {len(returned_orders)}")
print()
print("Here are the returned orders:")
print(returned_orders[['OrderID', 'ProductName', 'Category', 'SalePrice', 'Region']])
