#SUBQUERIES 
#A Subquery is essentially a query within a query.

#example 
#SELECT customer_name, customer_id
#FROM customers
#WHERE customer_id 
#IN (SELECT customer_id 
 #      FROM orders 
  #     WHERE order_amount > 1000);

SELECT *
FROM customers
WHERE customer_id IN 
(SELECT customer_id
FROM customer_orders
WHERE tip > 1)
;

#can only fitler on one column can be used instead of a JOIN function. 
#JOINS used more often but a subquery can be used when the data is samller or easier to read.

SELECT *
FROM customers
WHERE total_money_spent > (SELECT AVG(total_money_spent)
							FROM customers)
;
#similar way to right a sub query for average of total money spent 
















