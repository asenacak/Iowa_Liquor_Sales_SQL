-- Data Quality Check: 
-- Creating a table to display the null and unique counts for each variable in the sales table.

-- Null counts calculation for each variable
WITH nullCounts AS (
  SELECT 
    'Null Counts' AS Type,
    SUM(CASE WHEN invoice_and_item_number IS NULL THEN 1 ELSE 0 END) AS inv_count,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS date_count,
    SUM(CASE WHEN store_number IS NULL THEN 1 ELSE 0 END) AS storeno_count,
    SUM(CASE WHEN store_name IS NULL THEN 1 ELSE 0 END) AS store_name_count,
    SUM(CASE WHEN address IS NULL THEN 1 ELSE 0 END) AS address_count,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS city_count,
    SUM(CASE WHEN zip_code IS NULL THEN 1 ELSE 0 END) AS zip_code_count,
    SUM(CASE WHEN store_location IS NULL THEN 1 ELSE 0 END) AS store_loc_count,
    SUM(CASE WHEN county_number IS NULL THEN 1 ELSE 0 END) AS county_no_count,
    SUM(CASE WHEN county IS NULL THEN 1 ELSE 0 END) AS county_count,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_count,
    SUM(CASE WHEN category_name IS NULL THEN 1 ELSE 0 END) AS cat_name_count,
    SUM(CASE WHEN vendor_number IS NULL THEN 1 ELSE 0 END) AS vend_no_count,
    SUM(CASE WHEN vendor_name IS NULL THEN 1 ELSE 0 END) AS vend_name_count,
    SUM(CASE WHEN item_number IS NULL THEN 1 ELSE 0 END) AS item_no_count,
    SUM(CASE WHEN item_description IS NULL THEN 1 ELSE 0 END) AS item_desc_count,
    SUM(CASE WHEN pack IS NULL THEN 1 ELSE 0 END) AS pack_count,
    SUM(CASE WHEN bottle_volume_ml IS NULL THEN 1 ELSE 0 END) AS bottle_vml_count,
    SUM(CASE WHEN state_bottle_cost IS NULL THEN 1 ELSE 0 END) AS bottle_cost_count,
    SUM(CASE WHEN state_bottle_retail IS NULL THEN 1 ELSE 0 END) AS bottle_retail_count,
    SUM(CASE WHEN bottles_sold IS NULL THEN 1 ELSE 0 END) AS bottles_sold_count,
    SUM(CASE WHEN sale_dollars IS NULL THEN 1 ELSE 0 END) AS sale_dollars_count,
    SUM(CASE WHEN volume_sold_liters IS NULL THEN 1 ELSE 0 END) AS vsold_liters_count,
    SUM(CASE WHEN volume_sold_gallons IS NULL THEN 1 ELSE 0 END) AS vsold_gallons_count
  FROM sales
), 

-- Unique counts calculation for each variable
uniqueCounts AS (
  SELECT
    'Unique Counts' AS Type,
    COUNT(DISTINCT invoice_and_item_number) AS inv_count,
    COUNT(DISTINCT date) AS date_count,
    COUNT(DISTINCT store_number) AS storeno_count,
    COUNT(DISTINCT store_name) AS store_name_count,
    COUNT(DISTINCT address) AS address_count,
    COUNT(DISTINCT city) AS city_count,
    COUNT(DISTINCT zip_code) AS zip_code_count,
    COUNT(DISTINCT store_location) AS store_loc_count,
    COUNT(DISTINCT county_number) AS county_no_count,
    COUNT(DISTINCT county) AS county_count,
    COUNT(DISTINCT category) AS category_count,
    COUNT(DISTINCT category_name) AS cat_name_count,
    COUNT(DISTINCT vendor_number) AS vend_no_count,
    COUNT(DISTINCT vendor_name) AS vend_name_count,
    COUNT(DISTINCT item_number) AS item_no_count,
    COUNT(DISTINCT item_description) AS item_desc_count,
    COUNT(DISTINCT pack) AS pack_count,
    COUNT(DISTINCT bottle_volume_ml) AS bottle_vml_count,
    COUNT(DISTINCT state_bottle_cost) AS bottle_cost_count,
    COUNT(DISTINCT state_bottle_retail) AS bottle_retail_count,
    COUNT(DISTINCT bottles_sold) AS bottles_sold_count,
    COUNT(DISTINCT sale_dollars) AS sale_dollars_count,
    COUNT(DISTINCT volume_sold_liters) AS vsold_liters_count,
    COUNT(DISTINCT volume_sold_gallons) AS vsold_gallons_count
  FROM sales
)

-- Combining the results of null and unique counts into a single table
SELECT * FROM nullCounts
UNION ALL
SELECT * FROM uniqueCounts;



