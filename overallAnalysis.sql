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

--8) Annual Growth

--- Step 1: Create a CTE (Common Table Expression) to calculate total sales for each year
WITH current_total_sales AS (
  SELECT
   EXTRACT(YEAR FROM date) AS year, 
   ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS cur_total_sales 
  FROM sales
  WHERE EXTRACT(YEAR FROM date) < 2024 -- Exclude 2024 due to incomplete data
  GROUP BY year 
  ORDER BY year
)
--- Step 2: Calculate the year-over-year sales growth
SELECT *
FROM (
  SELECT
    year,
    cur_total_sales, 
    COALESCE(LAG(cur_total_sales) OVER (ORDER BY year), 0) AS previous_year_sale, 
    ROUND(((cur_total_sales - LAG(cur_total_sales) OVER (ORDER BY year)) / LAG(cur_total_sales) OVER (ORDER BY year)) * 100, 2) AS growth 
  FROM current_total_sales
) AS sales_growth
WHERE year > 2012; -- Exclude 2012 because there's no data for 2011

--9) Annual Sales by Category

SELECT 
  category_name,
  EXTRACT(YEAR FROM date) AS year,
  ROUND(CAST(SUM(sale_dollars) AS numeric), 2) AS total_sales
FROM sales
WHERE category_name IS NOT NULL 
GROUP BY category_name, year
ORDER BY category_name, year;

--10) Annual Sales by City

SELECT 
 EXTRACT(YEAR FROM date) AS year,
 city,
 ROUND(CAST(SUM(sale_dollars) AS numeric), 2) total_sales
FROM sales
WHERE city IS NOT NULL
GROUP BY city, year
ORDER BY city, year;

--11) Annual Sales by County

SELECT 
 EXTRACT(YEAR FROM date) AS year,
 county,
 ROUND(CAST(SUM(sale_dollars) AS numeric), 2) total_sales
FROM sales
WHERE county IS NOT NULL
GROUP BY county, year
ORDER BY county, year;


-- 12) Products\Categories Sold Every Year for 13 Years

SELECT 
  category_name
FROM sales
GROUP BY category_name
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM date)) = 13 -- 13-year data
ORDER BY category_name;
