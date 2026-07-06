CREATE TABLE [dbo].[DP_DefCost] (

	[DateExport] datetime2(6) NULL, 
	[Anno] int NULL, 
	[DefId] varchar(8000) NULL, 
	[UomID] varchar(8000) NULL, 
	[UnitCost] float NULL, 
	[dPeso] float NULL, 
	[BudgetCost] float NULL, 
	[szDefName] varchar(8000) NULL, 
	[DefName2] varchar(8000) NULL
);