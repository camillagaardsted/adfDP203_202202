SELECT		@@version

SELECT * FROM sys.external_file_formats

-- permissions til blob

SELECT		*
FROM		sys.credentials

-- best practise 
-- kræver at man laver en master key først
select		*
from		sys.database_scoped_credentials


--SuperUsers8541!!

-- billing info https://www.microsoftazuresponsorships.com/

-- Dedicated pool (en pool er en dw database)

-- Der er to load teknikker - begge to anvender filer
-- 1) Polybase (external table teknik)
-- 2) COPY teknik (direkte til tabel)


-- DWCU -- bestemmer antallet af noder og memory
-- https://docs.microsoft.com/en-us/azure/synapse-analytics/sql-data-warehouse/memory-concurrency-limits

-- RC er resource class

----------------------------------------------------------------------------
-- Azure Data Factory - kendt som ADF
----------------------------------------------------------------------------

-- Første case:

-- Vi vil gerne hente en fil fra ssi: https://files.ssi.dk/covid19/overvagning/data/overvaagningsdata-covid19-01032022-n7tp
-- og kopiere og unzippe den til en container i vores datalake


-- Vi definerer vores kilder først
-- source: web - http - ssi
-- destination: datalake container

-- Linked service
-- endpoint og authentication

-- baseurl:https://files.ssi.dk/covid19/overvagning/data/
-- filnavn: overvaagningsdata-covid19-01032022-n7tp

-- Til ETL / transformationer / dataflow: To muligheder i ADF:
--1) Dataflow (en aktivitet)
-- 2) Wrangling dataflow - nu omdøbt til Power Query (en selvstændig aktivitet) - findes IKKE Synapse
	--	 det er Power Query Online (dvs det værktøj vi har i Excel og Power BI, men her er det en online speciel udgave)


-- Ny pipeline: Transformer vores raspberry pi csv fil med data
-- via Power Query 
-- Transformationer foregår som steps -  det er i sproget M

let
  Source = raspberry_csv_files,
  #"Filtered rows" = Table.SelectRows(Source, each ([temperature_from_pressure] <> "0")),
  #"Changed column type" = Table.TransformColumnTypes(#"Filtered rows", {{"sensorid", Int64.Type}, {"timestamp", type datetime}, {"temperature_from_humidity", type number}, {"temperature_from_pressure", type number}, {"humidity", type number}, {"pressure", type number}})
in
  #"Changed column type"

