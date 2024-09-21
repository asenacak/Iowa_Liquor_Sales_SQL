# Iowa Liquor Sales Analysis Using PostgreSQL
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-12.3-336791.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

This project conducts a detailed analysis of the Iowa Liquor Sales dataset utilizing PostgreSQL.

## Dataset
The dataset is available publicly on BigQuery and can be accessed here: [Iowa Liquor Sales Dataset](https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=iowa_liquor_sales&page=dataset&project=vigilant-signer-371216&ws=!1m9!1m4!4m3!1sbigquery-public-data!2siowa_liquor_sales!3ssales!1m3!3m2!1sbigquery-public-data!2siowa_liquor_sales). This dataset is updated regularly and the time period is between January 2012 and August 2024. 

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

