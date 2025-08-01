#AGGREGATE FUNCTION 

SELECT customer_id, AVG(tip) AS average_tips
 FROM customer_orders
 GROUP BY customer_id
ORDER BY average_tips
 ;
#avg tips 


SELECT customer_id, MAX(tip) AS MAX_tips
 FROM customer_orders
 GROUP BY customer_id
ORDER BY MAX_tips 
 ;
#biggest tips 

SELECT customer_id, MIN(tip) AS smallest_tips
 FROM customer_orders
 GROUP BY customer_id
ORDER BY smallest_tips ASC
 ;
#smallest tips 


SELECT customer_id, COUNT(tip) AS count_of_tips
 FROM customer_orders
 GROUP BY customer_id
ORDER BY  count_of_tips
 ;
#count of how many times the customer tipped

SELECT first_name, last_name, COUNT(phone)
 FROM customers
 GROUP BY first_name, last_name
 ;

#count of phone number associated with person however the 0 value is becasue of null values not because of 0 input

SELECT product_id, tip, COUNT(tip), COUNT(DISTINCT tip)
FROM customer_orders
GROUP BY product_id, tip
ORDER BY product_id;

#count of disticnt tips by product id 










