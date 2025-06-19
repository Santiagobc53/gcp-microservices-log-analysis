SELECT
  timestamp,
  JSON_VALUE(resource.labels.container_name) AS container,
  json_payload
FROM `PROJECT_ID.global.day2ops-log._AllLogs`
WHERE severity = "ERROR"
  AND json_payload IS NOT NULL
ORDER BY 1 DESC
LIMIT 50;
