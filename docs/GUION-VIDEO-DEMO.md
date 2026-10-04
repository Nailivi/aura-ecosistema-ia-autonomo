# Guion del video demo (≈ 3 min)
**Antes de grabar:** oculta credenciales (cierra paneles de credenciales, no abras el nodo 02 con IDs reales si son sensibles, usa token de prueba).

| Tiempo | Qué mostrar | Qué decir |
|---|---|---|
| 0:00-0:20 | Diagrama del PDF | Problema, caso de uso y las 4 capas: n8n, Airtable, IA, Gmail/Slack |
| 0:20-0:50 | **Trigger**: `probar.sh 01-vip-completo.json` | «Webhook protegido; responde 200 y procesa sin intervención» |
| 0:50-1:30 | Canvas del flujo 01 corriendo | Validación, anti-duplicado, IA-1 (GPT-4o-mini), router por score, IA-2 (Claude), guardrails |
| 1:30-2:00 | Slack: mensaje de aprobación → **Aprobar** | «Punto HITL: nada sale al cliente sin aprobación» |
| 2:00-2:25 | Gmail (hilo) + Airtable (estados, propuesta, costo) | «Resultado final y trazabilidad» |
| 2:25-2:50 | Caso 04 (datos incompletos) → Errores_Log + alerta | «Ruta de error: el sistema se estabiliza y registra» |
| 2:50-3:00 | Dashboard público | KPIs y tasa de errores |
