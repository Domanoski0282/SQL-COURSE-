-- US Income Project (Data Cleaning Phase)

SELECT * 
FROM us_income_project.USHouseholdIncome
;

SELECT * 
FROM us_income_project.ushouseholdincome_statistics
;


SELECT * 
FROM USHouseholdIncome
;

ALTER TABLE USHouseholdIncome RENAME COLUMN `row_id` TO `Row_ID`;
-- cleans column name

ALTER TABLE USHouseholdIncome RENAME COLUMN `id` TO `ID`;
-- cleans column name 


SELECT * 
FROM ushouseholdincome_statistics
;

ALTER TABLE ushouseholdincome_statistics  RENAME COLUMN `id` TO `ID`;
-- cleans column name 

ALTER TABLE ushouseholdincome_statistics  RENAME COLUMN `sum_w` TO `Sum_W`;
-- cleans column name 

SELECT *
FROM USHouseholdIncome
;

SELECT *
FROM ushouseholdincome_statistics
;

SELECT ID, COUNT(ID)
FROM USHouseholdIncome
GROUP BY ID
HAVING COUNT(ID) > 1
;
-- shows duplicate ID numbers
-- results show 7 rows 


SELECT *
FROM (
SELECT Row_ID, 
ID,
ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID) AS row_num
FROM USHouseholdIncome
) duplicates
WHERE row_num > 1
;
-- use of sub query to filter on dups 
-- use to double check that our delete statement functioned properly

DELETE FROM USHouseholdIncome
WHERE Row_id IN (
	SELECT Row_ID
	FROM (
		SELECT Row_ID, 
		ID,
		ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID) AS row_num
		FROM USHouseholdIncome
		) duplicates
	WHERE row_num > 1)
;
-- used to delete duplicates 

SELECT State_Name, COUNT(State_Name)
FROM USHouseholdIncome
GROUP BY State_Name
;
-- shows errors in state name(spelling, capitalization, etc)
-- shows count of state names
-- used to double check that corrections took place 

UPDATE USHouseholdIncome
SET State_Name = 'Georgia'
WHERE State_Name = 'georia' 
;
-- corrects error of misspelled state name 

UPDATE USHouseholdIncome
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;
-- corrected the capitlaization of 1 row 

SELECT *
FROM USHouseholdIncome
;

SELECT Type, COUNT(Type)
FROM USHouseholdIncome
GROUP BY Type
;
-- shows types of place and spots if therer are dups

UPDATE USHouseholdIncome
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;
-- removes duplicate and adds it into proper category

SELECT *
FROM USHouseholdIncome
;


SELECT ALand, AWater
FROM USHouseholdIncome
WHERE (AWater = 0 OR AWater IS NULL)
AND (ALand = 0 OR ALand IS NULL) 
;
-- checks to see if there is missing data

SELECT ALand, AWater
FROM USHouseholdIncome
WHERE (ALand = 0 OR ALand IS NULL) 
;
-- confirms that there is no missing fields and that some areas are strictly water

SELECT DISTINCT AWater
FROM USHouseholdIncome
WHERE AWater= 0 OR AWater IS NULL 
;

SELECT DISTINCT ALand
FROM USHouseholdIncome
WHERE ALand = 0 OR ALand IS NULL 
;

SELECT ID, COUNT(ID)
FROM ushouseholdincome_statistics
GROUP BY ID
HAVING COUNT(ID) > 1
;
-- shows duplicate ID numbers
-- results = 0 




