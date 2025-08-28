-- World Life Expectancy (EDA)

SELECT * 
FROM worldlifexpectancy
;

SELECT Country, 
MAX(`lifeexpectancy`), 
MIN(`lifeexpectancy`)
FROM worldlifexpectancy
GROUP BY Country
HAVING MIN(`lifeexpectancy`) <> 0
AND MAX(`lifeexpectancy`) <> 0
ORDER BY Country DESC 
;
-- Checks for the min and max of life expectancy that is not 0 


SELECT Country, 
MAX(`lifeexpectancy`), 
MIN(`lifeexpectancy`),
ROUND(MAX(`lifeexpectancy`) - MIN(`lifeexpectancy`), 1) AS life_increase_15_years
FROM worldlifexpectancy
GROUP BY Country
HAVING MIN(`lifeexpectancy`) <> 0
AND MAX(`lifeexpectancy`) <> 0
ORDER BY life_increase_15_years DESC
;
-- Shows the life increase over 15 years foor each Country form high to low 

SELECT * 
FROM worldlifexpectancy
;

SELECT Year, ROUND(AVG(`Lifeexpectancy`), 2)
FROM worldlifexpectancy
WHERE `lifeexpectancy` <> 0
AND `lifeexpectancy` <> 0
GROUP BY Year
ORDER BY Year
;
-- Showing the avg life expectancy by year as a world pop

SELECT * 
FROM worldlifexpectancy
;


SELECT Country, 
ROUND(AVG(`lifeexpectancy`),1) AS Life_Exp,
ROUND(AVG(GDP),1) AS GDP
FROM worldlifexpectancy
GROUP BY Country
HAVING Life_exp > 0 
AND GDP > 0
ORDER BY GDP ASC
;
-- Shows the avg life and gdp by country low to high 

SELECT Country, 
ROUND(AVG(`lifeexpectancy`),1) AS Life_Exp,
ROUND(AVG(GDP),1) AS GDP
FROM worldlifexpectancy
GROUP BY Country
HAVING Life_exp > 0 
AND GDP > 0
ORDER BY GDP DESC
;
-- Shows the avg life and gdp by country high to low 

SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) high_GDP_count,
AVG(CASE WHEN GDP >= 1500 THEN `lifeexpectancy` ELSE NULL END) high_GDP_lifeexpectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) low_GDP_count,
AVG(CASE WHEN GDP <= 1500 THEN `lifeexpectancy` ELSE NULL END) low_GDP_lifeexpectancy
FROM worldlifexpectancy
;
-- Total number of rows that have a GDP above 1500 
-- AVG life_exp of high GDP Coutries (USE NULL) instead of 0 to filter on the average better for most accurate numbers
-- Total number of rows that have a GDP below 1500 
-- AVG life_exp of low GDP Coutries (USE NULL) instead of 0 to filter on the average better for most accurate numbers
-- whole query shows the correlation of how gdp effects life expectancy 
-- can be used for any column of data needed just use as a template 

SELECT Status, ROUND(AVG(`lifeexpectancy`), 1)
FROM worldlifexpectancy
GROUP BY Status
;
-- Shows the avg life_exp of developed and non-developed countries

SELECT Status, 
COUNT(DISTINCT Country), 
ROUND(AVG(`lifeexpectancy`), 1)
FROM worldlifexpectancy
GROUP BY Status
;
-- Shows the amount of countries that are developed vs non-developed
-- Shows the avg life_exp of developed and non-developed countries
-- Data is skewed in the favor of ther coun tries that are developed

SELECT * 
FROM worldlifexpectancy
;


SELECT Country, 
ROUND(AVG(`lifeexpectancy`),1) AS Life_Exp,
ROUND(AVG(BMI),1) AS BMI
FROM worldlifexpectancy
GROUP BY Country
HAVING Life_exp > 0 
AND BMI > 0
ORDER BY BMI DESC
;
-- Shows the avg life and BMI by country high to low 
-- Same query template as above adjusted for BMI

SELECT Country, 
ROUND(AVG(`lifeexpectancy`),1) AS Life_Exp,
ROUND(AVG(BMI),1) AS BMI
FROM worldlifexpectancy
GROUP BY Country
HAVING Life_exp > 0 
AND BMI > 0
ORDER BY BMI ASC
;
-- Shows the avg life and BMI by country Low to High
-- Same query template as above adjusted for BMI

SELECT * 
FROM worldlifexpectancy
;


SELECT Country,
Year,
`lifeexpectancy`,
`AdultMortality`,
SUM(`AdultMortality`)OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total -- Equation is used to calc the rolling total 
FROM worldlifexpectancy
;
-- rolling total of adult_mortatlity rate by country each year over the last 15 years

SELECT Country,
Year,
`lifeexpectancy`,
`AdultMortality`,
SUM(`AdultMortality`)OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total -- Equation is used to calc the rolling total 
FROM worldlifexpectancy
WHERE Country LIKE '%United%States%'
;
-- used to specify a country by name to look into



