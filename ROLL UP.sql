#ROLL UP 

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id WITH ROLLUP
;
#gives you the total of aggregated column 


SELECT customer_id, COUNT(tip) AS count_tips
FROM customer_orders
GROUP BY customer_id WITH ROLLUP
;







