CREATE TABLE [dbo].[TRC_ProductionTraceLotRow] (

	[lTraceLotRowPK] int NULL, 
	[lTraceLotPK] int NULL, 
	[DefID] varchar(8000) NULL, 
	[szMaterialLotID] varchar(8000) NULL, 
	[szTrackingCode] varchar(8000) NULL, 
	[dQuantityBase] decimal(15,5) NULL, 
	[szType] varchar(8000) NULL, 
	[dtHistoryDate] datetime2(6) NULL, 
	[CreatedOn] datetime2(6) NULL, 
	[CreatedBy] varchar(8000) NULL, 
	[RowUpdated] datetime2(6) NULL, 
	[RowUpdatedBy] varchar(8000) NULL, 
	[szBaseUomID] varchar(8000) NULL, 
	[szSerialNumber] varchar(8000) NULL, 
	[szBinID] varchar(8000) NULL, 
	[szBomDefID] varchar(8000) NULL
);