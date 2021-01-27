-- CASE WHEN ~ THEN ~ END
SELECT humidity,
       CASE WHEN humidity>=0 AND humidity<30 THEN '건조'
            WHEN humidity>=30 AND humidity<60 THEN '적정'
            WHEN humidity>=60 AND humidity<100 THEN '습함' ELSE 'ERROR' END AS humidity_group
FROM `taling-301908.data.bike_sharing`


SELECT DISTINCT humidity,
       CASE WHEN humidity>=0 AND humidity<30 THEN '0_건조'
            WHEN humidity>=30 AND humidity<60 THEN '1_적정'
            WHEN humidity>=60 AND humidity<100 THEN '2_습함' ELSE '3_ERROR' END AS humidity_group
FROM `taling-301908.data.bike_sharing`
ORDER BY humidity