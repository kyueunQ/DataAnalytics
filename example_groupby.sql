
SELECT neighbourhood_group,
        MAX(price) AS max_price,
        MIN(price) AS min_price,
        AVG(price) AS average_price
FROM `data.airbnb_nyc`
GROUP BY neighbourhood_group

# GROUP BY와 SELECT column 동일
SELECT neighbourhood_group,
        neighbourhood,
        COUNT(id) AS id_count,
        AVG(price) AS average_price
FROM `data.airbnb_nyc`
GROUP BY neighbourhood_group, neighbourhood

# ORDER BY 정렬 
SELECT neighbourhood_group,
        neighbourhood,
        COUNT(id) AS id_count,
        AVG(price) AS average_price
FROM `data.airbnb_nyc`
GROUP BY neighbourhood_group, neighbourhood
ORDER BY neighbourhood_group, COUNT(id) DESC 


SELECT neighbourhood_group,
        neighbourhood,
        COUNT(id) AS id_count,
        AVG(price) AS average_price
FROM `data.airbnb_nyc`
GROUP BY 1, 2
ORDER BY 1, 3 DESC 

# 평균 숙소 가격이 150달러 미만인 지역
# 1. Aggregate function AVG not allowed in WHERE clause
SELECT neighbourhood_group,
        neighbourhood,
        COUNT(id) AS id_count,
        AVG(price) AS average_price
FROM `data.airbnb_nyc`
WHERE AVG(price) < 150
GROUP BY 1, 2
ORDER BY 1, 3 DESC 

# 2. HAVING 필요한 이유
SELECT neighbourhood_group,
        neighbourhood,
        COUNT(id) AS id_count,
        AVG(price) AS average_price
FROM `data.airbnb_nyc`
GROUP BY 1, 2
HAVING AVG(price) < 150
ORDER BY 1, 3 DESC 
