# JOIN ~ ON ~
SELECT o.*, p.name, p.category, u.customer_id
FROM data1.orders AS o
JOIN data1.products AS p
ON o.product_id = p.product_id
JOIN data1.users AS u
ON o.customer_id = u.customer_id


-- LEFT JOIN  --
SELECT u.*, o.order_id, o.order_date
FROM data1.users AS u
LEFT JOIN data1.orders o
ON u.customer_id = o.customer_id

# AND절 JOIN 전에 실행
SELECT o.*, p.category, p.name
FROM data1.orders AS o
LEFT JOIN data1.products AS p 
ON o.product_id = p.product_id
AND p.category = 'Furniture'


# 좌측 테이블 고정, 좌측 column 기준 우측 테이블 데이터 추출
# WHERE절 JOIN 과정 마친 후 실행
SELECT o.*, p.category, p.name
FROM data1.orders AS o
LEFT JOIN data1.products AS p 
ON o.product_id = p.product_id
WHERE p.category = 'Furniture'


# 두 테이블 세로로 합치기
SELECT *
FROM data1.spotify_1990

UNION ALL 
-- UNION DISTINCT --

SELECT *
FROM data1.spotify_2000



# column명 달라도 되지만, data type과 수가 다르면 불가
SELECT title, artist
FROM data1.spotify_1990

UNION ALL
-- UNION DISTINCT 중복 data 제거

SELECT title AS song_name, artist 
FROM data1.spotify_2000


-- 전처리 --
SELECT last_review, PARSE_DATE('%Y.%m.%d', last_review) AS last_review
FROM data.airbnb_nyc 


-- 중복제거, 날짜 정보에서 특정 데이터만 추출 -- 
SELECT DISTINCT rental_date, 
       EXTRACT(YEAR FROM rental_date) AS rental_year
FROM data.bike_sharing 


SELECT DISTINCT rental_date, 
       EXTRACT (YEAR FROM rental_date) AS rental_year,
       EXTRACT(MONTH FROM rental_date) AS rental_month,
       EXTRACT(DAYOFWEEK FROM rental_date) AS rental_dow,
       EXTRACT(WEEK FROM rental_date) AS rental_week,
       EXTRACT(WEEK(MONDAY) FROM rental_date) AS rental_week,
FROM data.bike_sharing 


-- 특정기간을 더하고 뺴고 --
SELECT rental_date, 
       DATE_ADD(rental_date, INTERVAL 5 DAY) AS rental_date_5day,
       DATE_SUB(rental_date, INTERVAL 1 QUARTER) AS rental_date_1quarter
FROM data.bike_sharing 


-- (컬럼1 - 컬럼2) -- 
SELECT rental_date, 
       DATE_DIFF(DATE('2020-02-02'), rental_date, YEAR) AS diff_year,
       DATE_DIFF(DATE('2020-02-02'), rental_date, WEEK) AS diff_week
FROM data.bike_sharing 