#ANY AND ALL FUNCTIONS
#ANY Operator:
#The ANY operator returns true if the comparison is true for any value in the set of values returned by the subquery.
#For example: 
#SELECT product_name 
#FROM products 
#WHERE product_price > ANY (SELECT product_price FROM products WHERE supplier_id = 10);


Select * 
FROM ordered_items
;

Select MAX(quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE shipper_id = 1
;
#max total order price from customer id 1

Select shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ALL (SELECT MAX(quantity * unit_price) AS total_order_price
				FROM ordered_items
				WHERE shipper_id = 1)
;
#pulls orders that are greater then shipper id's 1 max order total 

Select shipper_id, order_id, quantity, unit_price, (quantity * unit_price) AS total_order_price
FROM ordered_items
WHERE (quantity * unit_price) > ANY (SELECT (quantity * unit_price) AS total_order_price
				FROM ordered_items
				WHERE shipper_id = 1)
;
#same output as above instead uses an ALL statement to say  the subquery needs to meet a greater total then all the outputs of total_order_price


#SELECT customer_id, number_of_orders
#FROM orders
#WHERE number_of_orders = (SELECT MAX (number_of_orders) 
#FROM orders)
#;
#ID customers who had the largest number of orders
#return the customer id and number of orders
#show all that match even those with multiple customers 









#The ALL operator returns true only if the comparison is true for all values in the set of values returned by the subquery.
#For example:
#SELECT product_name 
#FROM products 
#WHERE product_price > ALL (SELECT product_price FROM products WHERE supplier_id = 10);

#Exists function 
#evaluates if a true statement exists in the query as soon as it hits a true value it ends 

SELECT *
FROM customers c
WHERE EXISTS
	(SELECT customer_id
	FROM customer_orders
    WHERE customer_id = c.customer_id)
;













