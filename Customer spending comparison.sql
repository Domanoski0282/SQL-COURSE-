USE bakery;

SELECT 
    last_name, 
    first_name, 
    birth_date, 
    phone, 
    city, 
    state,
    total_money_spent,
    (total_money_spent + 100) * 10
FROM customers;
#PEMDAS
#customer spending comparison

SELECT * #state
FROM customers;

SELECT DISTINCT city, state 
FROM customers;
#Differntiate city/state

