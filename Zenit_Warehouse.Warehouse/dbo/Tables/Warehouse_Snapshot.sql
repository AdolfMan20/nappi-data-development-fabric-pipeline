CREATE TABLE [dbo].[Warehouse_Snapshot] (

	[DateExport] datetime2(6) NULL, 
	[WareHouse] varchar(8000) NULL, 
	[LocationID] varchar(8000) NULL, 
	[LocationDescription] varchar(8000) NULL, 
	[MesLotID] varchar(8000) NULL, 
	[CodiceLotto] varchar(8000) NULL, 
	[BinID] varchar(8000) NULL, 
	[DefId] varchar(8000) NULL, 
	[DefName] varchar(8000) NULL, 
	[DefName2] varchar(8000) NULL, 
	[Famiglia] varchar(8000) NULL, 
	[QtyPacking] decimal(18,5) NULL, 
	[UomPacking] varchar(8000) NULL, 
	[QtyBase] decimal(18,5) NULL, 
	[UomBase] varchar(8000) NULL, 
	[fConvert] float NULL, 
	[dPackingWeight] decimal(15,5) NULL, 
	[dWeight] decimal(15,5) NULL
);