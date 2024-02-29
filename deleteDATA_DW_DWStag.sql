Use DW
delete [Lesson3].[Fact_SalesOrder]
dbcc CHECKIDENT ('[DW].[Lesson3].[Fact_SalesOrder]',RESEED, 1)
DELETE [Lesson3].[Dim_Date]
DELETE Lesson3.Dim_Month
DELETE Lesson3.Dim_Year
delete [Lesson3].[Dim_Territory]
dbcc CHECKIDENT ('[DW].[Lesson3].[Dim_Territory]',RESEED, 1)
delete [Lesson3].[Dim_SalesPerson]
dbcc CHECKIDENT ('[DW].[Lesson3].[Dim_SalesPerson]',RESEED, 1)
USE DW_STAGGING
TRUNCATE TABLE[lesson3].[Dim_Date]
TRUNCATE TABLE[lesson3].[Dim_Product]
TRUNCATE TABLE[lesson3].[Dim_SalesPerson]
TRUNCATE TABLE[lesson3].[Dim_Territory]
TRUNCATE TABLE[lesson3].[Employee]
TRUNCATE TABLE[lesson3].[Fact_Product]
TRUNCATE TABLE[lesson3].[Fact_SalesOrder]
TRUNCATE TABLE[lesson3].[OrderDetail]
TRUNCATE TABLE[lesson3].[OrderHeader]
TRUNCATE TABLE[lesson3].[Person]
TRUNCATE TABLE[lesson3].[ProductCategory]
TRUNCATE TABLE[lesson3].[ProductSubCategory]
TRUNCATE TABLE[lesson3].[Territory]
