SELECT
  JSON_VALUE(json_payload.session) AS session,
  COUNT(*) AS total
FROM `PROJECT_ID.global.day2ops-log._AllLogs`
WHERE
  JSON_VALUE(json_payload['http.req.method']) = "POST"
  AND JSON_VALUE(json_payload['http.req.path']) = "/cart/checkout"
  AND timestamp > TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 HOUR)
GROUP BY session;
