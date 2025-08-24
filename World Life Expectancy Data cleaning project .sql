#World Life Expectancy Project ( Data Cleaning Phase) 

SELECT * 
FROM worldlifexpectancy
;


SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year))
FROM worldlifexpectancy
GROUP BY Country, Year,CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1
;
 #FILTER DUPS 
 
 SELECT *
 FROM(
	SELECT Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER( PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
	FROM worldlifexpectancy
    )
    AS Row_Table
    WHERE Row_Num > 1
 ;
 #Filters duplicates from table using partition by and row number
 
 DELETE FROM worldlifexpectancy
WHERE 
	Row_ID IN (
	SELECT Row_id
FROM(
	SELECT Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER( PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS Row_Num
	FROM worldlifexpectancy
    ) AS Row_Table
WHERE Row_Num > 1
)
;
#delete duplicates from table 

SELECT * 
FROM worldlifexpectancy
WHERE status = ''
;


SELECT DISTINCT(status)
FROM worldlifexpectancy
WHERE status <> ''
;

SELECT DISTINCT(country)
FROM worldlifexpectancy
WHERE status = 'Developing'
;

UPDATE worldlifexpectancy
SET status = 'Developing'
WHERE Country IN(SELECT DISTINCT(country)
				FROM worldlifexpectancy
				WHERE status = 'Developing')
;
#error produced unable to update 

UPDATE worldlifexpectancy t1
JOIN worldlifexpectancy t2
	ON t1.Country = t2.Country
SET t1.status = 'Developing'
WHERE t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developing'
;
#(corrected) able to join the table onto itself and then check status, if status is developing should plug in the same for that country if status is blank

SELECT * 
FROM worldlifexpectancy
WHERE status = ''
;

UPDATE worldlifexpectancy t1
JOIN worldlifexpectancy t2
	ON t1.Country = t2.Country
SET t1.status = 'Developed'
WHERE t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developed'
;
#used to correct blank status column by using same query just adjusted to developed

SELECT * 
FROM worldlifexpectancy
WHERE `Lifeexpectancy` = ''
;


SELECT Country, Year,`Lifeexpectancy`
FROM worldlifexpectancy
WHERE `Lifeexpectancy` = ''
;
#used to check for blank rows/columns 


SELECT t1.Country, t1.Year, t1.`Lifeexpectancy`,
t2.Country, t2.Year, t2.`Lifeexpectancy`,
t3.Country, t3.Year, t3.`Lifeexpectancy`,
ROUND((t2.`Lifeexpectancy` + t3.`Lifeexpectancy`)/2,1) #used to round to the 1st decimal 
FROM worldlifexpectancy t1
JOIN worldlifexpectancy t2
 ON t1.Country = t2.Country #joining tables onto itself by getting the year before and after blank
 AND t1.Year = t2.Year - 1
 JOIN worldlifexpectancy t3
 ON t1.Country = t3.Country
 AND t1.Year = t3.Year + 1
 WHERE t1.`Lifeexpectancy` = '' #filtering on only rows with blanks 
;
#gives the arverage life expectancy by using the previous year and 1 year after to fill in blank row 

UPDATE worldlifexpectancy t1
JOIN worldlifexpectancy t2
	ON t1.Country = t2.Country 
	AND t1.Year = t2.Year - 1
JOIN worldlifexpectancy t3
	ON t1.Country = t3.Country
	AND t1.Year = t3.Year + 1
SET t1.`Lifeexpectancy` = ROUND((t2.`Lifeexpectancy` + t3.`Lifeexpectancy`)/2,1)
WHERE t1.`Lifeexpectancy` = ''
;
#updates and sets new informatin into rows

SELECT *
FROM worldlifexpectancy
;


