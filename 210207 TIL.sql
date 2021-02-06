-- Rolling RETENTION 구하기
SELECT COUNT(customer_id) AS total_customer,
       COUNT(CASE WHEN diff_day >= 29 THEN 1 END) AS retention_customer,
       -- COUNT( ) : NULL은 COUNT에서 제외
       COUNT(CASE WHEN diff_day >= 29 THEN 1 END) / COUNT(customer_id) AS rolling_retention_30,
FROM(
    SELECT customer_id, DATE(MIN(invoice_date)) AS fisrt_purchase, 
        DATE(MAX(invoice_date)) AS recent_purchase, 
        DATE_DIFF(DATE(MAX(invoice_date)), DATE(MIN(invoice_date)), DAY) AS diff_day
  FROM data.sales
  GROUP BY customer_id
)


-- WITH ~ AS 사용 시
WITH rolling_retention AS (
  SELECT customer_id, DATE(MIN(invoice_date)) AS fisrt_purchase, 
        DATE(MAX(invoice_date)) AS recent_purchase, 
        DATE_DIFF(DATE(MAX(invoice_date)), DATE(MIN(invoice_date)), DAY) AS diff_day
  FROM data.sales
  GROUP BY customer_id
)

SELECT COUNT(customer_id) AS total_customer,
       COUNT(CASE WHEN diff_day >= 29 THEN 1 END) AS retention_customer,
       COUNT(CASE WHEN diff_day >= 29 THEN 1 END) / COUNT(customer_id) AS rolling_retention_30,
FROM rolling_retention 


-- 7일 뒤에 다시 돌아온 유저의 비율
WITH rolling_retention AS (
  SELECT customer_id, DATE(MIN(invoice_date)) AS fisrt_purchase, 
        DATE(MAX(invoice_date)) AS recent_purchase, 
        DATE_DIFF(DATE(MAX(invoice_date)), DATE(MIN(invoice_date)), DAY) AS diff_day
  FROM data.sales
  GROUP BY customer_id
)

SELECT COUNT(customer_id) AS total_customer,
       COUNT(CASE WHEN diff_day >= 6 THEN 1 END) AS retention_customer,
       COUNT(CASE WHEN diff_day >= 6 THEN 1 END) / COUNT(customer_id) AS rolling_retention_30,
FROM rolling_retention 

-- 2달 뒤에 다시 올아온 유저의 비율
SELECT COUNT(customer_id) AS total_customer,
       COUNT(CASE WHEN diff_day >= 59 THEN 1 END) AS retention_customer,
       COUNT(CASE WHEN diff_day >= 59 THEN 1 END) / COUNT(customer_id) AS rolling_retention_30,
FROM (
  SELECT customer_id, DATE(MIN(invoice_date)) AS fisrt_purchase, 
        DATE(MAX(invoice_date)) AS recent_purchase, 
        DATE_DIFF(DATE(MAX(invoice_date)), DATE(MIN(invoice_date)), DAY) AS diff_day
  FROM data.sales
  GROUP BY customer_id
)


-- 연습 
-- 고객별 구매 회수 파악
SELECT customer_id, COUNT(invoice_no)
FROM data.sales
GROUP BY customer_id

-- 실제 한 고객을 확인한 결과 위의 구매 회수와 동일함 확인
SELECT *
FROM data.sales
WHERE customer_id = 17928


SELECT customer_id, ROUND(AVG(unit_price),2) AS avg_unit_price
FROM data.sales
GROUP BY customer_id 
-- 통계의 정확성을 위해 최댓값과 최솟값을 제외하고 평균을 구할 수 있을까 