-- Oprettelse af dedikeret bruger til load af data


CREATE LOGIN LoaderRC20 WITH PASSWORD = 'Pa55w.rd';
CREATE USER LoaderRC20 FOR LOGIN LoaderRC20;


--USE statement is not supported to switch between databases. Use a new connection to connect to a different database.
--USE sqlPool01;


-- på sqlpool01
CREATE USER LoaderRC20 FOR LOGIN LoaderRC20;

--ALTER ROLE staticrc20
--ADD MEMBER LoaderRC20

EXEC sp_addrolemember 'staticrc20','LoaderRC20'


GRANT CONTROL ON DATABASE::SQLPOOL01 to LoaderRC20;

-- CREATE DATABASE SuperUsersDW ULOVlig syntaks

