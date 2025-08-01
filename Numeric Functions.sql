#Data Types: Strings, Numeric, Date and Time, and Boolean.
#Numeric FUNCTTIONS 

SELECT * 
FROM products

;


SELECT ROUND(123.456789,2) 
;
#round function with example at ,2 (places) 


SELECT sale_price, ROUND (sale_price,1)
FROM products
;
#sale price rounded 

SELECT CEILING(5.7) 
;
#always rounds up 


SELECT FLOOR(5.7) 
;
#always rounds down


SELECT sale_price, CEILING(sale_price)
FROM products;
#select sale price then show ceiling round up

SELECT sale_price, CEILING(sale_price), FLOOR (sale_price)
FROM products;
#shows org, ceiling and floor of slaes price 


SELECT ABS(4.6)
;
#gives you the absolute value in positive form only 







