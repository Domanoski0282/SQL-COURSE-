# INNER JOINS

SELECT *
FROM customers
INNER JOIN 
;

SELECT *
FROM customer_orders
ORDER BY customer_id
;

SELECT *
FROM customers c
INNER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id
;


SELECT *
FROM products;

SELECT *
FROM customer_orders;


SELECT p.product_name, SUM(order_total) AS Total 
FROM products p
JOIN customer_orders co 
	ON p.product_id = co.product_id
GROUP BY product_name
ORDER BY 2
;

#finding the total money spent on specific items by procduct name 

SELECT * 
FROM  suppliers;

SELECT *
FROM ordered_items;

SELECT * 
FROM suppliers s
INNER JOIN ordered_items oi
	ON s.supplier_id  = oi.shipper_id
;
#join two different column names to that are same id number  







