# Prompts para Airtable Omni

## 1) Crear la base (tablas, campos, vínculos)
Pega esto en *Build an app with Omni*:

```
Crea una base de Airtable llamada "AURA - Ecosistema IA Autonomo". Crea SOLO las tablas y campos listados; no agregues campos extra. Primero crea todas las tablas y campos normales; DESPUES crea los campos de vinculo, rollup y formula.

TABLA "Leads" (campo primario: Etiqueta, formula {Nombre} & " · " & {Email}):
Nombre (texto), Email (email), Telefono (telefono), Empresa (texto), Fuente (seleccion unica: Webhook, Gmail, Formulario), Mensaje original (texto largo), Hash idempotencia (texto), Estado (seleccion unica: Pendiente, Procesado por IA, Esperando aprobacion, Aprobado por Humano, Enviado, Rechazado por Humano, Descartado (spam), Revision manual, Error), Categoria IA (seleccion unica: VIP, ESTANDAR, SPAM), Score IA (numero entero), Urgencia (seleccion unica: alta, media, baja), Presupuesto estimado USD (numero), Resumen IA (texto largo), Servicio sugerido (texto), Datos faltantes (texto largo), Gmail Message ID (texto), Gmail Thread ID (texto), Slack Thread TS (texto), Slack Canal ID (texto), Intentos IA (numero entero), Recibido en (fecha y hora), Enviado en (fecha y hora), Seguimiento generado (checkbox), Costo IA-1 USD (numero con 6 decimales).

TABLA "Propuestas" (primario: Asunto): Lead (vinculo a Leads), Tipo (seleccion unica: Propuesta inicial, Seguimiento), Estado (seleccion unica: Borrador IA, Aprobada por Humano, Rechazada por Humano, Enviada), Ruta (seleccion unica: VIP, ESTANDAR), Cuerpo (texto largo), Supuestos (texto largo), Preguntas abiertas (texto largo), Alertas guardrail (texto largo), Servicio principal (vinculo a Catalogo_Servicios), Modelo IA (texto), Tokens entrada (numero entero), Tokens salida (numero entero), Costo estimado USD (numero con 6 decimales), Decision en (fecha y hora), Lote (vinculo a Lotes_Batch).

TABLA "Interacciones" (primario: Resumen): Lead (vinculo a Leads), Direccion (seleccion unica: Entrante, Saliente), Canal (seleccion unica: Email, Slack, WhatsApp, Webhook), Contenido (texto largo), Thread ID (texto), Fecha (fecha y hora), Propuesta (vinculo a Propuestas).

TABLA "Catalogo_Servicios" (primario: Nombre): Categoria (texto), Descripcion (texto largo), Precio desde USD (numero), Precio hasta USD (numero), Duracion estimada (texto), Activo (checkbox).

TABLA "Errores_Log" (primario: Resumen): Workflow (texto), Etapa (texto), Tipo (seleccion unica: DATOS_INCOMPLETOS, API_IA, JSON_INVALIDO, API_GMAIL, API_AIRTABLE, API_SLACK, HITL_TIMEOUT, OTRO), Severidad (seleccion unica: Baja, Media, Alta, Critica), Mensaje (texto largo), Payload resumen (texto), Execution ID (texto), Execution URL (URL), Lead (vinculo a Leads), Resuelto (checkbox), Fecha (fecha de creacion).

TABLA "Lotes_Batch" (primario: Batch ID): Proveedor (texto), Modelo (texto), Estado (seleccion unica: en_proceso, completado, con_errores, fallido), Requests totales (numero entero), Exitosos (numero entero), Con error (numero entero), Costo real USD (numero con 6 decimales), Creado en (fecha y hora), Finalizado en (fecha y hora).

CAMPOS CALCULADOS (al final): en Leads: N Errores (rollup que cuenta Errores_Log), Tuvo error (formula IF({N Errores}>0,1,0)), Minutos a envio (formula DATETIME_DIFF({Enviado en},{Recibido en},'minutes')), Costo IA total USD (rollup suma de Propuestas.Costo estimado USD, mas Costo IA-1 USD). En Propuestas: Minutos a decision (formula DATETIME_DIFF({Decision en},CREATED_TIME(),'minutes')).
No cargues datos de ejemplo en Leads, Propuestas, Interacciones, Errores_Log ni Lotes_Batch.
```

## 2) Crear el dashboard (después de la base)
Abre *Interfaces → página de dashboard* y luego pega:

```
Abre la pagina de dashboard en Interfaces y crea el "Dashboard Ejecutivo AURA" con: (1) numeros: total de Leads, leads VIP, leads Enviados, promedio de Minutos a envio, promedio de Tuvo error (como porcentaje = tasa de errores), suma de Costo IA total USD; (2) grafico de barras de Leads por Estado; (3) grafico de linea de Leads por dia (Recibido en); (4) grafico de dona de Errores_Log por Tipo; (5) lista de Propuestas con Estado = Borrador IA (pendientes de aprobacion) ordenada por fecha; (6) lista de Errores_Log con Resuelto sin marcar. Habilita el enlace de comparticion publico solo-lectura.
```

> Omni suele crear campos extra: revisa y borra los que no estén en la lista; los nombres deben coincidir EXACTAMENTE con los del flujo n8n.
