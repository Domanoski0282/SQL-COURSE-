#Date and Date Format Functions

SELECT * 
FROM customers
;

SELECT NOW(), 
CURDATE(), 
CURTIME();
#date and time functions, place in last column so it shows when query runs 


SELECT YEAR(NOW()),
MONTH(NOW()),
DAY (NOW()); 


SELECT * 
FROM customers
WHERE YEAR(birth_date) = YEAR(NOW())
;
 #search for mcurrent births in current year 

SELECT * 
FROM customer_orders
WHERE YEAR(order_date) = YEAR(NOW()) -5
;
 #search for orders in the year 2020
 
 SELECT DAYNAME(NOW());
 
 SELECT order_date, DAYNAME(order_date), MONTHNAME(order_date)
FROM customer_orders;
#time series data for order dates

SELECT birth_date, DATE_FORMAT(birth_date,'%M %D %Y')
FROM customers;


SELECT birth_date, DATE_FORMAT(birth_date,'%m %D %Y')
FROM customers;


SELECT birth_date, DATE_FORMAT(birth_date,'%m-%D-%Y')
FROM customers;
#formating 


