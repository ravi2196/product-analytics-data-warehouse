/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.crm_customers', 'U') IS NOT NULL
    DROP TABLE bronze.crm_customers;
GO

CREATE TABLE bronze.crm_customers (
    customer_id                 NVARCHAR(50),
    customer_unique_id          NVARCHAR(50),
    customer_zip_code_prefix    NVARCHAR(10),
    customer_city               NVARCHAR(50),
    customer_state              NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.crm_geolocations', 'U') IS NOT NULL
    DROP TABLE bronze.crm_geolocations;
GO

CREATE TABLE bronze.crm_geolocations (
    geolocation_zip_code_prefix VARCHAR(10),
    geolocation_lat DECIMAL(9,6),
    geolocation_lng DECIMAL(9,6),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(50)
);
GO

IF OBJECT_ID('bronze.crm_sellers', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sellers;
GO

CREATE TABLE bronze.crm_sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix VARCHAR(10),
    seller_city VARCHAR(100),
    seller_state VARCHAR(50)
);
GO

IF OBJECT_ID('bronze.oms_orders', 'U') IS NOT NULL
    DROP TABLE bronze.oms_orders;
GO

CREATE TABLE bronze.oms_orders (
    order_id                      VARCHAR(50),
    customer_id                   VARCHAR(50),
    order_status                  VARCHAR(30),
    order_purchase_timestamp      DATETIME2,
    order_approved_at             DATETIME2,
    order_delivered_carrier_date  DATETIME2,
    order_delivered_customer_date DATETIME2,
    order_estimated_delivery_date DATETIME2
);
GO

IF OBJECT_ID('bronze.oms_order_items', 'U') IS NOT NULL
    DROP TABLE bronze.oms_order_items;
GO

CREATE TABLE bronze.oms_order_items (
    order_id            VARCHAR(50),
    order_item_id       INT,
    product_id          VARCHAR(50),
    seller_id           VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price               DECIMAL(10,2),
    freight_value       DECIMAL(10,2)
);
GO

IF OBJECT_ID('bronze.oms_payments', 'U') IS NOT NULL
    DROP TABLE bronze.oms_payments;
GO

CREATE TABLE bronze.oms_payments (
    order_id              VARCHAR(50),
    payment_sequential    INT,
    payment_type          VARCHAR(30),
    payment_installments  INT,
    payment_value         DECIMAL(10,2)
);
GO

IF OBJECT_ID('bronze.oms_reviews', 'U') IS NOT NULL
    DROP TABLE bronze.oms_reviews;
GO

CREATE TABLE bronze.oms_reviews (
    review_id                VARCHAR(MAX),
    order_id                 VARCHAR(MAX),
    review_score             VARCHAR(MAX),
    review_comment_title     VARCHAR(255),
    review_comment_message   TEXT,
    review_creation_date     NVARCHAR(MAX),
    review_answer_timestamp  NVARCHAR(MAX)
);
GO

IF OBJECT_ID('bronze.erp_products', 'U') IS NOT NULL
    DROP TABLE bronze.erp_products;
GO

CREATE TABLE bronze.erp_products (
    product_id                     VARCHAR(50),
    product_category_name          NVARCHAR(100),
    product_name_lenght            INT,
    product_description_lenght     INT,
    product_photos_qty             INT,
    product_weight_g               INT,
    product_length_cm              INT,
    product_height_cm              INT,
    product_width_cm               INT
);
GO

IF OBJECT_ID('bronze.erp_product_categories', 'U') IS NOT NULL
    DROP TABLE bronze.erp_product_categories;
GO

CREATE TABLE bronze.erp_product_categories (
    product_category_name           NVARCHAR(100),
    product_category_name_english   NVARCHAR(100)
);
GO
