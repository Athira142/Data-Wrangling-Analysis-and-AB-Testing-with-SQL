-- Use this table to 
-- compute view_binary for the 30 day window after the test_start_date
-- for the test named item_test_2

SELECT
  tests.item_id,
  tests.test_assignment,
  MAX(CASE WHEN (DATE_PART('days',view_event.event_time - tests.test_start_date) <= 30) THEN 1 ELSE 0 END) AS view_binary
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
  (
    SELECT 
      event_id,
      user_id,
      event_time,
      parameter_name,
      CAST(parameter_value AS INT)
    FROM
      dsv1069.events
    WHERE
      event_name = 'view_item'
    AND 
      parameter_name = 'item_id'
  ) AS view_event
ON 
  view_event.parameter_value = tests.item_id
WHERE 
  view_event.event_time > tests.test_start_date
GROUP BY
  tests.item_id,
  tests.test_assignment
ORDER BY 
  tests.item_id
