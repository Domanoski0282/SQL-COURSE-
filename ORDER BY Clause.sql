#ORDER BY Clause 

SELECT * 
FROM customers
ORDER BY first_name 
;
#order by name 

SELECT * 
FROM customers
ORDER BY first_name DESC
;
#order by name DESC order 

SELECT * 
FROM customers
ORDER BY state DESC, total_money_spent DESC
;
#order desc 

SELECT * 
FROM customers
ORDER BY 8 DESC, 9 ASC
;
#order by column position 






















