-- need to use SUBQUERY 
SELECT MAX(order_date) AS max_order_date
FROM `taling-301908.data1.orders`

SELECT *
FROM `taling-301908.data1.orders`
-- change date continuosly -- 
WHERE order_date = '2021-01-24'


-- SUBQUERY 
SELECT *
FROM `taling-301908.data1.orders`
WHERE order_date = (
    SELECT MAX(order_date) AS max_order_date
    FROM `taling-301908.data1.orders`
)


-- #1. SUBQUERY, WHERE 
-- Customers who bought sth & Orders LIST 
SELECT *
FROM `taling-301908.data1.users`AS u
LEFT JOIN `taling-301908.data1.orders` AS o
ON u.customer_id = o.customer_id
WHERE order_id IS NOT NULL 

SELECT u.*, o.order_id
FROM `taling-301908.data1.users`AS u
LEFT JOIN `taling-301908.data1.orders` AS o
ON u.customer_id = o.customer_id
WHERE order_id IS NOT NULL 


-- EXTRACT ONLY Customers who bought sth LIST 
-- 위 테이블과 차이점 : 한사람 주문 여러개 상황 배제 
SELECT * 
FROM `taling-301908.data1.users`
WHERE customer_id IN(
    SELECT customer_id
    FROM `taling-301908.data1.orders` 
)



-- #2. SUBQUERY, FROM 
-- 1. LEFT JOIN 
SELECT o.*, u.state
FROM `taling-301908.data1.orders` AS o
LEFT JOIN `taling-301908.data1.users` AS u 
ON o.customer_id = u.customer_id

-- 2. Aggregate, GROUP BY 
SELECT u.state, o.order_date, SUM(quantity) AS daily_quantity
FROM `taling-301908.data1.orders` AS o
LEFT JOIN `taling-301908.data1.users` AS u 
ON o.customer_id = u.customer_id
GROUP BY u.state, o.order_date
ORDER BY 1, 2


SELECT state, AVG(daily_quantity) AS state_daily_quantity
FROM (
    SELECT u.state, o.order_date, SUM(quantity) AS daily_quantity
    FROM `taling-301908.data1.orders` AS o
    LEFT JOIN `taling-301908.data1.users` AS u 
    ON o.customer_id = u.customer_id
    GROUP BY 1, 2
    ORDER BY 1, 2
) sub
GROUP BY state
