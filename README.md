# 🧠 GCP Logging & Observability in GKE

Este repositorio documenta el laboratorio de Google Cloud sobre la recopilación, análisis y exportación de registros en aplicaciones de microservicios desplegadas en Google Kubernetes Engine (GKE). El laboratorio incluye integración con Cloud Logging, creación de buckets personalizados, receptores (sinks) y análisis con BigQuery.

---

## ✅ Objetivos del laboratorio

- Visualizar y consultar registros de microservicios desplegados en GKE.
- Crear un bucket de registros con Log Analytics activado.
- Exportar registros desde Cloud Logging hacia BigQuery.
- Ejecutar consultas SQL para análisis de errores, latencia y comportamiento del usuario.

---

## 📁 Estructura del repositorio

```bash
├── README.md                  # Documentación del laboratorio
├── queries/                   # Consultas SQL utilizadas en Log Analytics / BigQuery
│   ├── latest_errors.sql
│   ├── latency_stats.sql
│   ├── product_views.sql
│   └── cart_checkout_sessions.sql
🔍 Consultas destacadas
latest_errors.sql: muestra los últimos errores registrados por los pods.

latency_stats.sql: calcula latencia mínima, máxima y promedio del frontend.

product_views.sql: cuenta cuántas veces se visualizó un producto.

cart_checkout_sessions.sql: identifica sesiones que hicieron checkout.

🧪 Evidencias del laboratorio
Microservicios en GKE	Servicios en Kubernetes	App Online Boutique funcionando

📝 Capturas:

Todos los pods corriendo (Running).

Servicios en estado OK, incluyendo frontend-external.

Aplicación Online Boutique abierta exitosamente desde IP externa.

🧠 Aprendizajes clave
Uso del Explorador de Logs para filtrar eventos específicos (k8s_container).

Creación de buckets personalizados y vinculación con BigQuery.

Generación de sinks (receptores) para enrutar registros.

Ejecución de consultas avanzadas en Log Analytics.

🛠️ Tecnologías utilizadas
Google Kubernetes Engine (GKE)

Cloud Logging + Log Explorer

Cloud Monitoring

BigQuery

Cloud Shell

kubectl

👨‍💻 Autor
Santiago Barrera
GitHub | LinkedIn

