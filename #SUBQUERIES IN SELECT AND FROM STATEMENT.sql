#SUBQUERIES IN SELECT AND FROM STATEMENT


#In the SELECT clause: A subquery can be used in the SELECT clause to calculate a value for each row returned by the outer query.

#Example:

#SELECT customer_name, 
       #(SELECT AVG(order_amount) 
        #FROM orders 
        #WHERE orders.customer_id = customers.customer_id) AS avg_order_amount
#FROM customers;
#In the FROM clause: A subquery can be used in the FROM clause to create a temporary table that can be used within the scope of the outer query.

#Example:

#SELECT customer_id, SUM(order_amount) as total_order_amount
#FROM (SELECT customer_id, order_amount 
 #     FROM orders) AS customer_orders
#GROUP BY customer_id;


















