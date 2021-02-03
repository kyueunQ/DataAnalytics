-- table summary
SELECT *
FROM data.funnel_data
LIMIT 100

-- total 142,082건
-- 유저는 몇 명일까 (중복제거)
SELECT COUNT(DISTINCT user_id) AS unique_user
FROM data.funnel_data
-- 90400명

-- LIMIT 100을 해보니 device가 모두 Mobile
-- 다른 항목은 없는지 확인
SELECT device
FROM data.funnel_data
GROUP BY device
-- 더 간단한 쿼리 
SELECT DISTINCT device
FROM data.funnel_data 

-- page 체크하기
-- 각 퍼널단계가 어떻게 나뉘는지 확인 
SELECT DISTINCT page 
FROM data.funnel_data
ORDER BY page
-- 4단계 확인, 홈화면/검색/결제/결제완료

-- 퍼널 구하기
-- 단계별 사람 수 구하기
-- COUNT 사용 시 'DISTINCT' 중복체크 습관들이기
SELECT page, COUNT(user_id) AS user_count, COUNT(DISTINCT user_id) AS check_user_count
FROM data.funnel_data
GROUP BY page
-- Desktop 1~4, Mobile 1~4 
SELECT page, device, COUNT(user_id) AS user_count, COUNT(DISTINCT user_id) AS check_user_count
FROM data.funnel_data
GROUP BY page, device 
ORDER BY device 