CREATE TABLE [dbo].[DP_DistintePrice] (

	[DateExport] datetime2(6) NULL, 
	[lDistintePricePK] int NULL, 
	[szBomID] varchar(8000) NULL, 
	[DefID] varchar(8000) NULL, 
	[dBomReferenceQty] float NULL, 
	[UomID] varchar(8000) NULL, 
	[szBomStatusID] varchar(8000) NULL, 
	[RowStatus] int NULL, 
	[BomCost] float NULL, 
	[UnitCost] float NULL, 
	[DefName] varchar(8000) NULL, 
	[Classe] varchar(8000) NULL, 
	[DefName2] varchar(8000) NULL, 
	[dPeso] float NULL, 
	[bBloccatoODV] bit NULL, 
	[BudgetCost] float NULL, 
	[BomBudgetCost] float NULL, 
	[RowStatusBudget] int NULL
);