-- ============================================================
--  PROJECT: SQL Basics — Retail Sales Dataset
--  Author:  Shreyas Patel
--  Tool:    MySQL Workbench (free download at mysql.com)
--  Dataset: Fictional retail sales data (inspired by Kaggle)
--
--  HOW TO USE:
--  1. Open MySQL Workbench and connect to your local server
--  2. Run this file first — it creates the tables and data
--  3. Then open and run any of the query files (02, 03, 04)
-- ============================================================


-- Create a fresh database for this project
CREATE DATABASE IF NOT EXISTS retail_sales;
USE retail_sales;

-- Drop tables if they already exist (so you can re-run cleanly)
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;


-- ============================================================
--  TABLE 1: products
--  One row per product. Referenced by the orders table.
-- ============================================================
CREATE TABLE products (
    product_id   INT          PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category     VARCHAR(50)  NOT NULL,
    cost_price   DECIMAL(8,2) NOT NULL   -- what the store paid for it
);


-- ============================================================
--  TABLE 2: orders
--  One row per order line. Each row is one item sold.
-- ============================================================
CREATE TABLE orders (
    order_id    INT          PRIMARY KEY,
    product_id  INT          NOT NULL,
    order_date  DATE         NOT NULL,
    sale_price  DECIMAL(8,2) NOT NULL,
    status      VARCHAR(20)  NOT NULL,   -- 'Completed' or 'Returned'
    region      VARCHAR(30)  NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- ============================================================
--  SEED DATA: products (20 products across 5 categories)
-- ============================================================
INSERT INTO products (product_id, product_name, category, cost_price) VALUES
(1,  'Wool Blend Overcoat',     'Jackets',     85.00),
(2,  'Puffer Jacket',           'Jackets',     60.00),
(3,  'Rain Resistant Anorak',   'Jackets',     45.00),
(4,  'Running Pro Sneakers',    'Footwear',    42.00),
(5,  'Leather Chelsea Boots',   'Footwear',    70.00),
(6,  'Canvas Low-Top Trainers', 'Footwear',    25.00),
(7,  'Slim-Fit Chinos',         'Bottoms',     22.00),
(8,  'Straight Leg Jeans',      'Bottoms',     28.00),
(9,  'Jogger Sweatpants',       'Bottoms',     18.00),
(10, 'Cotton Oxford Shirt',     'Tops',        18.00),
(11, 'Linen Button-Down',       'Tops',        20.00),
(12, 'Graphic Tee',             'Tops',        10.00),
(13, 'Merino Wool Sweater',     'Tops',        35.00),
(14, 'Leather Tote Bag',        'Accessories', 40.00),
(15, 'Canvas Backpack',         'Accessories', 22.00),
(16, 'Leather Belt',            'Accessories', 12.00),
(17, 'Wool Scarf',              'Accessories', 10.00),
(18, 'Sunglasses',              'Accessories', 15.00),
(19, 'Floral Midi Dress',       'Dresses',     30.00),
(20, 'Wrap Dress',              'Dresses',     28.00);


-- ============================================================
--  SEED DATA: orders (100 sample rows — enough to get real results)
-- ============================================================
INSERT INTO orders (order_id, product_id, order_date, sale_price, status, region) VALUES
(1001, 1,  '2022-01-03', 152.00, 'Completed', 'Ontario'),
(1002, 4,  '2022-01-05',  80.00, 'Completed', 'Alberta'),
(1003, 10, '2022-01-06',  30.00, 'Completed', 'Ontario'),
(1004, 7,  '2022-01-08',  40.00, 'Returned',  'BC'),
(1005, 14, '2022-01-10', 100.00, 'Completed', 'Ontario'),
(1006, 19, '2022-01-12',  75.00, 'Completed', 'Quebec'),
(1007, 2,  '2022-01-14',  95.00, 'Completed', 'Alberta'),
(1008, 5,  '2022-01-15', 130.00, 'Returned',  'BC'),
(1009, 11, '2022-01-18',  45.00, 'Completed', 'Ontario'),
(1010, 8,  '2022-01-20',  60.00, 'Completed', 'Quebec'),
(1011, 1,  '2022-01-22', 152.00, 'Completed', 'Ontario'),
(1012, 16, '2022-01-24',  25.00, 'Completed', 'Alberta'),
(1013, 3,  '2022-01-25',  70.00, 'Completed', 'BC'),
(1014, 12, '2022-01-26',  22.00, 'Returned',  'Quebec'),
(1015, 20, '2022-01-28',  68.00, 'Completed', 'Ontario'),
(1016, 6,  '2022-02-01',  50.00, 'Completed', 'Alberta'),
(1017, 13, '2022-02-03',  85.00, 'Completed', 'Ontario'),
(1018, 15, '2022-02-04',  45.00, 'Completed', 'BC'),
(1019, 4,  '2022-02-06',  80.00, 'Returned',  'Quebec'),
(1020, 1,  '2022-02-08', 148.00, 'Completed', 'Ontario'),
(1021, 17, '2022-02-09',  28.00, 'Completed', 'Alberta'),
(1022, 10, '2022-02-10',  30.00, 'Completed', 'Ontario'),
(1023, 8,  '2022-02-12',  58.00, 'Completed', 'BC'),
(1024, 5,  '2022-02-14', 125.00, 'Completed', 'Quebec'),
(1025, 2,  '2022-02-15',  90.00, 'Returned',  'Ontario'),
(1026, 19, '2022-02-18',  72.00, 'Completed', 'Alberta'),
(1027, 7,  '2022-02-19',  40.00, 'Completed', 'BC'),
(1028, 14, '2022-02-20',  98.00, 'Completed', 'Ontario'),
(1029, 3,  '2022-02-22',  68.00, 'Completed', 'Quebec'),
(1030, 18, '2022-02-24',  35.00, 'Returned',  'Alberta'),
(1031, 1,  '2022-03-01', 155.00, 'Completed', 'Ontario'),
(1032, 4,  '2022-03-02',  82.00, 'Completed', 'BC'),
(1033, 10, '2022-03-04',  32.00, 'Completed', 'Alberta'),
(1034, 11, '2022-03-05',  47.00, 'Completed', 'Ontario'),
(1035, 7,  '2022-03-06',  42.00, 'Returned',  'Quebec'),
(1036, 14, '2022-03-08', 102.00, 'Completed', 'BC'),
(1037, 2,  '2022-03-10',  92.00, 'Completed', 'Ontario'),
(1038, 19, '2022-03-11',  74.00, 'Completed', 'Alberta'),
(1039, 5,  '2022-03-13', 128.00, 'Completed', 'Quebec'),
(1040, 8,  '2022-03-15',  62.00, 'Returned',  'BC'),
(1041, 16, '2022-03-16',  26.00, 'Completed', 'Ontario'),
(1042, 13, '2022-03-18',  88.00, 'Completed', 'Alberta'),
(1043, 3,  '2022-03-19',  72.00, 'Completed', 'Ontario'),
(1044, 12, '2022-03-20',  24.00, 'Completed', 'BC'),
(1045, 20, '2022-03-22',  70.00, 'Returned',  'Quebec'),
(1046, 6,  '2022-03-25',  52.00, 'Completed', 'Alberta'),
(1047, 17, '2022-03-26',  30.00, 'Completed', 'Ontario'),
(1048, 15, '2022-03-28',  48.00, 'Completed', 'BC'),
(1049, 18, '2022-03-29',  38.00, 'Completed', 'Quebec'),
(1050, 1,  '2022-03-30', 150.00, 'Completed', 'Ontario'),
(1051, 4,  '2022-04-01',  78.00, 'Completed', 'Alberta'),
(1052, 9,  '2022-04-02',  38.00, 'Completed', 'BC'),
(1053, 10, '2022-04-04',  30.00, 'Returned',  'Quebec'),
(1054, 19, '2022-04-05',  76.00, 'Completed', 'Ontario'),
(1055, 2,  '2022-04-07',  88.00, 'Completed', 'Alberta'),
(1056, 14, '2022-04-08', 100.00, 'Returned',  'BC'),
(1057, 7,  '2022-04-10',  40.00, 'Completed', 'Quebec'),
(1058, 5,  '2022-04-12', 122.00, 'Completed', 'Ontario'),
(1059, 11, '2022-04-13',  44.00, 'Completed', 'Alberta'),
(1060, 1,  '2022-04-15', 153.00, 'Completed', 'BC'),
(1061, 16, '2022-04-17',  24.00, 'Completed', 'Ontario'),
(1062, 20, '2022-04-18',  66.00, 'Returned',  'Quebec'),
(1063, 3,  '2022-04-20',  70.00, 'Completed', 'Alberta'),
(1064, 12, '2022-04-22',  22.00, 'Completed', 'BC'),
(1065, 13, '2022-04-24',  84.00, 'Completed', 'Ontario'),
(1066, 6,  '2022-05-01',  50.00, 'Completed', 'Alberta'),
(1067, 4,  '2022-05-02',  82.00, 'Completed', 'Quebec'),
(1068, 1,  '2022-05-04', 158.00, 'Completed', 'Ontario'),
(1069, 8,  '2022-05-06',  60.00, 'Returned',  'BC'),
(1070, 14, '2022-05-07', 104.00, 'Completed', 'Alberta'),
(1071, 19, '2022-05-09',  74.00, 'Completed', 'Ontario'),
(1072, 17, '2022-05-10',  28.00, 'Completed', 'Quebec'),
(1073, 5,  '2022-05-12', 130.00, 'Completed', 'BC'),
(1074, 2,  '2022-05-14',  90.00, 'Completed', 'Ontario'),
(1075, 11, '2022-05-15',  46.00, 'Returned',  'Alberta'),
(1076, 10, '2022-05-17',  31.00, 'Completed', 'BC'),
(1077, 7,  '2022-05-18',  41.00, 'Completed', 'Quebec'),
(1078, 15, '2022-05-20',  46.00, 'Completed', 'Ontario'),
(1079, 18, '2022-05-22',  36.00, 'Completed', 'Alberta'),
(1080, 20, '2022-05-24',  70.00, 'Completed', 'BC'),
(1081, 1,  '2022-06-01', 155.00, 'Completed', 'Ontario'),
(1082, 4,  '2022-06-03',  80.00, 'Completed', 'Quebec'),
(1083, 13, '2022-06-04',  86.00, 'Returned',  'Alberta'),
(1084, 14, '2022-06-06', 100.00, 'Completed', 'BC'),
(1085, 19, '2022-06-07',  76.00, 'Completed', 'Ontario'),
(1086, 10, '2022-06-09',  30.00, 'Completed', 'Alberta'),
(1087, 5,  '2022-06-10', 128.00, 'Completed', 'Quebec'),
(1088, 2,  '2022-06-12',  92.00, 'Returned',  'BC'),
(1089, 7,  '2022-06-14',  40.00, 'Completed', 'Ontario'),
(1090, 16, '2022-06-15',  25.00, 'Completed', 'Alberta'),
(1091, 11, '2022-06-17',  45.00, 'Completed', 'BC'),
(1092, 8,  '2022-06-18',  60.00, 'Completed', 'Quebec'),
(1093, 3,  '2022-06-20',  70.00, 'Completed', 'Ontario'),
(1094, 12, '2022-06-22',  22.00, 'Returned',  'Alberta'),
(1095, 20, '2022-06-24',  68.00, 'Completed', 'BC'),
(1096, 18, '2022-06-25',  36.00, 'Completed', 'Ontario'),
(1097, 15, '2022-06-27',  46.00, 'Completed', 'Quebec'),
(1098, 6,  '2022-06-28',  52.00, 'Completed', 'Alberta'),
(1099, 9,  '2022-06-29',  38.00, 'Completed', 'BC'),
(1100, 1,  '2022-06-30', 152.00, 'Completed', 'Ontario');


-- Quick check — run this after setup to confirm everything loaded
SELECT
    'products' AS table_name, COUNT(*) AS row_count FROM products
UNION ALL
SELECT
    'orders',  COUNT(*) FROM orders;

-- Expected result:
-- products | 20
-- orders   | 100
