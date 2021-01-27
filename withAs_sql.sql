-- SUBQUERY 
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

-- USE 'WITH ~ AS' 
-- 임시테이블 만들기 
WITH daily_qunatity_table AS (
    SELECT u.state, o.order_date, SUM(o.quantity) AS daily_quantity
    FROM `taling-301908.data1.orders` AS o
    LEFT JOIN `taling-301908.data1.users` AS u
    ON o.customer_id = u.customer_id
    GROUP BY u.state, o.order_date
    ORDER BY 1, 2
)

SELECT state, AVG(daily_quantity) AS state_daily_quantity
FROM daily_qunatity_table 
GROUP BY state 