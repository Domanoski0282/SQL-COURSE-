#Data Cleaning 
#Data cleaning, also known as data cleansing or data scrubbing, is the process of identifying and correcting (or removing) errors in a dataset. This could include dealing with missing values, incorrect values, inconsistent formats, and #duplicate data. As a data analyst, data cleaning is a crucial step before any analysis or modeling can be done.

#Removing Duplicates 
#The DISTINCT keyword can be used in a SELECT statement to remove duplicate rows from the result set. If you want to permanently remove duplicates from a table, you might need to create a new table with the duplicates removed, and then replace the original table with the new one.


SELECT * 
FROM bakery.customer_sweepstakes;

ALTER TABLE bakery.customer_sweepstakes  RENAME COLUMN `ï»¿sweepstake_id` TO `sweepstake_id`;
#rename column 




SELECT customer_id,COUNT(customer_id)
FROM bakery.customer_sweepstakes
GROUP BY customer_id
HAVING COUNT(customer_id) > 1
;
#Removing Duplicate
#using having and count 

SELECT *
FROM (SELECT customer_id,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id DESC) AS row_num
FROM bakery.customer_sweepstakes) AS table_row
WHERE row_num > 1
;



DELETE FROM customer_sweepstakes
WHERE sweepstake_id IN (
	
    SELECT sweepstake_id
	FROM (
        SELECT sweepstake_id,
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) AS row_num
		FROM bakery.customer_sweepstakes) AS table_row
		WHERE row_num > 1
        );
#DELETE statment to remove duplicate data using row number in a subquery








#Standardizing the Data
#MySQL provides a variety of string functions that you can use to standardize the format of your data. For example, you can use the LOWER() or UPPER() functions to convert text to lower or upper case, the TRIM() function to remove leading 
#and trailing whitespace, and the DATE_FORMAT() function to standardize the format of date values.


 SELECT phone, REGEXP_REPLACE(phone, '[[\]\\[!@#$%^&*`~_{}:;<>/\\|()-]+]', '')
 FROM customer_sweepstakes
 ;
#  REGEXP_REPLACE(phone, '[[\]\\[!@#$%^&*`~_{}:;<>/\\|()-]+]', '') removes all special characters from column data 

UPDATE customer_sweepstakes
SET phone = REGEXP_REPLACE(phone, '[[\]\\[!@#$%^&*`~_{}:;<>/\\|()-]+]', '')
;
#updates and set the new data that we cleaned into the data set 


SELECT phone, CONCAT(SUBSTRING(phone, 1, 3),'-', SUBSTRING(phone, 4, 3),'-', SUBSTRING(phone, 7, 3))
FROM customer_sweepstakes
WHERE phone <> ''
;
#to remove null value fields 
# WHERE clause to remove blank fields in column

UPDATE customer_sweepstakes
SET phone = CONCAT(SUBSTRING(phone, 1, 3),'-', SUBSTRING(phone, 4, 3),'-', SUBSTRING(phone, 7, 3))
WHERE phone <> ''
;
#updates that colmun to the new standardized phone number format 111-111-111

SELECT *
FROM customer_sweepstakes
;


SELECT birth_date, 
STR_TO_DATE(birth_date,'%m/%d/%Y'), 
STR_TO_DATE(birth_date,'%Y/%d/%m')
FROM customer_sweepstakes
;
# need to convert the data type from text to date using'string to date'  STR_TO_DATE(birth_date,'%m/%d/%Y')


SELECT birth_date, 
IF (STR_TO_DATE(birth_date,'%m/%d/%Y') IS NOT NULL, STR_TO_DATE(birth_date,'%m/%d/%Y'),
STR_TO_DATE(birth_date,'%Y/%d/%m')),
	STR_TO_DATE(birth_date,'%m/%d/%Y'), 
	STR_TO_DATE(birth_date,'%Y/%d/%m')
FROM customer_sweepstakes
;
#CONVERTS text data type to a date datat type using IF statments 


UPDATE customer_sweepstakes
SET birth_date = IF (STR_TO_DATE(birth_date,'%m/%d/%Y') IS NOT NULL, STR_TO_DATE(birth_date,'%m/%d/%Y'),
STR_TO_DATE(birth_date,'%Y/%d/%m'))
;
#Produces an error IF functions dont usually work with update statements 

UPDATE customer_sweepstakes
SET birth_date = CASE 
WHEN STR_TO_DATE(birth_date,'%m/%d/%Y') IS NOT NULL THEN STR_TO_DATE(birth_date,'%m/%d/%Y')
WHEN STR_TO_DATE(birth_date,'%m/%d/%Y') IS NULl THEN STR_TO_DATE(birth_date,'%Y/%d/%m')
END
;
#REAL ONE 
#Produces the same error

 SELECT birth_date
 FROM customer_sweepstakes
 ;

SELECT birth_date, CONCAT( SUBSTRING(birth_date, 9,2),'/',SUBSTRING(birth_date, 6,2),'/',SUBSTRING(birth_date, 1,4))
 FROM customer_sweepstakes
 ;

UPDATE customer_sweepstakes
SET birth_date = CONCAT(SUBSTRING(birth_date, 9,2),'/',SUBSTRING(birth_date, 6,2),'/',SUBSTRING(birth_date, 1,4))
WHERE sweepstake_id IN (9,11)
;


UPDATE customer_sweepstakes
SET birth_date = STR_TO_DATE(birth_date, '%m/%d/%Y')
;

SELECT * 
FROM customer_sweepstakes
;



SELECT `Are you over 18?`
FROM customer_sweepstakes
;

SELECT `Are you over 18?`,
CASE 
	WHEN `Are you over 18?` = 'YES' THEN 'Y'
	WHEN`Are you over 18?` = 'No' THEN 'N'
    ELSE `Are you over 18?`
END
FROM customer_sweepstakes
;
#Change column YES/NO to Y/N by using CASE WHEN IF statements


UPDATE customer_sweepstakes
SET `Are you over 18?` = CASE 
	WHEN `Are you over 18?` = 'YES' THEN 'Y'
	WHEN`Are you over 18?` = 'No' THEN 'N'
    ELSE `Are you over 18?`
END
;

SELECT * 
FROM customer_sweepstakes
;










#Breaking Columns Into Multiple Columns
#Sometimes, you might need to split a column into multiple columns (for example, splitting a full name into first name and last name), or merge multiple columns into one. 
#MySQL provides string functions like SUBSTRING_INDEX() and CONCAT() to help with this.

SELECT address
FROM customer_sweepstakes
;

SELECT address, SUBSTRING_INDEX(address, ',', 1) AS street
FROM customer_sweepstakes
;
#Pulls the street by using SUBSTRING_INDEX(address, ',', 1)

SELECT address, 
	SUBSTRING_INDEX(address, ',', 1) AS street,
		SUBSTRING_INDEX(address, ',', -1) AS state
FROM customer_sweepstakes
;
#Pulls the state by using SUBSTRING_INDEX(address, ',', -1), can be pulled from the ot  her side. 


SELECT address, SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',',-1)
FROM customer_sweepstakes
;
#pulls the city into and idvidual column  by using SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',',-1)


SELECT address, 
	SUBSTRING_INDEX(address, ',', 1) AS Street,
		SUBSTRING_INDEX(address, ',', -1) AS State,
			SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',',-1) AS City
FROM customer_sweepstakes
;
#FINAL pull of data to show indiviodualk columns  

SELECT *  
FROM customer_sweepstakes
;

ALTER TABLE customer_sweepstakes
ADD COLUMN street VARCHAR(50) AFTER address
;
#Generates the column but still need to put the data into it 



ALTER TABLE customer_sweepstakes
ADD COLUMN city VARCHAR(50) AFTER street,
ADD COLUMN state VARCHAR(50) AFTER city
;
#Generates the column but still need to put the data into it 


SELECT address, 
	SUBSTRING_INDEX(address, ',', 1) AS Street,
		SUBSTRING_INDEX(address, ',', -1) AS State,
			SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',',-1) AS City
FROM customer_sweepstakes
;

UPDATE customer_sweepstakes
SET street = SUBSTRING_INDEX(address, ',', 1)
;

UPDATE customer_sweepstakes
SET state = SUBSTRING_INDEX(address, ',', -1)
;

UPDATE customer_sweepstakes
SET city = SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',',-1)
;
#3 seperate update statements to place data in to the matching column 



SELECT state, UPPER(state)
FROM customer_sweepstakes
;

UPDATE customer_sweepstakes
SET state =  UPPER(state)
;
#standardized the state to all be UPPER(state)

SELECT *  
FROM customer_sweepstakes
;

SELECT city,TRIM(CITY)
FROM customer_sweepstakes
;

UPDATE customer_sweepstakes
SET state = TRIM(state)
;

UPDATE customer_sweepstakes
SET city = TRIM(city)
;
#TRIM the space in the column of city and state by using SET state = TRIM(CITY), SET state = TRIM(state)



