-- Creating the sales table
CREATE TABLE sales (
  invoice_and_item_number VARCHAR(255),
  date DATE,
  store_number VARCHAR(50),
  store_name VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(100),
  zip_code VARCHAR(50),
  store_location VARCHAR(255),
  county_number VARCHAR(50),
  county VARCHAR(255),
  category VARCHAR(50),
  category_name VARCHAR(255),
  vendor_number VARCHAR(50),
  vendor_name VARCHAR(255),
  item_number VARCHAR(50),
  item_description VARCHAR(255),
  pack INTEGER,
  bottle_volume_ml INTEGER,
  state_bottle_cost FLOAT,
  state_bottle_retail FLOAT,
  bottles_sold INTEGER,
  sale_dollars FLOAT,
  volume_sold_liters FLOAT,
  volume_sold_gallons FLOAT
);

-- Uploading the iowa.csv file
COPY sales
FROM '/Users/gulsumasenacakir/Downloads/iowa.csv' -- change the file path accordingly
DELIMITER ',' 
CSV HEADER;
