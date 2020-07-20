--Reformat the final_assignments_qa to look like the final_assignments table, filling in any missing values with a placeholder of the appropriate data type.

SELECT 
  item_id,
  test_a                                                                     AS test_assignment,
  CASE WHEN test_a is NOT NULL THEN 'test_a' ELSE NULL END                   AS test_number,
  CASE WHEN test_a = '1' THEN '2013-01-05 00:00:00' ELSE NULL END   AS date
FROM 
  dsv1069.final_assignments_qa
UNION
SELECT 
  item_id,
  test_b                                                                     AS test_assignment,
  CASE WHEN test_b is NOT NULL THEN 'test_b' ELSE NULL END                   AS test_number,
  CASE WHEN test_b = '1' THEN '2013-01-05 00:00:00' ELSE NULL END   AS date
FROM 
  dsv1069.final_assignments_qa
UNION
SELECT 
  item_id,
  test_c                                                                     AS test_assignment,
  CASE WHEN test_c is NOT NULL THEN 'test_c' ELSE NULL END                   AS test_number,
  CASE WHEN test_c = '1' THEN '2013-01-05 00:00:00' ELSE NULL END   AS date
FROM 
  dsv1069.final_assignments_qa
UNION
SELECT 
  item_id,
  test_d                                                                     AS test_assignment,
  CASE WHEN test_d is NOT NULL THEN 'test_d' ELSE NULL END                   AS test_number,
  CASE WHEN test_d = '1' THEN '2013-01-05 00:00:00' ELSE NULL END   AS date
FROM 
  dsv1069.final_assignments_qa
UNION
SELECT 
  item_id,
  test_e                                                                    AS test_assignment,
  CASE WHEN test_e is NOT NULL THEN 'test_e' ELSE NULL END                  AS test_number,
  CASE WHEN test_e = '1' THEN '2013-01-05 00:00:00' ELSE NULL END  AS date
FROM 
  dsv1069.final_assignments_qa
UNION
SELECT 
  item_id,
  test_f                                                                    AS test_assignment,
  CASE WHEN test_f is NOT NULL THEN 'test_f' ELSE NULL END                  AS test_number,
  CASE WHEN test_f = '1' THEN '2013-01-05 00:00:00' ELSE NULL END  AS date
FROM 
  dsv1069.final_assignments_qa
ORDER BY
  item_id
