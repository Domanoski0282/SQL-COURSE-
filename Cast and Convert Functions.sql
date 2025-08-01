#Cast and Convert Functions



SELECT CAST("2022-01-01" AS DATETIME);

SELECT birth_date,
CAST(birth_date AS DATETIME),
CONVERT(birth_date, DATETIME)
FROM customers
;
#conversion of data type 



SELECT first_name,
CAST(first_name AS DECIMAl)
FROM customers
;
#will not convert 
 
 
 
 
 














