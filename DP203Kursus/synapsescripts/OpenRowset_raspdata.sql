-- This is auto-generated code
SELECT
    COUNT(*)    AS Antal
    , MAX(humidity) AS MaxLuftFugtighed
FROM
    OPENROWSET(
        BULK 'https://datalake20220228.dfs.core.windows.net/raspberrydata/data*.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        Header_row = true
    ) AS [result]


-- /year/month=*/**

CREATE Database ServerLessDB

-- det er en metadata database
USE ServerlessDB

CREATE SChema EXT

CREATE VIEW EXT.RaspBeryData AS

SELECT
    COUNT(*)    AS Antal
    , MAX(humidity) AS MaxLuftFugtighed
FROM
    OPENROWSET(
        BULK 'https://datalake20220228.dfs.core.windows.net/raspberrydata/data*.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        Header_row = true
    ) AS [result]


CREATE VIEW EXT.RaspBeryData AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://datalake20220228.dfs.core.windows.net/raspberrydata/data*.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        Header_row = true
    ) AS [result]


--CREATE TABLE <table_name> is not supported.
CREATE TABLE dbo.DemoTAble
(
    col1 INT
)
