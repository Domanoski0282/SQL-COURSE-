#LAG AND LEAD FUNCTION 
#LAG() and LEAD() are window functions in SQL that provide a way to access data from a different row in the same result set without #using a self-join. They are often used in data analysis to compare the current row with the previous or next row.

#LAG() function fetches the value from a row that is a certain number of rows before the current row within the same result set. #It's useful when you want to compare a value in a row with a value in a preceding row.

#LEAD() function fetches the value from a row that is a certain number of rows after the current row within the same result set.


SELECT *,
LAG(salary) OVER(),
LEAD(salary) OVER()
FROM employees
;

SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY employee_id)
FROM employees
;
#compares slaray by department 


SELECT *,lag_col - salary AS pay_gap
FROM
(SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col
FROM employees) AS lag_table

;
#shows the pay gap between employees using the lag function 

SELECT *,lead_col - salary AS pay_gap
FROM
(SELECT *,
LEAD(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lead_col
FROM employees) AS lead_table

;
#shows the same as above just using hte lead function instead 

SELECT *, IF(salary > lead_col, 'more' ,'less')
FROM
(SELECT *,
LEAD(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lead_col
FROM employees) AS lead_table
;
#pay comparison using Lead function and IF statment to generate a string output


















