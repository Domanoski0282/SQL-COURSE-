#Aliasing 

SELECT product_name AS 'Goodie Name' , units_in_stock 'uis'
FROM products
;
#name changing 



SELECT units_in_stock * sale_price AS 'Potiential Revenue'
FROM products
;
# Alias used to change name for equation


SELECT prod.units_in_stock * prod.sale_price AS 'Potential Revenue'
FROM products prod

;













