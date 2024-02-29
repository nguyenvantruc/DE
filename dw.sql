USE [DW]
GO
CREATE SCHEMA lesson3
GO
/****** Object:  Table [lesson3].[Dim_Date]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_Date](
	[DateKey] [nvarchar](8) NOT NULL,
	[MonthKey] [nvarchar](6) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Dim_Month]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_Month](
	[MonthKey] [nvarchar](6) NOT NULL,
	[YearKey] [nvarchar](4) NOT NULL,
	[Month] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Month] PRIMARY KEY CLUSTERED 
(
	[MonthKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Dim_Product]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_Product](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Weight] [decimal](8, 2) NULL,
	[ProductSubCategoryKey] [int] NOT NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Dim_ProductCategory]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_ProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Dim_ProductSubCategory]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_ProductSubCategory](
	[ProductSubCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductCategoryKey] [int] NOT NULL,
 CONSTRAINT [PK_Dim_ProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProductSubCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Dim_SalesPerson]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_SalesPerson](
	[SalesPersonKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesPersonId] [int] NOT NULL,
	[FullName] [nvarchar](500) NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
 CONSTRAINT [PK_Dim_SalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Dim_Territory]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_Territory](
	[TerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryRegionCode] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Dim_Territory] PRIMARY KEY CLUSTERED 
(
	[TerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Dim_Year]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Dim_Year](
	[YearKey] [nvarchar](4) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Year] PRIMARY KEY CLUSTERED 
(
	[YearKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Fact_Product]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Fact_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[ProductKey] [int] NOT NULL,
	[TerritoryKey] [int] NOT NULL,
	[Qty] [bigint] NOT NULL,
 CONSTRAINT [PK_Fact_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [lesson3].[Fact_SalesOrder]    Script Date: 9/20/2023 1:13:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [lesson3].[Fact_SalesOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[TerritoryKey] [int] NULL,
	[SalesPersonKey] [int] NULL,
	[Revenue] [money] NOT NULL,
	[NumberOrder] [int] NOT NULL,
 CONSTRAINT [PK_Fact_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [lesson3].[Dim_Date]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Date_Dim_Month] FOREIGN KEY([MonthKey])
REFERENCES [lesson3].[Dim_Month] ([MonthKey])
GO
ALTER TABLE [lesson3].[Dim_Date] CHECK CONSTRAINT [FK_Dim_Date_Dim_Month]
GO
ALTER TABLE [lesson3].[Dim_Month]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Month_Dim_Year] FOREIGN KEY([YearKey])
REFERENCES [lesson3].[Dim_Year] ([YearKey])
GO
ALTER TABLE [lesson3].[Dim_Month] CHECK CONSTRAINT [FK_Dim_Month_Dim_Year]
GO
ALTER TABLE [lesson3].[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_Dim_ProductSubCat] FOREIGN KEY([ProductSubCategoryKey])
REFERENCES [lesson3].[Dim_ProductSubCategory] ([ProductSubCategoryKey])
GO
ALTER TABLE [lesson3].[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_Dim_ProductSubCat]
GO
ALTER TABLE [lesson3].[Dim_ProductSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_Dim_ProductSubCat_Dim_ProductCat] FOREIGN KEY([ProductCategoryKey])
REFERENCES [lesson3].[Dim_ProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [lesson3].[Dim_ProductSubCategory] CHECK CONSTRAINT [FK_Dim_ProductSubCat_Dim_ProductCat]
GO
ALTER TABLE [lesson3].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES [lesson3].[Dim_Date] ([DateKey])
GO
ALTER TABLE [lesson3].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Date]
GO
ALTER TABLE [lesson3].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Product] FOREIGN KEY([ProductKey])
REFERENCES [lesson3].[Dim_Product] ([ProductKey])
GO
ALTER TABLE [lesson3].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Product]
GO
ALTER TABLE [lesson3].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Territory] FOREIGN KEY([TerritoryKey])
REFERENCES [lesson3].[Dim_Territory] ([TerritoryKey])
GO
ALTER TABLE [lesson3].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Territory]
GO
ALTER TABLE [lesson3].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES [lesson3].[Dim_Date] ([DateKey])
GO
ALTER TABLE [lesson3].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Date]
GO
ALTER TABLE [lesson3].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_SalesPerson] FOREIGN KEY([SalesPersonKey])
REFERENCES [lesson3].[Dim_SalesPerson] ([SalesPersonKey])
GO
ALTER TABLE [lesson3].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_SalesPerson]
GO
ALTER TABLE [lesson3].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Territory] FOREIGN KEY([TerritoryKey])
REFERENCES [lesson3].[Dim_Territory] ([TerritoryKey])
GO
ALTER TABLE [lesson3].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Territory]
GO
