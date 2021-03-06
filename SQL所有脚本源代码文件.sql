USE [master]
GO
/****** Object:  Database [Caigoudatabase]    Script Date: 2021-11-18 10:55:34 ******/
CREATE DATABASE [Caigoudatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Caigoudatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Caigoudatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Caigoudatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Caigoudatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Caigoudatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Caigoudatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Caigoudatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Caigoudatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Caigoudatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Caigoudatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Caigoudatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [Caigoudatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Caigoudatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Caigoudatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Caigoudatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Caigoudatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Caigoudatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Caigoudatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Caigoudatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Caigoudatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Caigoudatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Caigoudatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Caigoudatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Caigoudatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Caigoudatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Caigoudatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Caigoudatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Caigoudatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Caigoudatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [Caigoudatabase] SET  MULTI_USER 
GO
ALTER DATABASE [Caigoudatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Caigoudatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Caigoudatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Caigoudatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Caigoudatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Caigoudatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Caigoudatabase', N'ON'
GO
ALTER DATABASE [Caigoudatabase] SET QUERY_STORE = OFF
GO
USE [Caigoudatabase]
GO
/****** Object:  User [test]    Script Date: 2021-11-18 10:55:34 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [10006]    Script Date: 2021-11-18 10:55:34 ******/
CREATE USER [10006] FOR LOGIN [10006] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [10005]    Script Date: 2021-11-18 10:55:34 ******/
CREATE USER [10005] FOR LOGIN [10005] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [10004]    Script Date: 2021-11-18 10:55:34 ******/
CREATE USER [10004] FOR LOGIN [10004] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [10003]    Script Date: 2021-11-18 10:55:34 ******/
CREATE USER [10003] FOR LOGIN [10003] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [10002]    Script Date: 2021-11-18 10:55:34 ******/
CREATE USER [10002] FOR LOGIN [10002] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [10001]    Script Date: 2021-11-18 10:55:34 ******/
CREATE USER [10001] FOR LOGIN [10001] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [DxbWC]    Script Date: 2021-11-18 10:55:34 ******/
CREATE ROLE [DxbWC]
GO
/****** Object:  DatabaseRole [DxbFM]    Script Date: 2021-11-18 10:55:34 ******/
CREATE ROLE [DxbFM]
GO
/****** Object:  DatabaseRole [DxbCEO]    Script Date: 2021-11-18 10:55:34 ******/
CREATE ROLE [DxbCEO]
GO
/****** Object:  DatabaseRole [DxbBM]    Script Date: 2021-11-18 10:55:34 ******/
CREATE ROLE [DxbBM]
GO
/****** Object:  DatabaseRole [DxbBE]    Script Date: 2021-11-18 10:55:34 ******/
CREATE ROLE [DxbBE]
GO
/****** Object:  DatabaseRole [DxbAM]    Script Date: 2021-11-18 10:55:34 ******/
CREATE ROLE [DxbAM]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [test]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [test]
GO
ALTER ROLE [DxbAM] ADD MEMBER [10006]
GO
ALTER ROLE [DxbWC] ADD MEMBER [10005]
GO
ALTER ROLE [DxbBE] ADD MEMBER [10004]
GO
ALTER ROLE [DxbBM] ADD MEMBER [10003]
GO
ALTER ROLE [DxbFM] ADD MEMBER [10002]
GO
ALTER ROLE [DxbCEO] ADD MEMBER [10001]
GO
/****** Object:  UserDefinedFunction [dbo].[AutoAdd]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AutoAdd] ()
RETURNS varchar(20)
AS
BEGIN
	DECLARE @GoodsId varchar(20) 
	SELECT @GoodsId=RiGHT(10000+ISNULL(RIGHT(MAX([Goods-Id]),5),0)+1,6)
	FROM 货物信息
	RETURN @GoodsId
END
GO
/****** Object:  UserDefinedFunction [dbo].[AutoAddyg]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AutoAddyg] ()
RETURNS varchar(20)
AS
BEGIN
	DECLARE @GoodsId varchar(20) 
	SELECT @GoodsId=RiGHT(10000+ISNULL(RIGHT(MAX([Id]),5),0)+1,6)
	FROM 员工
	RETURN @GoodsId
END
GO
/****** Object:  Table [dbo].[员工]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[员工](
	[Id] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LcId] [varchar](20) NOT NULL,
 CONSTRAINT [PK_员工] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_员工]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_员工]
AS
SELECT  dbo.员工.*, Id AS Expr1, Name AS Expr2, LcId AS Expr3
FROM     dbo.员工
GO
/****** Object:  Table [dbo].[购销合同]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[购销合同](
	[Contract-No] [varchar](20) NOT NULL,
	[Goods-Id] [varchar](20) NOT NULL,
	[Goods-Price] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[Deliver_Date] [varchar](20) NOT NULL,
	[Pay_Date] [varchar](20) NOT NULL,
	[Supplier_Id] [varchar](20) NOT NULL,
	[Id] [varchar](20) NOT NULL,
	[Check] [int] NOT NULL,
 CONSTRAINT [PK_购销合同] PRIMARY KEY CLUSTERED 
(
	[Contract-No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[采购订单]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[采购订单](
	[No] [varchar](20) NOT NULL,
	[Total] [int] NOT NULL,
	[Supplier-Id] [varchar](20) NOT NULL,
	[Goods-Id] [varchar](20) NOT NULL,
	[Count] [int] NOT NULL,
	[Id] [varchar](20) NOT NULL,
 CONSTRAINT [PK_采购订单] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[根据购销合同录入采购订单视图]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[根据购销合同录入采购订单视图]
AS
SELECT  TOP (100) PERCENT dbo.采购订单.Total, dbo.采购订单.[Supplier-Id], dbo.采购订单.[Goods-Id], dbo.采购订单.Count, dbo.采购订单.Id, dbo.采购订单.No, 
               dbo.购销合同.[Goods-Id] AS Expr1, dbo.购销合同.Count AS Expr2, dbo.购销合同.Total AS Expr3, dbo.购销合同.Supplier_Id
FROM     dbo.购销合同 CROSS JOIN
               dbo.采购订单
WHERE   (dbo.购销合同.[Check] = 1)
ORDER BY dbo.采购订单.Count
GO
/****** Object:  Table [dbo].[货物信息]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[货物信息](
	[Goods-Id] [varchar](20) NOT NULL,
	[Goods_Name] [varchar](20) NOT NULL,
	[Size] [int] NULL,
 CONSTRAINT [PK_货物信息] PRIMARY KEY CLUSTERED 
(
	[Goods-Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[采购入库单]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[采购入库单](
	[No] [varchar](20) NOT NULL,
	[Goods-Id] [varchar](20) NOT NULL,
	[Total] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Id] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[使用采购入库单]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[使用采购入库单]
AS
SELECT  TOP (100) PERCENT dbo.货物信息.[Goods-Id] AS Expr1, dbo.货物信息.Goods_Name AS Expr2, dbo.货物信息.Size AS Expr3, dbo.采购入库单.No AS Expr4, 
               dbo.采购入库单.[Goods-Id] AS Expr5, dbo.采购入库单.Id AS Expr8
FROM     dbo.采购入库单 INNER JOIN
               dbo.货物信息 ON dbo.采购入库单.[Goods-Id] = dbo.货物信息.[Goods-Id]
WHERE   (dbo.货物信息.[Goods-Id] IS NOT NULL) AND (dbo.采购入库单.Id IS NOT NULL)
ORDER BY Expr3
GO
/****** Object:  Table [dbo].[供应商信息]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[供应商信息](
	[Supplier_Id] [varchar](20) NOT NULL,
	[Supplier_Name] [varchar](20) NOT NULL,
	[Level] [int] NULL,
 CONSTRAINT [PK_供应商信息] PRIMARY KEY CLUSTERED 
(
	[Supplier_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SpldSl]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SpldSl] 
(	
	@splId as varchar(20)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Supplier_Id,Supplier_Name,Level
	FROM 供应商信息 
	WHERE Supplier_Id =@splId
)
GO
/****** Object:  Table [dbo].[发货单]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[发货单](
	[No] [varchar](20) NOT NULL,
	[Date] [date] NOT NULL,
	[Supplier_Id] [varchar](20) NOT NULL,
	[Goods-Id] [varchar](20) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_发货单] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[岗位]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[岗位](
	[LcId] [varchar](20) NOT NULL,
	[lcd_Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_岗位] PRIMARY KEY CLUSTERED 
(
	[LcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20211117-202819]    Script Date: 2021-11-18 10:55:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20211117-202819] ON [dbo].[采购入库单]
(
	[Goods-Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonC]    Script Date: 2021-11-18 10:55:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonC] ON [dbo].[货物信息]
(
	[Goods-Id] ASC
)
INCLUDE([Goods_Name],[Size]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20211116-235102]    Script Date: 2021-11-18 10:55:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20211116-235102] ON [dbo].[员工]
(
	[Id] ASC,
	[Name] ASC,
	[LcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[供应商信息] ADD  CONSTRAINT [DF_供应商信息_Level]  DEFAULT ((1)) FOR [Level]
GO
ALTER TABLE [dbo].[货物信息] ADD  DEFAULT ([dbo].[AutoAdd]()) FOR [Goods-Id]
GO
ALTER TABLE [dbo].[员工] ADD  DEFAULT ([dbo].[AutoAddyg]()) FOR [Id]
GO
ALTER TABLE [dbo].[采购订单]  WITH CHECK ADD  CONSTRAINT [FK_采购订单_供应商信息] FOREIGN KEY([Supplier-Id])
REFERENCES [dbo].[供应商信息] ([Supplier_Id])
GO
ALTER TABLE [dbo].[采购订单] CHECK CONSTRAINT [FK_采购订单_供应商信息]
GO
ALTER TABLE [dbo].[采购订单]  WITH CHECK ADD  CONSTRAINT [FK_采购订单_货物信息] FOREIGN KEY([Goods-Id])
REFERENCES [dbo].[货物信息] ([Goods-Id])
GO
ALTER TABLE [dbo].[采购订单] CHECK CONSTRAINT [FK_采购订单_货物信息]
GO
ALTER TABLE [dbo].[采购订单]  WITH CHECK ADD  CONSTRAINT [FK_采购订单_员工] FOREIGN KEY([Id])
REFERENCES [dbo].[员工] ([Id])
GO
ALTER TABLE [dbo].[采购订单] CHECK CONSTRAINT [FK_采购订单_员工]
GO
ALTER TABLE [dbo].[采购入库单]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_货物信息] FOREIGN KEY([No])
REFERENCES [dbo].[货物信息] ([Goods-Id])
GO
ALTER TABLE [dbo].[采购入库单] CHECK CONSTRAINT [FK_Table_1_货物信息]
GO
ALTER TABLE [dbo].[采购入库单]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_员工] FOREIGN KEY([No])
REFERENCES [dbo].[员工] ([Id])
GO
ALTER TABLE [dbo].[采购入库单] CHECK CONSTRAINT [FK_Table_1_员工]
GO
ALTER TABLE [dbo].[发货单]  WITH CHECK ADD  CONSTRAINT [FK_发货单_供应商信息] FOREIGN KEY([Supplier_Id])
REFERENCES [dbo].[供应商信息] ([Supplier_Id])
GO
ALTER TABLE [dbo].[发货单] CHECK CONSTRAINT [FK_发货单_供应商信息]
GO
ALTER TABLE [dbo].[发货单]  WITH CHECK ADD  CONSTRAINT [FK_发货单_货物信息] FOREIGN KEY([Goods-Id])
REFERENCES [dbo].[货物信息] ([Goods-Id])
GO
ALTER TABLE [dbo].[发货单] CHECK CONSTRAINT [FK_发货单_货物信息]
GO
ALTER TABLE [dbo].[购销合同]  WITH CHECK ADD  CONSTRAINT [FK_购销合同_供应商信息] FOREIGN KEY([Supplier_Id])
REFERENCES [dbo].[供应商信息] ([Supplier_Id])
GO
ALTER TABLE [dbo].[购销合同] CHECK CONSTRAINT [FK_购销合同_供应商信息]
GO
ALTER TABLE [dbo].[购销合同]  WITH CHECK ADD  CONSTRAINT [FK_购销合同_货物信息] FOREIGN KEY([Goods-Id])
REFERENCES [dbo].[货物信息] ([Goods-Id])
GO
ALTER TABLE [dbo].[购销合同] CHECK CONSTRAINT [FK_购销合同_货物信息]
GO
ALTER TABLE [dbo].[购销合同]  WITH CHECK ADD  CONSTRAINT [FK_购销合同_员工] FOREIGN KEY([Contract-No])
REFERENCES [dbo].[员工] ([Id])
GO
ALTER TABLE [dbo].[购销合同] CHECK CONSTRAINT [FK_购销合同_员工]
GO
ALTER TABLE [dbo].[员工]  WITH CHECK ADD  CONSTRAINT [FK_员工_岗位] FOREIGN KEY([LcId])
REFERENCES [dbo].[岗位] ([LcId])
GO
ALTER TABLE [dbo].[员工] CHECK CONSTRAINT [FK_员工_岗位]
GO
ALTER TABLE [dbo].[采购订单]  WITH CHECK ADD  CONSTRAINT [CK_采购订单] CHECK  (([Total]>(0) AND [Count]>(0)))
GO
ALTER TABLE [dbo].[采购订单] CHECK CONSTRAINT [CK_采购订单]
GO
ALTER TABLE [dbo].[发货单]  WITH CHECK ADD  CONSTRAINT [CK_发货单] CHECK  (([Count]>(0)))
GO
ALTER TABLE [dbo].[发货单] CHECK CONSTRAINT [CK_发货单]
GO
ALTER TABLE [dbo].[购销合同]  WITH CHECK ADD  CONSTRAINT [CK_购销合同] CHECK  (([Goods-Price]>(0) AND [Count]>=(0) AND [Total]>(0)))
GO
ALTER TABLE [dbo].[购销合同] CHECK CONSTRAINT [CK_购销合同]
GO
ALTER TABLE [dbo].[货物信息]  WITH CHECK ADD  CONSTRAINT [CK_货物信息] CHECK  (([Size]>(0)))
GO
ALTER TABLE [dbo].[货物信息] CHECK CONSTRAINT [CK_货物信息]
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 2021-11-18 10:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[test]
	@test1 varchar(20)
AS
BEGIN
	SELECT TOP (1000) [No]
      ,[Date]
      ,[Supplier_Id]
      ,[Goods-Id]
      ,[Count]
  FROM [Caigoudatabase].[dbo].[发货单]
  WHERE Date between '2021-08-29' and '2021-11-29 23:59:59'
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "员工"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 175
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_员工'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_员工'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[25] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "购销合同"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 358
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "采购订单"
            Begin Extent = 
               Top = 9
               Left = 327
               Bottom = 333
               Right = 528
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'根据购销合同录入采购订单视图'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'根据购销合同录入采购订单视图'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "采购入库单"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 201
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "货物信息"
            Begin Extent = 
               Top = 9
               Left = 298
               Bottom = 175
               Right = 517
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'使用采购入库单'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'使用采购入库单'
GO
USE [master]
GO
ALTER DATABASE [Caigoudatabase] SET  READ_WRITE 
GO
