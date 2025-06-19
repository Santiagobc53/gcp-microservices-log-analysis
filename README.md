# GCP Microservices Log Analysis Lab

This repository documents the process and queries used in a hands-on Google Cloud lab focused on analyzing logs from a microservices-based application deployed in Kubernetes Engine (GKE).

## 🌐 Lab Summary

In this lab, I worked with a real microservices demo app ("Online Boutique") deployed on a GKE cluster. Using Cloud Logging and Log Analytics, I was able to:

- Deploy the application and verify Kubernetes pod health
- Explore logs using Log Explorer
- Create log buckets and configure sinks for routing
- Analyze application performance through custom SQL queries in BigQuery

## 🔍 Key Concepts Covered

- GKE deployment verification
- Cloud Logging buckets and routing
- Log-based metrics and queries
- Latency and error log analysis
- Exporting logs to BigQuery
- Using SQL to identify performance bottlenecks

## 📊 Sample SQL Queries

Some example queries used during the lab:

```sql
-- Recent container errors
SELECT
  timestamp,
  JSON_VALUE(resource.labels.container_name) AS container,
  json_payload
FROM `PROJECT_ID.global.day2ops-log._AllLogs`
WHERE severity = "ERROR"
  AND json_payload IS NOT NULL
ORDER BY 1 DESC
LIMIT 50;

-- Latency stats per hour
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

📁 Folder Structure
pgsql
Copiar código
gcp-microservices-log-analysis/
├── README.md
└── queries/
    ├── errors.sql
    ├── latency_stats.sql
    └── checkout_sessions.sql 

    ✨ Author
Santiago Barrera
GitHub: Santiagobc53