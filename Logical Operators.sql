#Logical Operators

# AND, OR, NOT


SELECT *
FROM customers
WHERE state = 'PA' AND total_money_spent > 1000
;
#AND statments 

SELECT *
FROM customers
WHERE state = 'PA' OR total_money_spent > 1000
;
#OR statments 


SELECT *
FROM customers
WHERE (state = 'PA' OR city = 'New York') AND total_money_spent > 1000
;



SELECT *
FROM customers
WHERE (state = 'PA'OR birth_date > '1998-01-01') AND total_money_spent > 1000
;
#Logical Operators 

SELECT *
FROM customers
WHERE NOT state = 'PA'
;
#NOT Statements

SELECT *
FROM customers
WHERE NOT (total_money_spent > 1000 and state = 'TX')
;












