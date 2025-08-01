#LIMIT Clause

SELECT * 
FROM customers
#WHERE total_money_spent > 10000
ORDER BY total_money_spent DESC
LIMIT 5
;
#order by with a limit of 5 rows

SELECT * 
FROM customers
#WHERE total_money_spent > 10000
ORDER BY total_money_spent DESC
LIMIT 2, 5
;














