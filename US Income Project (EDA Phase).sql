-- US Income Project (EDA Phase)

SELECT *
FROM us_income_project.USHouseholdIncome
;

SELECT * 
FROM us_income_project.ushouseholdincome_statistics
;

SELECT State_Name, SUM(Aland),SUM(AWater)
FROM USHouseholdIncome
GROUP BY State_Name
ORDER BY 2 DESC
;
-- shows states land amount in desc order

SELECT State_Name, SUM(Aland),SUM(AWater)
FROM USHouseholdIncome
GROUP BY State_Name
ORDER BY 3 DESC
;
-- shows states water amount in desc order

SELECT State_Name, SUM(Aland),SUM(AWater)
FROM USHouseholdIncome
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10 
;
-- Shows top 10 states with top 10 land

SELECT State_Name, SUM(Aland),SUM(AWater)
FROM USHouseholdIncome
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10 
;
-- Shows top 10 states with top 10 water


SELECT State_name, ALand, AWater
FROM us_income_project.USHouseholdIncome
HAVING State_Name = 'Alaska'
ORDER BY State_name ASC
;
-- Shows the land and water amount in the state of Alaska 

SELECT *
FROM us_income_project.USHouseholdIncome
;

SELECT * 
FROM us_income_project.ushouseholdincome_statistics
;

SELECT *
FROM us_income_project.USHouseholdIncome u
JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
;
-- JOIN on both tables 

SELECT *
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
;
-- filters out rows that are reported as 0 

SELECT u.State_Name, County, Type, `Primary`, Mean, Median 
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
;
-- pulls categorical data from both tables 

SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2
;
-- pulls avg mean/median household income by state only,  from low to high 

SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2
LIMIT 5
;
-- shows the bottom 5 states ranked by mean income 

SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 5 
;
-- shows the top 5 states ranked by mean income 

SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 5 
;
-- shows the top 5 states ranked by median income 

SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 5 
;
-- shows the bottom 5 states ranked by median income 

SELECT *
FROM us_income_project.USHouseholdIncome
;

SELECT * 
FROM us_income_project.ushouseholdincome_statistics
;

SELECT u.State_Name, County, Type, `Primary`, Mean, Median 
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
;
-- pulls categorical data from both tables 

SELECT Type,Count(Type),ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY Type
ORDER BY 4 DESC
;
-- pulls categorical data and shows the avg median income by household high to low based on type 


SELECT Type,Count(Type),ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY Type
ORDER BY 3 DESC
;
-- pulls categorical data and shows the avg mean income by household  high to low based on type 

SELECT * 
FROM USHouseholdIncome
WHERE Type = 'Community'
;
 -- Shows US income of type (community) 
 -- Result = PR which is why this category is so low in comparison to other US States
 -- Would exclude this data in real world considering  this is a US Territory not a State
 
 
SELECT Type,Count(Type),ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY Type
HAVING Count(Type) > 100
ORDER BY 3 DESC
;
-- pulls categorical data and shows the avg mean income by household  high to low based on type 
-- excludes data with low COUNT(Type) to show more accurate data 
-- filters out the outliers 
 
SELECT *
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
;
-- pulls categorical data from both tables 
 
SELECT u.State_Name,City,ROUND(AVG(Mean), 1), ROUND(AVG(Median),1)
FROM us_income_project.USHouseholdIncome u
INNER JOIN us_income_project.ushouseholdincome_statistics us
	ON u.ID = us.ID
WHERE Mean <> 0
GROUP BY u.State_Name,City
ORDER BY ROUND(AVG(Mean), 1) DESC 
;
-- pulls state, city, avg mean and  avg median income 
-- ordered from high to low on the mean income 
 
 

