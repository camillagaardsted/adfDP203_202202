CREATE EXTERNAL TABLE RaspAggDataAllDays
WITH (
    LOCATION = 'raspdataaggalldays/',
    DATA_SOURCE = raspberrydata_datalake20220228_dfs_core_windows_net,  
    FILE_FORMAT = SynapseDelimitedTextFormat
)  
AS
SELECT     CAST(timestamp AS DATE)      AS Dato
            , MAX(pressure)             AS MaxPressure
            , MIN(pressure)             AS MinPressure
            , MAX(temperature_from_humidity)    AS MaxTemp
            , MAX(temperature_from_humidity)    AS MinTemp
            , MAX(humidity)                     AS MaxHumidity
            , MIN (humidity)                    AS MinHumidity
FROM        ext.raspdataexternaltableAll
GROUP BY    CAST(timestamp AS DATE)

