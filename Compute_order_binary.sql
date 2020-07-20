-- Use this table to 
-- compute order_binary for the 30 day window after the test_start_date
-- for the test named item_test_2
SELECT
  tests.item_id,
  tests.test_assignment,
  MAX(CASE WHEN (DATE_PART('days',orders.created_at - tests.test_start_date) <= 30) THEN 1 ELSE 0 END) AS order_binary
FROM
  (
    SELECT 
      item_id,
      test_number,
      test_assignment,
      test_start_date
    FROM 
      dsv1069.final_assignments
    WHERE 
      test_number = 'item_test_2'
  ) AS tests
JOIN
  dsv1069.orders
ON 
  orders.item_id = tests.item_id
WHERE 
  orders.created_at > tests.test_start_date
GROUP BY
  tests.item_id,
  tests.test_assignment