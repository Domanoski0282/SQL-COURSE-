 # GROUP BY 
 
 SELECT customer_id, SUM(tip)
 FROM customer_orders
 GROUP BY customer_id
 ;
 #sum of tips by customer id 
 
  SELECT product_id, AVG(order_total)
 FROM customer_orders
 GROUP BY product_id
 ORDER BY AVG(order_total) DESC
 ;
 
 # AVG of total spent by product id  ordered by the average total  in descending order 
 
 SELECT product_id, SUM(order_total)
FROM customer_orders
GROUP BY product_id
ORDER BY SUM(order_total) DESC
;

#SUM of order totals by product_id ordered by the order totals in DESC order 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 