#Case Statements

SELECT order_total,
tip,
IF (tip > 2, order_total * .75, order_total * 1.1) AS new_total,
IF (tip > 2, order_total * .75, order_total * 1.1) AS new_total
FROM customer_orders
;

SELECT units_in_stock,
CASE
	WHEN units_in_stock < 20 THEN 'ORDER NOW'
	WHEN units_in_stock BETWEEN 21 AND 50 THEN 'CHECK IN 3 DAY'
	WHEN units_in_stock > 51 THEN 'IN STOCK'
END AS "order status"
FROM products
;
#case statements to use instead of if functions for stock status 

SELECT units_in_stock,
CASE
	WHEN units_in_stock < 20 THEN 'ORDER NOW'
	WHEN units_in_stock BETWEEN 21 AND 50 THEN 'CHECK IN 3 DAY'
	ELSE 'IN STOCK'
END AS "order status"
FROM products
;
#case statements to use instead of if functions for stock status w/ elese statement

SELECT order_id,
order_date,
CASE
	WHEN YEAR (order_date) = YEAR(NOW()) - 1 THEN 'ACTIVE'
    WHEN YEAR (order_date) = YEAR (NOW()) - 2 THEN 'LAST YEAR'
    ELSE 'ARCHIVED'
    END AS'YEAR'
FROM customer_orders
;
#case statement rather then if function for archived old date that is no longer active













