	

CREATE SCHEMA ext;	
	
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE,
			 FIRST_ROW = 2
			))


GO


	CREATE EXTERNAL DATA SOURCE [raspberrydata_datalake20220228_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://raspberrydata@datalake20220228.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

DROP EXTERNAL TABLE ext.RaspData_viapolybase

CREATE EXTERNAL TABLE ext.RaspData_viapolybase (
	[sensorid] bigint,
	--[timestamp] datetime2(0),
	[timestamp] VARCHAR(50),
	[temperature_from_humidity] float,
	[temperature_from_pressure] float,
	[humidity] float,
	[pressure] float
	)
	WITH (
	--LOCATION = '/data2022_02_28_11_11_23.csv',
	LOCATION = '/',
	DATA_SOURCE = [raspberrydata_datalake20220228_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat],
	REJECTED_ROW_LOCATION = '/afviste_raekker'
	)
GO


SELECT Count(*) FROM ext.RaspData_viapolybase
GO

SELECT 		
[sensorid],	
	CAST([timestamp] AS DATETIME2) AS TimeStamp,
	[temperature_from_humidity],
	[temperature_from_pressure],
	[humidity],
	[pressure]
INTO dbo.RaspDataFromPolyBase
FROM ext.RaspData_viapolybase	
	

SELECT COUNT(*)
FROM 		dbo.raspdatafrompolybase

