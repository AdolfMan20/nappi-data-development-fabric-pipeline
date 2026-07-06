CREATE TABLE [dbo].[metadata_config] (

	[source_schema] varchar(50) NULL, 
	[source_table] varchar(150) NULL, 
	[destination_table] varchar(150) NULL, 
	[load_type] varchar(20) NULL, 
	[last_exec_date] datetime2(3) NULL, 
	[incremental_column] varchar(100) NULL, 
	[is_active] bit NULL
);