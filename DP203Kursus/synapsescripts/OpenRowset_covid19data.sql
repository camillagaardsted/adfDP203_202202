-- This is auto-generated code

-- se https://docs.microsoft.com/en-us/azure/synapse-analytics/sql/develop-openrowset

SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://synapsedl20220301.dfs.core.windows.net/covid19/Test_pos_over_time.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS Result


SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://synapsedl20220301.dfs.core.windows.net/covid19/Test_pos_over_time.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = ';'
    )    
    AS Result


SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://synapsedl20220301.dfs.core.windows.net/covid19/Test_pos_over_time_minus_last2.txt',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE,
        FIELDTERMINATOR = ';'
    )
    WITH 
    (
        Dato DATE 1,
        NewPositive INT 2
    )
    AS Result







    )
     AS [result]
