IF NOT EXISTS (SELECT * FROM sys.objects O JOIN sys.schemas S ON O.schema_id = S.schema_id WHERE O.NAME = 'dbo' AND O.TYPE = 'U' AND S.NAME = 'dbo')
CREATE TABLE dbo.raspdata
	(
	 [sensorid] bigint,
	 [timestamp] datetime2(0),
	 [temperature_from_humidity] float,
	 [temperature_from_pressure] float,
	 [humidity] float,
	 [pressure] float
	)
WITH
	(
	DISTRIBUTION = ROUND_ROBIN,
	 CLUSTERED COLUMNSTORE INDEX
	 -- HEAP
	)
GO

--Uncomment the 4 lines below to create a stored procedure for data pipeline orchestration​
--CREATE PROC bulk_load_dbo
--AS
--BEGIN
COPY INTO dbo.raspdata
(sensorid 1, timestamp 2, temperature_from_humidity 3, temperature_from_pressure 4, humidity 5, pressure 6)
FROM 'https://datalake20220228.dfs.core.windows.net/raspberrydata/data*.csv'
WITH
(
	FILE_TYPE = 'CSV'
	,MAXERRORS = 0
	,FIRSTROW = 2
	,ERRORFILE = 'https://datalake20220228.dfs.core.windows.net/raspberrydata/'
)
--END
GO

SELECT TOP 100 * FROM dbo.raspdata
GO


SELECT count(*) FROM dbo.raspdata

drop table dbo.raspdata




