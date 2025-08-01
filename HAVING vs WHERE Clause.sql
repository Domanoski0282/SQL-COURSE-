#HAVING vs WHERE Clause

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
;
#customer id by total tips 

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
WHERE total_tips > 5
GROUP BY customer_id
;
#bug

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
HAVING total_tips > 5
;
#corrected version remeber execution order


SELECT customer_id, SUM(order_total) AS total
FROM customer_orders
GROUP BY customer_id
HAVING SUM(order_total) > 40
ORDER BY 2
;



















