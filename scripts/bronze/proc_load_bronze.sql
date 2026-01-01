/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------';

		SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.crm_customers';
		TRUNCATE TABLE bronze.crm_customers;

		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		 BULK INSERT bronze.crm_customers
        FROM '/var/opt/mssql/data/olist_customers_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.crm_geolocations';
		TRUNCATE TABLE bronze.crm_geolocations;

		PRINT '>> Inserting Data Into: bronze.crm_geolocations';
		BULK INSERT bronze.crm_geolocations
        FROM '/var/opt/mssql/data/olist_geolocation_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.crm_sellers';
		TRUNCATE TABLE bronze.crm_sellers;

		PRINT '>> Inserting Data Into: bronze.crm_sellers';
		BULK INSERT bronze.crm_sellers
        FROM '/var/opt/mssql/data/olist_sellers_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		PRINT '------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------';
		
		SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.erp_orders';
		TRUNCATE TABLE bronze.erp_orders;

		PRINT '>> Inserting Data Into: bronze.erp_orders';
		BULK INSERT bronze.erp_orders
        FROM '/var/opt/mssql/data/olist_orders_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.erp_order_items';
		TRUNCATE TABLE bronze.erp_order_items;

		PRINT '>> Inserting Data Into: bronze.erp_order_items';
		BULK INSERT bronze.erp_order_items
        FROM '/var/opt/mssql/data/olist_order_items_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.erp_payments';
		TRUNCATE TABLE bronze.erp_payments;

		PRINT '>> Inserting Data Into: bronze.erp_payments';
		BULK INSERT bronze.erp_payments
        FROM '/var/opt/mssql/data/olist_order_payments_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.erp_reviews';
		TRUNCATE TABLE bronze.erp_reviews;

		PRINT '>> Inserting Data Into: bronze.erp_reviews';
		BULK INSERT bronze.erp_reviews
        FROM '/var/opt/mssql/data/olist_order_reviews_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.erp_products';
		TRUNCATE TABLE bronze.erp_products;
        
		PRINT '>> Inserting Data Into: bronze.erp_products';
		BULK INSERT bronze.erp_products
        FROM '/var/opt/mssql/data/olist_products_dataset.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            -- CODEPAGE = '65001',   -- UTF-8 (important)
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        SET @start_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Truncating Table: bronze.erp_product_categories';
		TRUNCATE TABLE bronze.erp_product_categories;

		PRINT '>> Inserting Data Into: bronze.erp_product_categories';
		BULK INSERT bronze.erp_product_categories
        FROM '/var/opt/mssql/data/product_category_name_translation.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
		SET @end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		SET @batch_end_time = CAST(
                SYSDATETIMEOFFSET()
                    AT TIME ZONE 'UTC'
                    AT TIME ZONE 'India Standard Time'
                AS DATETIME
            );
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END

