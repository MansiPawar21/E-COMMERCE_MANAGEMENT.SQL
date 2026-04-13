DROP DATABASE IF EXISTS MARK;
CREATE DATABASE MARK;
USE MARK;


-- ===============================================
---CREATE CATEGORIES TABLE ---
-- ===============================================
CREATE TABLE CATEGORIES (
    CATEGORY_ID INT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(100)
);
-- ===============================================
---INSERT CATEGORIES VALUES ---
-- ===============================================
INSERT INTO CATEGORIES VALUES (1, 'ELECTRONICS');
INSERT INTO CATEGORIES VALUES (2, 'CLOTHING');
INSERT INTO CATEGORIES VALUES (3, 'BOOKS');
INSERT INTO CATEGORIES VALUES (4, 'HOME APPLIANCES');
INSERT INTO CATEGORIES VALUES (5, 'SPORTS');


-- ===============================================
---CREATE CUSTOMERS TABLE ---
-- ===============================================
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    NAME VARCHAR(20),
    EMAIL VARCHAR(50),
    PHONE_NUMBER VARCHAR(15),
    ADDRESS VARCHAR(250),
    REGISTRATION_DATE DATE
);
-- ===============================================
---INSERT CUSTOMERS VALUES---
-- ===============================================
INSERT INTO CUSTOMERS VALUES (1, 'RAHUL SHARMA', 'RAHUL@MAIL.COM', '9876543210', 'DELHI', '2023-05-10');
INSERT INTO CUSTOMERS VALUES (2, 'PRIYA PATEL', 'PRIYA@MAIL.COM', '9123456780', 'MUMBAI', '2023-06-15');
INSERT INTO CUSTOMERS VALUES (3, 'AMIT VERMA', NULL, '9988776655', 'AHMEDABAD', '2024-01-20');
INSERT INTO CUSTOMERS VALUES (4, 'NEHA SINGH', 'NEHA@MAIL.COM', '9012345678', 'PUNE', '2022-12-05');
INSERT INTO CUSTOMERS VALUES (5, 'ROHAN MEHTA', NULL, '9090909090', 'SURAT', '2023-11-25');


-- ===============================================
---CREATE PRODUCTS TABLE ---
-- ===============================================
CREATE TABLE PRODUCTS (
    PRODUCT_ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    CATEGORY_ID INT,
    PRICE DECIMAL(10,2),
    STOCK_QUANTITY INT,
    ADDED_DATE DATE,
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID)
);
-- ===============================================
---INSERT PRODUCTS VALUES---
-- ===============================================
INSERT INTO PRODUCTS VALUES (101, 'MOBILE PHONE', 1, 15000, 50, '2024-01-10');
INSERT INTO PRODUCTS VALUES (102, 'LAPTOP', 1, 55000, 20, '2024-02-15');
INSERT INTO PRODUCTS VALUES (103, 'T-SHIRT', 2, 500, 100, '2024-03-01');
INSERT INTO PRODUCTS VALUES (104, 'NOVEL BOOK', 3, 300, 80, '2024-03-10');
INSERT INTO PRODUCTS VALUES (105, 'MICROWAVE', 4, 8000, 30, '2024-03-20');


-- ===============================================
---CREATE ORDERS TABLE ---
-- ===============================================
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE,
    TOTAL_AMOUNT DECIMAL(10,2),
    STATUS VARCHAR(20),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);
-- ===============================================
---INSERT ORDERS VALUES---
-- ===============================================
INSERT INTO ORDERS VALUES (201, 1, '2024-03-01', 15500, 'PENDING');
INSERT INTO ORDERS VALUES (202, 2, '2024-03-05', 500, 'SHIPPED');
INSERT INTO ORDERS VALUES (203, 1, '2024-03-10', 300, 'DELIVERED');
INSERT INTO ORDERS VALUES (204, 3, '2024-03-15', 8000, 'CANCELLED');
INSERT INTO ORDERS VALUES (205, 4, '2024-03-18', 55000, 'PENDING');


-- ===============================================
---CREATE ORDER_ITEMS TABLE ---
-- ===============================================
CREATE TABLE ORDER_ITEMS (
    ORDER_ITEM_ID INT PRIMARY KEY,
    ORDER_ID INT,
    PRODUCT_ID INT,
    QUANTITY INT,
    SUBTOTAL DECIMAL(10,2),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);
-- ===============================================
---INSERT ORDER_ITEMS VALUES---
-- ===============================================
INSERT INTO ORDER_ITEMS VALUES (1, 201, 101, 1, 15000);
INSERT INTO ORDER_ITEMS VALUES (2, 201, 104, 1, 500);
INSERT INTO ORDER_ITEMS VALUES (3, 202, 103, 1, 500);
INSERT INTO ORDER_ITEMS VALUES (4, 203, 104, 1, 300);
INSERT INTO ORDER_ITEMS VALUES (5, 204, 105, 1, 8000);


-- ===============================================
---CREATE PAYMENTS TABLE ---
-- ===============================================
CREATE TABLE PAYMENTS (
    PAYMENT_ID INT PRIMARY KEY,
    ORDER_ID INT,
    PAYMENT_DATE DATE,
    PAYMENT_METHOD VARCHAR(20),
    PAYMENT_STATUS VARCHAR(20),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);
-- ===============================================
---INSERT PAYMENTS VALUES---
-- ===============================================
INSERT INTO PAYMENTS VALUES (1, 201, '2024-03-01', 'UPI', 'PENDING');
INSERT INTO PAYMENTS VALUES (2, 202, '2024-03-05', 'CREDIT CARD', 'PAID');
INSERT INTO PAYMENTS VALUES (3, 203, '2024-03-10', 'PAYPAL', 'PAID');
INSERT INTO PAYMENTS VALUES (4, 204, '2024-03-15', 'UPI', 'FAILED');
INSERT INTO PAYMENTS VALUES (5, 205, '2024-03-18', 'CREDIT CARD', 'PENDING');


-- ===============================================
---CREATE SHIPPING TABLE ---
-- ===============================================
CREATE TABLE SHIPPING (
    SHIPPING_ID INT PRIMARY KEY,
    ORDER_ID INT,
    SHIPPING_DATE DATE,
    DELIVERY_DATE DATE,
    SHIPPING_STATUS VARCHAR(20),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);
-- ===============================================
---INSERT SHIPPING VALUES---
-- ===============================================
INSERT INTO SHIPPING VALUES (1, 201, '2024-03-02', '2024-03-05', 'IN TRANSIT');
INSERT INTO SHIPPING VALUES (2, 202, '2024-03-06', '2024-03-08', 'DELIVERED');
INSERT INTO SHIPPING VALUES (3, 203, '2024-03-11', '2024-03-13', 'DELIVERED');
INSERT INTO SHIPPING VALUES (4, 204, '2024-03-16', NULL, 'DISPATCHED');
INSERT INTO SHIPPING VALUES (5, 205, '2024-03-19', NULL, 'IN TRANSIT');


mysql> SOURCE D:/SQL/SQL_FINAL_EXAM.SQL;
Query OK, 5 rows affected (1.436 sec)

Query OK, 1 row affected (0.066 sec)

Query OK, 0 rows affected (0.005 sec)

Query OK, 0 rows affected (0.287 sec)

Query OK, 1 row affected (0.073 sec)

Query OK, 1 row affected (0.042 sec)

Query OK, 1 row affected (0.029 sec)

Query OK, 1 row affected (0.032 sec)

Query OK, 1 row affected (0.033 sec)

Query OK, 0 rows affected (0.256 sec)

Query OK, 1 row affected (0.057 sec)

Query OK, 1 row affected (0.031 sec)

Query OK, 1 row affected (0.033 sec)

Query OK, 1 row affected (0.033 sec)

Query OK, 1 row affected (0.047 sec)

Query OK, 0 rows affected (0.297 sec)

Query OK, 1 row affected (0.055 sec)

Query OK, 1 row affected (0.039 sec)

Query OK, 1 row affected (0.039 sec)

Query OK, 1 row affected (0.042 sec)

Query OK, 1 row affected (0.041 sec)

Query OK, 0 rows affected (0.287 sec)

Query OK, 1 row affected (0.065 sec)

Query OK, 1 row affected (0.042 sec)

Query OK, 1 row affected (0.036 sec)

Query OK, 1 row affected (0.040 sec)

Query OK, 1 row affected (0.045 sec)

Query OK, 0 rows affected (0.407 sec)

Query OK, 1 row affected (0.089 sec)

Query OK, 1 row affected (0.050 sec)

Query OK, 1 row affected (0.035 sec)

Query OK, 1 row affected (0.048 sec)

Query OK, 1 row affected (0.041 sec)

Query OK, 0 rows affected (0.397 sec)

Query OK, 1 row affected (0.059 sec)

Query OK, 1 row affected (0.038 sec)

Query OK, 1 row affected (0.046 sec)

Query OK, 1 row affected (0.040 sec)

Query OK, 1 row affected (0.047 sec)

Query OK, 0 rows affected (0.336 sec)

Query OK, 1 row affected (0.457 sec)

Query OK, 1 row affected (0.044 sec)

Query OK, 1 row affected (0.045 sec)

Query OK, 1 row affected (0.042 sec)

Query OK, 1 row affected (0.034 sec)

mysql> SHOW TABLES;
+----------------+
| Tables_in_mark |
+----------------+
| categories     |
| customers      |
| order_items    |
| orders         |
| payments       |
| products       |
| shipping       |
+----------------+
7 rows in set (0.101 sec)
-- ===============================================
---PRODUCTS TABLE---
-- ===============================================
mysql> SELECT * FROM PRODUCTS;
+------------+--------------+-------------+----------+----------------+------------+
| PRODUCT_ID | NAME         | CATEGORY_ID | PRICE    | STOCK_QUANTITY | ADDED_DATE |
+------------+--------------+-------------+----------+----------------+------------+
|        101 | MOBILE PHONE |           1 | 15000.00 |             50 | 2024-01-10 |
|        102 | LAPTOP       |           1 | 55000.00 |             20 | 2024-02-15 |
|        103 | T-SHIRT      |           2 |   500.00 |            100 | 2024-03-01 |
|        104 | NOVEL BOOK   |           3 |   300.00 |             80 | 2024-03-10 |
|        105 | MICROWAVE    |           4 |  8000.00 |             30 | 2024-03-20 |
+------------+--------------+-------------+----------+----------------+------------+
5 rows in set (0.007 sec)

-- ===============================================
---CATEGORIES TABLE---
-- ===============================================
mysql> SELECT * FROM CATEGORIES;
+-------------+-----------------+
| CATEGORY_ID | CATEGORY_NAME   |
+-------------+-----------------+
|           1 | ELECTRONICS     |
|           2 | CLOTHING        |
|           3 | BOOKS           |
|           4 | HOME APPLIANCES |
|           5 | SPORTS          |
+-------------+-----------------+
5 rows in set (0.007 sec)

-- ===============================================
---CUSTOMERS TABLE---
-- ===============================================
mysql> SELECT * FROM CUSTOMERS;
+-------------+--------------+----------------+--------------+-----------+-------------------+
| CUSTOMER_ID | NAME         | EMAIL          | PHONE_NUMBER | ADDRESS   | REGISTRATION_DATE |
+-------------+--------------+----------------+--------------+-----------+-------------------+
|           1 | RAHUL SHARMA | RAHUL@MAIL.COM | 9876543210   | DELHI     | 2023-05-10        |
|           2 | PRIYA PATEL  | PRIYA@MAIL.COM | 9123456780   | MUMBAI    | 2023-06-15        |
|           3 | AMIT VERMA   | NULL           | 9988776655   | AHMEDABAD | 2024-01-20        |
|           4 | NEHA SINGH   | NEHA@MAIL.COM  | 9012345678   | PUNE      | 2022-12-05        |
|           5 | ROHAN MEHTA  | NULL           | 9090909090   | SURAT     | 2023-11-25        |
+-------------+--------------+----------------+--------------+-----------+-------------------+
5 rows in set (0.007 sec)

-- ===============================================
---ORDERS TABLE---
-- ===============================================
mysql> SELECT * FROM ORDERS;
+----------+-------------+------------+--------------+-----------+
| ORDER_ID | CUSTOMER_ID | ORDER_DATE | TOTAL_AMOUNT | STATUS    |
+----------+-------------+------------+--------------+-----------+
|      201 |           1 | 2024-03-01 |     15500.00 | PENDING   |
|      202 |           2 | 2024-03-05 |       500.00 | SHIPPED   |
|      203 |           1 | 2024-03-10 |       300.00 | DELIVERED |
|      204 |           3 | 2024-03-15 |      8000.00 | CANCELLED |
|      205 |           4 | 2024-03-18 |     55000.00 | PENDING   |
+----------+-------------+------------+--------------+-----------+
5 rows in set (0.008 sec)

-- ===============================================
---ORDER_ITEMS TABLE---
-- ===============================================
mysql> SELECT * FROM ORDER_ITEMS;
+---------------+----------+------------+----------+----------+
| ORDER_ITEM_ID | ORDER_ID | PRODUCT_ID | QUANTITY | SUBTOTAL |
+---------------+----------+------------+----------+----------+
|             1 |      201 |        101 |        1 | 15000.00 |
|             2 |      201 |        104 |        1 |   500.00 |
|             3 |      202 |        103 |        1 |   500.00 |
|             4 |      203 |        104 |        1 |   300.00 |
|             5 |      204 |        105 |        1 |  8000.00 |
+---------------+----------+------------+----------+----------+
5 rows in set (0.007 sec)

-- ===============================================
---PAYMENTS TABLE---
-- ===============================================
mysql> SELECT * FROM PAYMENTS;
+------------+----------+--------------+----------------+----------------+
| PAYMENT_ID | ORDER_ID | PAYMENT_DATE | PAYMENT_METHOD | PAYMENT_STATUS |
+------------+----------+--------------+----------------+----------------+
|          1 |      201 | 2024-03-01   | UPI            | PENDING        |
|          2 |      202 | 2024-03-05   | CREDIT CARD    | PAID           |
|          3 |      203 | 2024-03-10   | PAYPAL         | PAID           |
|          4 |      204 | 2024-03-15   | UPI            | FAILED         |
|          5 |      205 | 2024-03-18   | CREDIT CARD    | PENDING        |
+------------+----------+--------------+----------------+----------------+
5 rows in set (0.008 sec)

-- ===============================================
---SHIPPING TABLE---
-- ===============================================
mysql> SELECT * FROM SHIPPING;
+-------------+----------+---------------+---------------+-----------------+
| SHIPPING_ID | ORDER_ID | SHIPPING_DATE | DELIVERY_DATE | SHIPPING_STATUS |
+-------------+----------+---------------+---------------+-----------------+
|           1 |      201 | 2024-03-02    | 2024-03-05    | IN TRANSIT      |
|           2 |      202 | 2024-03-06    | 2024-03-08    | DELIVERED       |
|           3 |      203 | 2024-03-11    | 2024-03-13    | DELIVERED       |
|           4 |      204 | 2024-03-16    | NULL          | DISPATCHED      |
|           5 |      205 | 2024-03-19    | NULL          | IN TRANSIT      |
+-------------+----------+---------------+---------------+-----------------+
5 rows in set (0.008 sec)


QUERIES: 
=======================================
---1.) IMPLEMENT NEW CRUD OPERATIONS
=======================================
---========================================================================
     ---INSERT NEW PRODUCTS, CUSTOMERS, AND ORDERS INTO THE DATABASE ---
---========================================================================
mysql> INSERT INTO PRODUCTS (PRODUCT_ID, NAME, CATEGORY_ID, PRICE, STOCK_QUANTITY, ADDED_DATE)  VALUES (106, 'HEADPHONES', 1, 2000, 40, CURDATE());
Query OK, 1 row affected (1.031 sec)

mysql> 
mysql> INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, EMAIL, PHONE_NUMBER, ADDRESS, REGISTRATION_DATE) VALUES (6, 'ANITA DAS', 'ANITA@MAIL.COM', '9876543210', 'KOLKATA', CURDATE());
Query OK, 1 row affected (0.048 sec)

mysql> 
mysql> INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT, STATUS) VALUES (206, 6, CURDATE(), 2000, 'PENDING');
Query OK, 1 row affected (0.087 sec)
mysql> SELECT * FROM PRODUCTS;
+------------+--------------+-------------+----------+----------------+------------+
| PRODUCT_ID | NAME         | CATEGORY_ID | PRICE    | STOCK_QUANTITY | ADDED_DATE |
+------------+--------------+-------------+----------+----------------+------------+
|        101 | MOBILE PHONE |           1 | 15000.00 |             50 | 2024-01-10 |
|        102 | LAPTOP       |           1 | 55000.00 |             20 | 2024-02-15 |
|        103 | T-SHIRT      |           2 |   500.00 |            100 | 2024-03-01 |
|        104 | NOVEL BOOK   |           3 |   300.00 |             80 | 2024-03-10 |
|        105 | MICROWAVE    |           4 |  8000.00 |             30 | 2024-03-20 |
|        106 | HEADPHONES   |           1 |  2000.00 |             40 | 2026-04-13 |
+------------+--------------+-------------+----------+----------------+------------+
6 rows in set (0.010 sec)

mysql> SELECT * FROM CUSTOMERS;
+-------------+--------------+----------------+--------------+-----------+-------------------+
| CUSTOMER_ID | NAME         | EMAIL          | PHONE_NUMBER | ADDRESS   | REGISTRATION_DATE |
+-------------+--------------+----------------+--------------+-----------+-------------------+
|           1 | RAHUL SHARMA | RAHUL@MAIL.COM | 9876543210   | DELHI     | 2023-05-10        |
|           2 | PRIYA PATEL  | PRIYA@MAIL.COM | 9123456780   | MUMBAI    | 2023-06-15        |
|           3 | AMIT VERMA   | NULL           | 9988776655   | AHMEDABAD | 2024-01-20        |
|           4 | NEHA SINGH   | NEHA@MAIL.COM  | 9012345678   | PUNE      | 2022-12-05        |
|           5 | ROHAN MEHTA  | NULL           | 9090909090   | SURAT     | 2023-11-25        |
|           6 | ANITA DAS    | ANITA@MAIL.COM | 9876543210   | KOLKATA   | 2026-04-13        |
+-------------+--------------+----------------+--------------+-----------+-------------------+
6 rows in set (0.008 sec)

mysql> SELECT * FROM ORDERS;
+----------+-------------+------------+--------------+-----------+
| ORDER_ID | CUSTOMER_ID | ORDER_DATE | TOTAL_AMOUNT | STATUS    |
+----------+-------------+------------+--------------+-----------+
|      201 |           1 | 2024-03-01 |     15500.00 | PENDING   |
|      202 |           2 | 2024-03-05 |       500.00 | SHIPPED   |
|      203 |           1 | 2024-03-10 |       300.00 | DELIVERED |
|      204 |           3 | 2024-03-15 |      8000.00 | CANCELLED |
|      205 |           4 | 2024-03-18 |     55000.00 | PENDING   |
|      206 |           6 | 2026-04-13 |      2000.00 | PENDING   |
+----------+-------------+------------+--------------+-----------+
6 rows in set (0.007 sec)
---==============================================
     ---UPDATE STOCK WHEN AN ORDER IS PLACED---
---==============================================
mysql> UPDATE PRODUCTS
    -> SET PRODUCTS.STOCK_QUANTITY = PRODUCTS.STOCK_QUANTITY - 1
    -> WHERE PRODUCTS.PRODUCT_ID = 101;
Query OK, 1 row affected (0.141 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM PRODUCTS;
+------------+--------------+-------------+----------+----------------+------------+
| PRODUCT_ID | NAME         | CATEGORY_ID | PRICE    | STOCK_QUANTITY | ADDED_DATE |
+------------+--------------+-------------+----------+----------------+------------+
|        101 | MOBILE PHONE |           1 | 15000.00 |             49 | 2024-01-10 |
|        102 | LAPTOP       |           1 | 55000.00 |             20 | 2024-02-15 |
|        103 | T-SHIRT      |           2 |   500.00 |            100 | 2024-03-01 |
|        104 | NOVEL BOOK   |           3 |   300.00 |             80 | 2024-03-10 |
|        105 | MICROWAVE    |           4 |  8000.00 |             30 | 2024-03-20 |
|        106 | HEADPHONES   |           1 |  2000.00 |             40 | 2026-04-13 |
+------------+--------------+-------------+----------+----------------+------------+
6 rows in set (0.009 sec)
---=================================================================
     ---DELETE ORDERS THAT WERE CANCELLED MORE THAN 30 DAYS AGO---
---=================================================================
mysql> DELETE oi
    -> FROM order_items oi
    -> JOIN orders o ON oi.order_id = o.order_id
    -> WHERE o.status = 'CANCELLED'
    -> AND o.order_date < CURDATE() - INTERVAL 30 DAY;
Query OK, 1 row affected (0.123 sec)

mysql> SELECT * FROM ORDER_ITEMS;
+---------------+----------+------------+----------+----------+
| ORDER_ITEM_ID | ORDER_ID | PRODUCT_ID | QUANTITY | SUBTOTAL |
+---------------+----------+------------+----------+----------+
|             1 |      201 |        101 |        1 | 15000.00 |
|             2 |      201 |        104 |        1 |   500.00 |
|             3 |      202 |        103 |        1 |   500.00 |
|             4 |      203 |        104 |        1 |   300.00 |
+---------------+----------+------------+----------+----------+
4 rows in set (0.009 sec)


================================================
---2.) USE SQL CLAUSES (WHERE, HAVING, LIMIT)
================================================
---=====================================================
     ---FIND ALL ORDERS PLACED IN THE LAST 6 MONTHS---
---=====================================================
mysql> SELECT *
    -> FROM ORDERS
    -> WHERE ORDERS.ORDER_DATE >= CURDATE() - INTERVAL 6 MONTH;
+----------+-------------+------------+--------------+---------+
| ORDER_ID | CUSTOMER_ID | ORDER_DATE | TOTAL_AMOUNT | STATUS  |
+----------+-------------+------------+--------------+---------+
|      206 |           6 | 2026-04-13 |      2000.00 | PENDING |
+----------+-------------+------------+--------------+---------+
1 row in set (0.012 sec)
---=====================================================
     ---GET THE TOP 5 HIGHEST-PRICED PRODUCTS---
---=====================================================
mysql> SELECT *
    -> FROM PRODUCTS
    -> ORDER BY PRODUCTS.PRICE DESC
    -> LIMIT 5;
+------------+--------------+-------------+----------+----------------+------------+
| PRODUCT_ID | NAME         | CATEGORY_ID | PRICE    | STOCK_QUANTITY | ADDED_DATE |
+------------+--------------+-------------+----------+----------------+------------+
|        102 | LAPTOP       |           1 | 55000.00 |             20 | 2024-02-15 |
|        101 | MOBILE PHONE |           1 | 15000.00 |             49 | 2024-01-10 |
|        105 | MICROWAVE    |           4 |  8000.00 |             30 | 2024-03-20 |
|        106 | HEADPHONES   |           1 |  2000.00 |             40 | 2026-04-13 |
|        103 | T-SHIRT      |           2 |   500.00 |            100 | 2024-03-01 |
+------------+--------------+-------------+----------+----------------+------------+
5 rows in set (0.008 sec)
---===========================================================
     ---FIND CUSTOMERS WHO HAVE PLACED MORE THAN 1 ORDERS---
---===========================================================
mysql> SELECT ORDERS.CUSTOMER_ID,
    ->        COUNT(ORDERS.ORDER_ID) AS TOTAL_ORDERS
    -> FROM ORDERS
    -> GROUP BY ORDERS.CUSTOMER_ID
    -> HAVING COUNT(ORDERS.ORDER_ID) > 1;
+-------------+--------------+
| CUSTOMER_ID | TOTAL_ORDERS |
+-------------+--------------+
|           1 |            2 |
+-------------+--------------+
1 row in set (0.010 sec)


===============================================
---3.) APPLY SQL OPERATORS (AND, OR, NOT)
===============================================
---==============================================================================
     ---GET ALL ORDERS WHERE STATUS = 'PENDING' AND PAYMENT_STATUS = 'PAID'---
---==============================================================================
mysql> UPDATE PAYMENTS
    -> SET PAYMENTS.PAYMENT_STATUS = 'PAID'
    -> WHERE PAYMENTS.ORDER_ID = 201;
Query OK, 1 row affected (0.095 sec)
Rows matched: 1  Changed: 1  Warnings: 0
============================================================================
mysql> SELECT ORDERS.*
    -> FROM ORDERS
    -> INNER JOIN PAYMENTS
    -> ON ORDERS.ORDER_ID = PAYMENTS.ORDER_ID
    -> WHERE ORDERS.STATUS = 'PENDING'
    -> AND PAYMENTS.PAYMENT_STATUS = 'PAID';
+----------+-------------+------------+--------------+---------+
| ORDER_ID | CUSTOMER_ID | ORDER_DATE | TOTAL_AMOUNT | STATUS  |
+----------+-------------+------------+--------------+---------+
|      201 |           1 | 2024-03-01 |     15500.00 | PENDING |
+----------+-------------+------------+--------------+---------+
1 row in set (0.010 sec)
=============================================================================
---=======================================================
     ---FIND ALL PRODUCTS THAT ARE NOT OUT OF STOCK---
---=======================================================
mysql> SELECT *
    -> FROM PRODUCTS
    -> WHERE PRODUCTS.STOCK_QUANTITY > 0;
+------------+--------------+-------------+----------+----------------+------------+
| PRODUCT_ID | NAME         | CATEGORY_ID | PRICE    | STOCK_QUANTITY | ADDED_DATE |
+------------+--------------+-------------+----------+----------------+------------+
|        101 | MOBILE PHONE |           1 | 15000.00 |             49 | 2024-01-10 |
|        102 | LAPTOP       |           1 | 55000.00 |             20 | 2024-02-15 |
|        103 | T-SHIRT      |           2 |   500.00 |            100 | 2024-03-01 |
|        104 | NOVEL BOOK   |           3 |   300.00 |             80 | 2024-03-10 |
|        105 | MICROWAVE    |           4 |  8000.00 |             30 | 2024-03-20 |
|        106 | HEADPHONES   |           1 |  2000.00 |             40 | 2026-04-13 |
+------------+--------------+-------------+----------+----------------+------------+
6 rows in set (0.012 sec)
---=================================================================================================
     ---RETRIEVE CUSTOMERS WHO REGISTERED AFTER 2022 OR HAVE MADE PURCHASES ABOVE RUPEES 10,000---
---=================================================================================================
mysql> SELECT CUSTOMERS.CUSTOMER_ID,
    ->        CUSTOMERS.NAME
    -> FROM CUSTOMERS
    -> LEFT JOIN ORDERS
    -> ON CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID
    -> GROUP BY CUSTOMERS.CUSTOMER_ID, CUSTOMERS.NAME, CUSTOMERS.REGISTRATION_DATE
    -> HAVING CUSTOMERS.REGISTRATION_DATE > '2022-12-31'
    -> OR SUM(ORDERS.TOTAL_AMOUNT) > 10000;
+-------------+--------------+
| CUSTOMER_ID | NAME         |
+-------------+--------------+
|           1 | RAHUL SHARMA |
|           2 | PRIYA PATEL  |
|           3 | AMIT VERMA   |
|           4 | NEHA SINGH   |
|           5 | ROHAN MEHTA  |
|           6 | ANITA DAS    |
+-------------+--------------+
6 rows in set (0.098 sec)


======================================================
---4.) SORTING & GROUPING DATA (ORDER BY, GROUP BY)
======================================================
---================================================================
     ---LIST ALL PRODUCTS SORTED BY PRICE IN DESCENDING ORDER---
---================================================================
mysql> SELECT *
    -> FROM PRODUCTS
    -> ORDER BY PRODUCTS.PRICE DESC;
+------------+--------------+-------------+----------+----------------+------------+
| PRODUCT_ID | NAME         | CATEGORY_ID | PRICE    | STOCK_QUANTITY | ADDED_DATE |
+------------+--------------+-------------+----------+----------------+------------+
|        102 | LAPTOP       |           1 | 55000.00 |             20 | 2024-02-15 |
|        101 | MOBILE PHONE |           1 | 15000.00 |             49 | 2024-01-10 |
|        105 | MICROWAVE    |           4 |  8000.00 |             30 | 2024-03-20 |
|        106 | HEADPHONES   |           1 |  2000.00 |             40 | 2026-04-13 |
|        103 | T-SHIRT      |           2 |   500.00 |            100 | 2024-03-01 |
|        104 | NOVEL BOOK   |           3 |   300.00 |             80 | 2024-03-10 |
+------------+--------------+-------------+----------+----------------+------------+
6 rows in set (0.012 sec)
---================================================================
     ---DISPLAY THE NUMBER OF ORDERS PLACED BY EACH CUSTOMER---
---================================================================
mysql> SELECT ORDERS.CUSTOMER_ID,
    ->        COUNT(ORDERS.ORDER_ID) AS TOTAL_ORDERS
    -> FROM ORDERS
    -> GROUP BY ORDERS.CUSTOMER_ID;
+-------------+--------------+
| CUSTOMER_ID | TOTAL_ORDERS |
+-------------+--------------+
|           1 |            2 |
|           2 |            1 |
|           3 |            1 |
|           4 |            1 |
|           6 |            1 |
+-------------+--------------+
5 rows in set (0.008 sec)
---==========================================
     ---SHOW TOTAL REVENUE PER CATEGORY---
---==========================================
mysql> SELECT PRODUCTS.CATEGORY_ID,
    ->        SUM(ORDER_ITEMS.SUBTOTAL) AS TOTAL_REVENUE
    -> FROM ORDER_ITEMS
    -> INNER JOIN PRODUCTS
    -> ON ORDER_ITEMS.PRODUCT_ID = PRODUCTS.PRODUCT_ID
    -> GROUP BY PRODUCTS.CATEGORY_ID;
+-------------+---------------+
| CATEGORY_ID | TOTAL_REVENUE |
+-------------+---------------+
|           1 |      15000.00 |
|           3 |        800.00 |
|           2 |        500.00 |
+-------------+---------------+
3 rows in set (0.010 sec)


============================================================
---5.) USE AGGREGATE FUNCTIONS(SUM, AVG, MAX, MIN, COUNT)
============================================================
---========================================================
     ---FIND THE TOTAL REVENUE GENERATED BY THE STORE---
---========================================================
mysql> SELECT SUM(ORDERS.TOTAL_AMOUNT) AS TOTAL_REVENUE
    -> FROM ORDERS;
+---------------+
| TOTAL_REVENUE |
+---------------+
|      81300.00 |
+---------------+
1 row in set (0.012 sec)
---==============================================
     ---IDENTIFY THE MOST PURCHASED PRODUCT---
---==============================================
mysql> SELECT ORDER_ITEMS.PRODUCT_ID,
    ->        SUM(ORDER_ITEMS.QUANTITY) AS TOTAL_QUANTITY
    -> FROM ORDER_ITEMS
    -> GROUP BY ORDER_ITEMS.PRODUCT_ID
    -> ORDER BY TOTAL_QUANTITY DESC
    -> LIMIT 1;
+------------+----------------+
| PRODUCT_ID | TOTAL_QUANTITY |
+------------+----------------+
|        104 |              2 |
+------------+----------------+
1 row in set (0.009 sec)
---============================================
     ---CALCULATE THE AVERAGE ORDER VALUE---
---============================================
mysql> SELECT AVG(ORDERS.TOTAL_AMOUNT) AS AVG_ORDER_VALUE
    -> FROM ORDERS;
+-----------------+
| AVG_ORDER_VALUE |
+-----------------+
|    13550.000000 |
+-----------------+
1 row in set (0.007 sec)


========================================================
---6.) ESTABLISH PRIMARY & FOREIGN KEY RELATIONSHIPS
========================================================
---=============================================================
     ---ENSURE ORDERS ARE LINKED TO CUSTOMERS AND PRODUCTS---
---=============================================================
mysql> SELECT ORDERS.ORDER_ID,
    ->        CUSTOMERS.NAME
    -> FROM ORDERS
    -> INNER JOIN CUSTOMERS
    -> ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID;
+----------+--------------+
| ORDER_ID | NAME         |
+----------+--------------+
|      201 | RAHUL SHARMA |
|      203 | RAHUL SHARMA |
|      202 | PRIYA PATEL  |
|      204 | AMIT VERMA   |
|      205 | NEHA SINGH   |
|      206 | ANITA DAS    |
+----------+--------------+
6 rows in set (0.014 sec)
---=============================================================
     ---ESTABLISH RELATIONSHIPS BETWEEN PAYMENTS AND ORDERS---
---=============================================================
mysql> SELECT PAYMENTS.PAYMENT_ID,
    ->        ORDERS.ORDER_ID
    -> FROM PAYMENTS
    -> INNER JOIN ORDERS
    -> ON PAYMENTS.ORDER_ID = ORDERS.ORDER_ID;
+------------+----------+
| PAYMENT_ID | ORDER_ID |
+------------+----------+
|          1 |      201 |
|          2 |      202 |
|          3 |      203 |
|          4 |      204 |
|          5 |      205 |
+------------+----------+
5 rows in set (0.008 sec)
===========================
---7.) IMPLEMENT JOINS
===========================
---=============================================================
     ---RETRIEVE A LIST OF PRODUCTS ALONG WITH THEIR CATEGORY NAMES USING INNER JOIN---
---=============================================================
mysql> SELECT PRODUCTS.NAME,
    ->        CATEGORIES.CATEGORY_NAME
    -> FROM PRODUCTS
    -> INNER JOIN CATEGORIES
    -> ON PRODUCTS.CATEGORY_ID = CATEGORIES.CATEGORY_ID;
+--------------+-----------------+
| NAME         | CATEGORY_NAME   |
+--------------+-----------------+
| MOBILE PHONE | ELECTRONICS     |
| LAPTOP       | ELECTRONICS     |
| T-SHIRT      | CLOTHING        |
| NOVEL BOOK   | BOOKS           |
| MICROWAVE    | HOME APPLIANCES |
| HEADPHONES   | ELECTRONICS     |
+--------------+-----------------+
6 rows in set (0.011 sec)
---================================================================
     ---GET ALL ORDERS WITH CUSTOMER DETAILS USING LEFT JOIN ---
---================================================================
mysql> SELECT ORDERS.ORDER_ID,
    ->        CUSTOMERS.NAME
    -> FROM ORDERS
    -> LEFT JOIN CUSTOMERS
    -> ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID;
+----------+--------------+
| ORDER_ID | NAME         |
+----------+--------------+
|      201 | RAHUL SHARMA |
|      203 | RAHUL SHARMA |
|      202 | PRIYA PATEL  |
|      204 | AMIT VERMA   |
|      205 | NEHA SINGH   |
|      206 | ANITA DAS    |
+----------+--------------+
6 rows in set (0.015 sec)
---================================================================
     ---FIND ORDERS THAT HAVEN'T BEEN SHIPPED USING RIGHT JOIN---
---================================================================
mysql> SELECT ORDERS.ORDER_ID
    -> FROM ORDERS
    -> LEFT JOIN SHIPPING
    -> ON ORDERS.ORDER_ID = SHIPPING.ORDER_ID
    -> WHERE SHIPPING.SHIPPING_STATUS IS NULL
    -> OR SHIPPING.SHIPPING_STATUS != 'DELIVERED';
+----------+
| ORDER_ID |
+----------+
|      201 |
|      204 |
|      205 |
|      206 |
+----------+
4 rows in set (0.011 sec)
---=============================================================================
     ---SHOW CUSTOMERS WHO HAVE NEVER PLACED AN ORDER USING FULL OUTER JOIN---
---=============================================================================
mysql> SELECT CUSTOMERS.CUSTOMER_ID,
    ->        CUSTOMERS.NAME
    -> FROM CUSTOMERS
    -> LEFT JOIN ORDERS
    -> ON CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID
    -> WHERE ORDERS.ORDER_ID IS NULL;
+-------------+-------------+
| CUSTOMER_ID | NAME        |
+-------------+-------------+
|           5 | ROHAN MEHTA |
+-------------+-------------+
1 row in set (0.009 sec)


===========================
---8.) USE SUBQUERIES
===========================
---====================================================================
     ---FIND ORDERS PLACED BY CUSTOMERS WHO REGISTERED AFTER 2022---
---====================================================================
mysql> SELECT *
    -> FROM ORDERS
    -> WHERE ORDERS.CUSTOMER_ID IN (
    ->     SELECT CUSTOMERS.CUSTOMER_ID
    ->     FROM CUSTOMERS
    ->     WHERE CUSTOMERS.REGISTRATION_DATE > '2022-12-31'
    -> );
+----------+-------------+------------+--------------+-----------+
| ORDER_ID | CUSTOMER_ID | ORDER_DATE | TOTAL_AMOUNT | STATUS    |
+----------+-------------+------------+--------------+-----------+
|      201 |           1 | 2024-03-01 |     15500.00 | PENDING   |
|      203 |           1 | 2024-03-10 |       300.00 | DELIVERED |
|      202 |           2 | 2024-03-05 |       500.00 | SHIPPED   |
|      204 |           3 | 2024-03-15 |      8000.00 | CANCELLED |
|      206 |           6 | 2026-04-13 |      2000.00 | PENDING   |
+----------+-------------+------------+--------------+-----------+
5 rows in set (0.018 sec)
---=======================================================
     ---IDENTIFY THE CUSTOMER WHO HAS SPENT THE MOST---
---========================================================
mysql> SELECT ORDERS.CUSTOMER_ID,
    ->        SUM(ORDERS.TOTAL_AMOUNT) AS TOTAL_SPENT
    -> FROM ORDERS
    -> GROUP BY ORDERS.CUSTOMER_ID
    -> ORDER BY TOTAL_SPENT DESC
    -> LIMIT 1;
+-------------+-------------+
| CUSTOMER_ID | TOTAL_SPENT |
+-------------+-------------+
|           4 |    55000.00 |
+-------------+-------------+
1 row in set (0.010 sec)
---=====================================================
     ---GET PRODUCTS THAT HAVE NEVER BEEN OREDERED---
---=====================================================
mysql> SELECT PRODUCTS.PRODUCT_ID,
    ->        PRODUCTS.NAME
    -> FROM PRODUCTS
    -> WHERE PRODUCTS.PRODUCT_ID NOT IN (
    ->     SELECT ORDER_ITEMS.PRODUCT_ID
    ->     FROM ORDER_ITEMS
    -> );
+------------+------------+
| PRODUCT_ID | NAME       |
+------------+------------+
|        102 | LAPTOP     |
|        105 | MICROWAVE  |
|        106 | HEADPHONES |
+------------+------------+
3 rows in set (0.049 sec)


========================================
---9.) IMPLEMENT DATE & TIME FUNCTIONS
========================================
---=====================================================================
     ---EXTRACT THE MONTH FROM ORDER_DATE TO COUNT ORDERS PER MONTH---
---=====================================================================
mysql> SELECT MONTH(ORDERS.ORDER_DATE) AS ORDER_MONTH,
    ->        COUNT(*) AS TOTAL_ORDERS
    -> FROM ORDERS
    -> GROUP BY MONTH(ORDERS.ORDER_DATE);
+-------------+--------------+
| ORDER_MONTH | TOTAL_ORDERS |
+-------------+--------------+
|           3 |            5 |
|           4 |            1 |
+-------------+--------------+
2 rows in set (0.081 sec)
---========================================================================================================
     ---CALCULATE THE DELIVERY TIME BY FINDIND THE DIFFERENCE BETWEEN SHIPPING_DATE AND DELIVERY_DATE---
---========================================================================================================
mysql> SELECT SHIPPING.ORDER_ID,
    ->        DATEDIFF(SHIPPING.DELIVERY_DATE, SHIPPING.SHIPPING_DATE) AS DELIVERY_DAYS
    -> FROM SHIPPING;
+----------+---------------+
| ORDER_ID | DELIVERY_DAYS |
+----------+---------------+
|      201 |             3 |
|      202 |             2 |
|      203 |             2 |
|      204 |          NULL |
|      205 |          NULL |
+----------+---------------+
5 rows in set (0.084 sec)
---==========================================
     ---FORMAT ORDER_DATE AS DD-MM-YYYY---
---==========================================
mysql> SELECT DATE_FORMAT(ORDERS.ORDER_DATE, '%d-%m-%Y') AS FORMATTED_DATE
    -> FROM ORDERS;
+----------------+
| FORMATTED_DATE |
+----------------+
| 01-03-2024     |
| 05-03-2024     |
| 10-03-2024     |
| 15-03-2024     |
| 18-03-2024     |
| 13-04-2026     |
+----------------+
6 rows in set (0.087 sec)


============================================
---10.) USE STRING MANIPULATION FUNCTIONS
============================================
---=================================================
     ---CONVERT ALL PRODUCTS NAMES TO UPPERCASE---
---=================================================
mysql> SELECT UPPER(PRODUCTS.NAME) AS PRODUCT_NAME
    -> FROM PRODUCTS;
+--------------+
| PRODUCT_NAME |
+--------------+
| MOBILE PHONE |
| LAPTOP       |
| T-SHIRT      |
| NOVEL BOOK   |
| MICROWAVE    |
| HEADPHONES   |
+--------------+
6 rows in set (0.078 sec)
---=============================================
     ---TRIM WHITESPACE FROM CUSTOMER NAMES---
---=============================================
mysql> SELECT TRIM(CUSTOMERS.NAME) AS CLEAN_NAME
    -> FROM CUSTOMERS;
+--------------+
| CLEAN_NAME   |
+--------------+
| RAHUL SHARMA |
| PRIYA PATEL  |
| AMIT VERMA   |
| NEHA SINGH   |
| ROHAN MEHTA  |
| ANITA DAS    |
+--------------+
6 rows in set (0.035 sec)
---=========================================================
     ---REPLACE MISSING EMAIL VALUES WITH "NOT PROVIDED"---
---=========================================================
mysql> SELECT CUSTOMERS.NAME,
    ->        COALESCE(CUSTOMERS.EMAIL, 'Not Provided') AS EMAIL
    -> FROM CUSTOMERS;
+--------------+----------------+
| NAME         | EMAIL          |
+--------------+----------------+
| RAHUL SHARMA | RAHUL@MAIL.COM |
| PRIYA PATEL  | PRIYA@MAIL.COM |
| AMIT VERMA   | Not Provided   |
| NEHA SINGH   | NEHA@MAIL.COM  |
| ROHAN MEHTA  | Not Provided   |
| ANITA DAS    | ANITA@MAIL.COM |
+--------------+----------------+
6 rows in set (0.007 sec)


=====================================
---11.) IMPLEMENT WINDOW FUNCTIONS
=====================================
---================================================
     ---RANK CUSTOMERS BASED ON TOTAL SPENDING---
---================================================
mysql> SELECT ORDERS.CUSTOMER_ID,
    ->        SUM(ORDERS.TOTAL_AMOUNT) AS TOTAL_SPENT,
    ->        RANK() OVER (ORDER BY SUM(ORDERS.TOTAL_AMOUNT) DESC) AS RANKING
    -> FROM ORDERS
    -> GROUP BY ORDERS.CUSTOMER_ID;
+-------------+-------------+---------+
| CUSTOMER_ID | TOTAL_SPENT | RANKING |
+-------------+-------------+---------+
|           4 |    55000.00 |       1 |
|           1 |    15800.00 |       2 |
|           3 |     8000.00 |       3 |
|           6 |     2000.00 |       4 |
|           2 |      500.00 |       5 |
+-------------+-------------+---------+
5 rows in set (0.091 sec)
---=====================================================
     ---SHOW THE CUMULATIVE TOTAL REVENUE PER MONTH---
---=====================================================
mysql> SELECT MONTH(ORDERS.ORDER_DATE) AS MONTH,
    ->        SUM(ORDERS.TOTAL_AMOUNT) AS MONTHLY_REVENUE,
    ->        SUM(SUM(ORDERS.TOTAL_AMOUNT)) OVER (ORDER BY MONTH(ORDERS.ORDER_DATE)) AS CUMULATIVE_REVENUE
    -> FROM ORDERS
    -> GROUP BY MONTH(ORDERS.ORDER_DATE);
+-------+-----------------+--------------------+
| MONTH | MONTHLY_REVENUE | CUMULATIVE_REVENUE |
+-------+-----------------+--------------------+
|     3 |        79300.00 |           79300.00 |
|     4 |         2000.00 |           81300.00 |
+-------+-----------------+--------------------+
2 rows in set (0.041 sec)
---====================================================
     ---DISPLAY THE RUNNING TOTAL OF ORDERS PLACED---
---====================================================
mysql> SELECT ORDERS.ORDER_ID,
    ->        SUM(ORDERS.TOTAL_AMOUNT) OVER (ORDER BY ORDERS.ORDER_DATE) AS RUNNING_TOTAL
    -> FROM ORDERS;
+----------+---------------+
| ORDER_ID | RUNNING_TOTAL |
+----------+---------------+
|      201 |      15500.00 |
|      202 |      16000.00 |
|      203 |      16300.00 |
|      204 |      24300.00 |
|      205 |      79300.00 |
|      206 |      81300.00 |
+----------+---------------+
6 rows in set (0.010 sec)


=====================================
---12.) APPLY SQL CASE EXPRESSIONS
=====================================
---==============================================================
     ---ASSIGN A LOYALTY_STATUS TO CUSTOMERS:---
     --> "GOLD" IF THEY HAVE SPENT ABOVE RUPEE 50000.
     --> "SILVER" IF THEY HAVE SPENT BETWEEN RUPEE 20000-50000
     --> "BRONZE" OTHERWISE
---==============================================================
mysql> SELECT ORDERS.CUSTOMER_ID,
    ->        SUM(ORDERS.TOTAL_AMOUNT) AS TOTAL_SPENT,
    ->        CASE
    ->            WHEN SUM(ORDERS.TOTAL_AMOUNT) > 50000 THEN 'Gold'
    ->            WHEN SUM(ORDERS.TOTAL_AMOUNT) BETWEEN 20000 AND 50000 THEN 'Silver'
    ->            ELSE 'Bronze'
    ->        END AS LOYALTY_STATUS
    -> FROM ORDERS
    -> GROUP BY ORDERS.CUSTOMER_ID;
+-------------+-------------+----------------+
| CUSTOMER_ID | TOTAL_SPENT | LOYALTY_STATUS |
+-------------+-------------+----------------+
|           1 |    15800.00 | Bronze         |
|           2 |      500.00 | Bronze         |
|           3 |     8000.00 | Bronze         |
|           4 |    55000.00 | Gold           |
|           6 |     2000.00 | Bronze         |
+-------------+-------------+----------------+
5 rows in set (0.070 sec)
---====================================================
     ---CATEGORIZE PRODUCTS---
     --> "BEST SELLER" IF SOLD MORE THAN 500 UNITS
     --> "POPULAR" IF SOLD BETWEEN 200-500 UNITS
     --> "REGULAR" OTHERWISE
---====================================================
mysql> SELECT ORDER_ITEMS.PRODUCT_ID,
    ->        SUM(ORDER_ITEMS.QUANTITY) AS TOTAL_SOLD,
    ->        CASE
    ->            WHEN SUM(ORDER_ITEMS.QUANTITY) > 500 THEN 'Best Seller'
    ->            WHEN SUM(ORDER_ITEMS.QUANTITY) BETWEEN 200 AND 500 THEN 'Popular'
    ->            ELSE 'Regular'
    ->        END AS PRODUCT_CATEGORY
    -> FROM ORDER_ITEMS
    -> GROUP BY ORDER_ITEMS.PRODUCT_ID;
+------------+------------+------------------+
| PRODUCT_ID | TOTAL_SOLD | PRODUCT_CATEGORY |
+------------+------------+------------------+
|        101 |          1 | Regular          |
|        103 |          1 | Regular          |
|        104 |          2 | Regular          |
+------------+------------+------------------+
3 rows in set (0.009 sec)

