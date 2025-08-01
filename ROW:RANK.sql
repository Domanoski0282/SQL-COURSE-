#ROW AND RANK 

SELECT * 
FROM 
 
SELECT product_name, 
       ROW_NUMBER() OVER (ORDER BY product_price DESC) AS row_num
FROM products;



SELECT *,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) 
FROM employees
;

SELECT*
FROM 
(SELECT *,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS Rank_row
FROM employees) AS Ranked
WHERE Rank_row < 3
;



#quiz question 
SELECT artist_id, SUM(score) AS total_score,
RANK() OVER(ORDER BY SUM(score) DESC) AS rank_num
FROM rankings
GROUP BY artist_id
ORDER BY rank_num, artist_id ASC
LIMIT 100;

 #combine all scores
#rank artists from highest to lowest
#use DENSE_RANK
#ouput Artist, total score, rank
#ranking low to high
















