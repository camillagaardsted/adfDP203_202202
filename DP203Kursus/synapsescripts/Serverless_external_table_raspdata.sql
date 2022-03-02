DROP EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat]

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',			 
			 USE_TYPE_DEFAULT = FALSE,
			 First_Row = 2
			))
GO


SELECT * FROM sys.external_file_formats

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'raspberrydata_datalake20220228_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [raspberrydata_datalake20220228_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://raspberrydata@datalake20220228.dfs.core.windows.net' 
	)
GO

DrOP EXTERNAL TABLE ext.RaspDataExternalTable
DrOP EXTERNAL TABLE RaspDataExternalTable



CREATE EXTERNAL TABLE ext.RaspDataExternalTableAll (
	[sensorid] bigint,
	[timestamp] datetime2(0),
	[temperature_from_humidity] float,
	[temperature_from_pressure] float,
	[humidity] float,
	[pressure] float
	)
	WITH (
	LOCATION = '*.csv',
	DATA_SOURCE = [raspberrydata_datalake20220228_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM ext.RaspDataExternalTable
GO