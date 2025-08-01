#LIKE Operators 

# % - zero, one, or multiple characters
#_ single - character



SELECT * 
FROM customers
WHERE first_name LIKE 'K%'
;
#wild card 


SELECT * 
FROM customers
WHERE first_name LIKE '%N%'
;
#N anywhere in the name 


SELECT * 
FROM customers
WHERE first_name LIKE '___kin'
;


SELECT * 
FROM customers
WHERE last_name LIKE 's____%'
;
#_ is exact % is zero to all 

SELECT * 
FROM customers
WHERE phone LIKE '975%'
;












