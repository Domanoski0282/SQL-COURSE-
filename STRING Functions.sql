#STRING Functions

SELECT* 
FROM customers
;

SELECT LENGTH('sky');


SELECT first_name, LENGTH(first_name) AS Len_first
FROM customers
ORDER BY Len_first
;
#LENGTH Function for order bys for data cleaning


SELECT first_name, UPPER(first_name), LOWER(first_name)
FROM customers;
#uppercase function for data cleaning  
#LOWER case function for data cleaning (helps standardize)

SELECT *
FROM customers;
#trim function to remove white space 

SELECT '   sky  ' ,TRIM('   sky   '), LTRIM('   sky   '), RTRIM('   sky   ');


SELECT'I      LOVE      SQL', TRIM('I      LOVE      SQL');
#will not trim space in between word spacing 

SELECT LEFT('Alexander',4);
#used to select characters out of a string function 

SELECT first_name, LEFT(first_name,3),  RIGHT(first_name,3)
FROM  customers
;	
#used to clean data and make short forms for strings

SELECT SUBSTRING('Alexander',2,3);
#substring function select starting point and end point. better then left and right function
#use for phone and emails data cleaning


SELECT phone, 
SUBSTRING(phone,1,3),
SUBSTRING(phone,5,3),
SUBSTRING(phone,9,4),
CONCAT( SUBSTRING(phone,1,3),SUBSTRING(phone,5,3),SUBSTRING(phone,9,4))
FROM  customers
;	
#remove dashes for numerical data  no matter what unique data by using CONCAT


SELECT REPLACE (first_name,'a','z')
FROM  customers
;	
#replace function 

SELECT REPLACE(phone,'-','')
FROM  customers
;	
#replace dashes with no space to make the numerical data easier to use when cleaning data 


SELECT LOCATE('x', 'Alexander');

SELECt first_name, LOCATE('Mic',first_name)
FROM customers;
#locate a positiom of specified item,character or num

SELECT REPLACE (first_name,'a','z')
FROM  customers
;	

SELECT CONCAT('Alex', 'Freberg');












