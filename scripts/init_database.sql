/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'ProductAnalysis_DWH' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'ProductAnalysis_DWH' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'ProductAnalysis_DWH' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'ProductAnalysis_DWH')
BEGIN
    ALTER DATABASE ProductAnalysis_DWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ProductAnalysis_DWH;
END;
GO

-- Create the 'ProductAnalysis_DWH' database
CREATE DATABASE ProductAnalysis_DWH;
GO

USE ProductAnalysis_DWH;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
