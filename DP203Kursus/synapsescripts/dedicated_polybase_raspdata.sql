IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat2') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat2] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE,
			 FIRST_ROW =2
			))
GO

DROP EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
DROP EXTERNAL DATA SOURCE [raspberrydata_datalake20220228_dfs_core_windows_net] 

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'raspberrydata_datalake20220228_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [raspberrydata_datalake20220228_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://raspberrydata@datalake20220228.dfs.core.windows.net' 
	)
GO

drop EXTERNAL TABLE raspdata

CREATE EXTERNAL TABLE raspdata (
	[sensorid] bigint,
	[timestamp] datetime2(0),
	[temperature_from_humidity] float,
	[temperature_from_pressure] float,
	[humidity] float,
	[pressure] float
	)
	WITH (
	LOCATION = '/',
	DATA_SOURCE = [raspberrydata_datalake20220228_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat2],
	REJECTED_ROW_LOCATION = '/REJECT_Directory'
	)
GO
--data2022_02_28_11_11_23.csv

drop EXTERNAL TABLE raspdata

--82411
SELECT count(*) FROM raspdata

SELECT TOP 100 * FROM raspdata
GO