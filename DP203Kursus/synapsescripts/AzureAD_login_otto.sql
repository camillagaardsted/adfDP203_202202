


-- nu laver vi et login til Otto
CREATE LOGIN [otto@su20220228outlook.onmicrosoft.com] FROM EXTERNAL PROVIDER

CREATE USER [otto@su20220228outlook.onmicrosoft.com] FOR LOGIN [otto@su20220228outlook.onmicrosoft.com]

ALTER ROLE db_datareader 
ADD Member [otto@su20220228outlook.onmicrosoft.com]



