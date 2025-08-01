# IN Operators


SELECT * 
FROM customers
WHERE state = 'PA' OR state = 'TX' OR state = 'IL'
;
#


SELECT * 
FROM customers
WHERE state IN ('PA', 'TX', 'IL')
;
#included in list or address whats in () Multiple values in one column 

SELECT * 
FROM customers
WHERE first_name NOT IN ('Kevin', 'Kelly', 'Frodo')
;
#NOT IN list 
