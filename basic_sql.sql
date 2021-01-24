SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
WHERE price < 100;


-- BETWEEN A AND B --
SSELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
WHERE neighbourhood_group = 'Manhattan'
AND price BETWEEN 50 AND 150


-- WHERE, multiple conditions -- 
SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
WHERE neighbourhood_group = 'Manhattan'
AND price < 100
AND neighbourhood = 'Midtown' OR neighbourhood = 'SoHo'


-- WHERE, multiple conditons 2 (use '' to distinguish) --
SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
WHERE neighbourhood_group = 'Manhattan'
AND price < 100
AND (neighbourhood = 'Midtown' OR neighbourhood = 'SoHo')


-- WHERE, IN('') --
SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
WHERE neighbourhood_group = 'Manhattan'
AND price < 100
AND neighbourhood IN ('Midtown','SoHo')


-- WHERE --
SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
# SEQUENCE OF ALPHBET
WHERE neighbourhood_group > 'Manhattan'


-- WHERE, IS NOT NULL --
SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
WHERE last_review IS NOT NULL 


-- WHERE, LIKE 'Big%' --
SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price, number_of_reviews, last_review
FROM `taling-301908.data.airbnb_nyc`
WHERE name LIKE 'Big%'


-- UPPER(column), LOWER(column) --
SELECT name, UPPER(name) AS upper_name, LOWER(name) AS lower_name
FROM `taling-301908.data.airbnb_nyc`

SELECT id, name, neighbourhood_group, 
        neighbourhood, room_type, price
FROM `taling-301908.data.airbnb_nyc`
WHERE LOWER(name) LIKE '%terrace%'


-- count(column) : check the number of the column --

SELECT count(*) AS row_count
FROM `taling-301908.data.airbnb_nyc`


-- below two queries are same -- 
SELECT count(last_review) AS last_review_count
FROM `taling-301908.data.airbnb_nyc`

SELECT *
FROM `taling-301908.data.airbnb_nyc`
WHERE last_review IS NOT NULL


-- 결측치 확인 (null값 제외) --
SELECT count(*) AS row_count,
        count(id) AS room_count,
        count(last_review) AS last_review_count
FROM `data.airbnb_nyc`

-- 중복제거 (null값 제외된 결과 보여줌), count(DISTINCT id) --
SELECT count(id) AS id_count, count(DISTINCT id) AS unique_id_count
FROM `data.airbnb_nyc`

-- MIN(column), MAX(column) --
SELECT MIN(price) AS min_price, MAX(price) AS max_price 
FROM `data.airbnb_nyc`

# 평균 (null값 제외된 결과 보여줌)
SELECT AVG(price) AS average_price
FROM `data.airbnb_nyc`

SELECT SUM(number_of_reviews) AS sum_number_of_reviews
FROM `data.airbnb_nyc`


