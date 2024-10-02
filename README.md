# Iowa Liquor Sales Analysis Using PostgreSQL
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-12.3-336791.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

This project presents an analysis of the Iowa Liquor Sales dataset using PostgreSQL, providing insights into sales trends, top-selling products, vendors, and regional performance. The goal of this project is to identify key business drivers and growth opportunities based on the data.

## Dataset
The dataset is publicly available on BigQuery and covers the period from January 2012 to August 2024. It includes detailed transaction-level information on liquor sales across Iowa, including store details, product categories, vendors, and sales amounts.

You can access the dataset here: [Iowa Liquor Sales Dataset](https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=iowa_liquor_sales&page=dataset&project=vigilant-signer-371216&ws=!1m9!1m4!4m3!1sbigquery-public-data!2siowa_liquor_sales!3ssales!1m3!3m2!1sbigquery-public-data!2siowa_liquor_sales). 

### Variables
1. invoice_and_item_number: A unique identifier for the individual liquor products included in the store order
2. date                   : Date of order
3. store_number           : Unique number assigned to the store who ordered the liquor
4. store_name             : Name of store who ordered the liquor
5. address                : Address of store who ordered the liquor
6. city                   : City where the store who ordered the liquor is located
7. zip_code               : Zip code where the store who ordered the liquor is located
8. store_location         : Location of store who ordered the liquor. The Address, City, State and Zip Code are geocoded to provide geographic coordinates. Accuracy of geocoding is dependent on how well the address is interpreted and the completeness of the reference data used.
9. county_number          : Iowa county number for the county where store who ordered the liquor is located
10. county                : County where the store who ordered the liquor is located
11. category              : Category code associated with the liquor ordered
12. category_name         : Category of the liquor ordered
13. vendor_number         : The vendor number of the company for the brand of liquor ordered
14. vendor_name           : The vendor name of the company for the brand of liquor ordered
15. item_number           : Item number for the individual liquor product ordered
16. item_description      : Description of the individual liquor product ordered
17. pack                  : The number of bottles in a case for the liquor ordered
18. bottle_volume_ml      : Volume of each liquor bottle ordered in milliliters
19. state_bottle_cost     : The amount that Alcoholic Beverages Division paid for each bottle of liquor ordered
20. state_bottle_retail   : The amount the store paid for each bottle of liquor ordered
21. bottles_sold          : The number of bottles of liquor ordered by the store
22. sale_dollars          : Total cost of liquor order (number of bottles multiplied by the state bottle retail)
23. volume_sold_liters    : Total volume of liquor ordered in liters. (i.e. (Bottle Volume (ml) x Bottles Sold)/1,000)
24. volume_sold_gallons   : Total volume of liquor ordered in gallons. (i.e. (Bottle Volume (ml) x Bottles Sold)/3785.411784)

## Project Structure

- **LICENSE**: Project's license.
- **README.md**: Project overview and guide.
- **countNullUnique.sql**: Counts null and unique values in the dataset.
- **createSalesTable.sql**: Creates database tables and loads data.
- **iowa.csv**: Raw dataset file.
- **overallAnalysis.sql**: SQL scripts for detailed analysis.




## Analysis Overview
This project uses SQL queries to analyze the dataset from multiple perspectives, such as product performance, regional trends, and growth analysis. 

### 1) Top 10 Products, Vendors, Stores, Cities, and Counties by Sales
* Objective: Identify the top-performing liquor categories, suppliers, retailers, cities, and counties based on total sales revenue.
* Value: These analyses help pinpoint the most successful products and regions, enabling strategic business decisions on product stocking and market focus.

### 2)  Yearly and Monthly Sales
* Objective: Examine sales trends over time (both yearly and monthly).
* Value: Businesses can use this analysis to plan inventory, marketing campaigns, and promotions, optimizing them for peak seasons and identifying growth opportunities.

### 3) Annual Growth Rate
* Objective: Calculate year-over-year sales growth to identify high-growth periods.

### 4) Annual Sales by Category
* Objective: Break down yearly sales by product categories to track the demand for different types of liquor over time.
* Value: Helps in understanding which categories are growing in popularity and which are declining.

### 5) Annual Sales by City and County
* Objective: Analyze annual sales at the city and county levels to identify regional trends.
* Value: Provides insights into which regions are consistently driving higher sales, enabling targeted regional marketing and inventory planning.

### 6) Consistently Sold Categories
* Objective: Identify liquor categories that have been sold every year for the 13-year period in the dataset.
* Value: Shows which products have sustained demand, indicating reliable categories that businesses can prioritize in long-term planning.
