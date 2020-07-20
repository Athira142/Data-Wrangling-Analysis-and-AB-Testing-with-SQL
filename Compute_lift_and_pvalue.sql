--Use the https://thumbtack.github.io/abba/demo/abba.html to compute the lifts in metrics and the p-values for the binary metrics ( 30 day order binary and 30 day view binary) using a interval 95% confidence. 


SELECT
  test_assignment,
  COUNT(item_id)         AS item_id,
  SUM(view_binary)       AS view_binary,
  SUM(order_binary)      AS order_binary
FROM
 (
  SELECT 
    tests.item_id,
    tests.test_assignment,
    MAX(CASE WHEN (DATE_PART('days',orders.created_at - tests.test_start_date) <= 30) THEN 1 ELSE 0 END)     AS order_binary,
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
    dsv1069.orders
  ON 
    orders.item_id = tests.item_id
  AND 
    orders.created_at > tests.test_start_date
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
  AND 
    view_event.event_time > tests.test_start_date
  GROUP BY
    tests.item_id,
    tests.test_assignment
 ) AS final
GROUP BY 
  test_assignment