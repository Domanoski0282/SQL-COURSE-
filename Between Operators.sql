#Between Operators 

SELECT *
From customers
WHERE total_money_spent BETWEEN 500 AND 1000
;

#inclusive range (simpliar syntax) 


SELECT *
From customers
WHERE total_money_spent >= 534 AND total_money_spent <= 1009
;
#Comparison operators example 


SELECT *
From customers
WHERE birth_date BETWEEN '1990-01-01' AND '2020-01-01' 
;
#with in proper order LOW to HIGH

SELECT *
From customers
WHERE city BETWEEN 'Austin' AND 'Scranton' 
;
 #can use for letters as well alphabetically low to high




