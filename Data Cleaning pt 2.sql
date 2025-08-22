#Data Cleaning pt 2
#Working with NULL values 

SELECT * 
FROM customer_sweepstakes_new
;

SELECT COUNT(sweepstake_id), COUNT(phone)
FROM customer_sweepstakes_new
;

# Updating blank values to null values for data cleaning 

UPDATE customer_sweepstakes_new
SET phone = NULL 
WHERE phone = ''
;

UPDATE customer_sweepstakes_new
SET income = NULL 
WHERE income = ''
;

SELECT income
FROM customer_sweepstakes_new
;

SELECT AVG(income)
FROM customer_sweepstakes_new
;


SELECT AVG(income)
FROM customer_sweepstakes_new
WHERE income IS NOT NULL 
;

SELECT AVG(COALESCE(income, 0))
FROM customer_sweepstakes_new
;
#used to drop people who did not report an income to get an accurate representation of the numbers 

SELECT *
FROM customer_sweepstakes_new
;

SELECT *
FROM customers
;

SELECT COUNT(phone)
FROM customers
;

SELECT COUNT(customer_id), COUNT(phone)
FROM customers
;

# Quiz question for null data, use COALESCE to fill in null emails with first and last name and creating user email
SELECT p.first_name, p.last_name, 
  COALESCE(c.email, CONCAT(LOWER(p.first_name), '.', LOWER(p.last_name), '@gmail.com')) AS email
FROM contacts c
JOIN people p
  ON c.id = p.id
ORDER BY email ASC;

#JOIN both tables on id
#Fill all null data with missing email address by using COALESCE()

#Deleting Unsused Columns 

SELECT * 
FROM customer_sweepstakes_new
;

ALTER TABLE customer_sweepstakes_new
DROP COLUMN address
;

ALTER TABLE customer_sweepstakes_new
DROP COLUMN sweepstake_id_dup
;

ALTER TABLE customer_sweepstakes_new
DROP COLUMN customer_id_dup
;
































