-- Overall Sales Analysis for the Entire Period (Jan 2012 - Aug 2024)

---1) Top 10 Products (Categories) (The categories with the highest sales)

SELECT 
  category_name,
  ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sale
FROM sales
GROUP BY category_name
ORDER BY total_sale DESC
LIMIT 10;

---2) Top 10 Vendors/Suppliers by Sales

SELECT 
 vendor_name, 
 city,
 county,
 ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sale
FROM sales
GROUP BY vendor_name, city, county
ORDER BY total_sale DESC
LIMIT 10;

--3) Top 10 Stores/Retailers by Sales

SELECT 
 store_name,
 city,
 county,
 ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sales
FROM sales
GROUP BY store_name, city, county
ORDER BY total_sales DESC
LIMIT 10;

--4) Top 10 Cities by Sales

SELECT 
 city,
 county,
 ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sales
FROM sales
WHERE city IS NOT NULL
GROUP BY city, county
ORDER BY total_sales DESC
LIMIT 10;

--5) Top 10 Counties by Sales

SELECT
 county,
 ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sale
FROM sales
WHERE county IS NOT NULL
GROUP BY county
ORDER BY total_sale DESC
LIMIT 10;

--6) Yearly Sales

SELECT 
 EXTRACT(YEAR FROM date) as year,
 ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sale
FROM sales
GROUP BY year
ORDER BY year;

--7) Monthly Sales

SELECT
  TO_CHAR(date, 'Month') AS month_name, 
  ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sale
FROM sales
GROUP BY month_name
ORDER BY MIN(EXTRACT(MONTH FROM date));


