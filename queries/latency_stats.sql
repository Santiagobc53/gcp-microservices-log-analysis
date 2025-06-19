SELECT
  hour,
  MIN(took_ms) AS min,
  MAX(took_ms) AS max,
  AVG(took_ms) AS avg
FROM (
  SELECT
    FORMAT_TIMESTAMP("%H", timestamp) AS hour,
    CAST(JSON_VALUE(json_payload, '$."http.resp.took_ms"') AS INT64) AS took_ms
  FROM `PROJECT_ID.global.day2ops-log._AllLogs`
  WHERE timestamp > TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 24 HOUR)
    AND json_payload IS NOT NULL
    AND JSON_VALUE(json_payload.message) = "request completed"
)
GROUP BY 1
ORDER BY 1;
