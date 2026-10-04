# AURA · Ecosistema de Automatización IA Autónomo para Negocios

**Caso de uso:** gestión de leads B2B de punta a punta (recepción → clasificación con IA → propuesta personalizada → **aprobación humana** → respuesta por Gmail/Slack), con memoria relacional en Airtable y dashboard ejecutivo.
**Cliente ficticio:** Aurora Digital Studio. **Stack:** n8n · Airtable · OpenAI GPT-4o-mini · Anthropic Claude Sonnet 5.5 · Gmail · Slack (WhatsApp opcional).

## Enlaces obligatorios (completar)
| Entregable | Enlace |
|---|---|
| Base de datos Airtable (solo lectura) | `[PEGAR ENLACE]` |
| Dashboard ejecutivo público | `[PEGAR ENLACE]` |
| Video demo (3 min) | `[PEGAR ENLACE]` |

## Contenido
| Carpeta | Qué hay | Criterio de la rúbrica |
|---|---|---|
| `docs/AURA-Documentacion-Tecnica.pdf` | Diagrama de arquitectura, manual de datos, costos, seguridad, dashboard, plan de pruebas | 1, 2, 3, 4, 5 |
| `docs/omni-prompt-base.md` | Prompts para generar la base y el dashboard con Airtable Omni | 2, 5 |
| `workflows/01-aura-flujo-principal.json` | Flujo principal (56 nodos) | 1, 4 |
| `workflows/02-aura-intake-gmail.json` | Disparador Gmail → webhook | 1 |
| `workflows/03-aura-batch-seguimiento.json` | Lote nocturno (Message Batches, −50 %) | 3 |
| `workflows/04-aura-errores-global.json` | Manejador global de errores | 4 |
| `data/` | CSV semilla del catálogo y esquemas JSON (tablas y variables) | 2 |
| `pruebas/` | 5 payloads + `probar.sh` para el test de estrés | 4 |
| `evidencias/` | Aquí van tus capturas (ver `GUIA-EVIDENCIAS.md`) | todos |

## Puesta en marcha
1. Crea la base con Omni (`docs/omni-prompt-base.md`), corrige campos extra e importa `data/catalogo_servicios_seed.csv` en **Catalogo_Servicios**.
2. En n8n crea credenciales: Airtable (PAT), OpenAI, Anthropic, Slack, Gmail OAuth2 y *Header Auth* (nombre `X-API-KEY`).
3. Importa los 4 JSON (primero el 04). Re-vincula credenciales en los nodos marcados.
4. En el flujo 01: *Settings → Error Workflow* = «AURA · 04 Manejador Global de Errores».
5. Completa **02 Config Variables** (IDs de base/tablas, canales de Slack, URL de n8n). Es el único lugar con valores de negocio.
6. Slack: invita el bot a los 3 canales. Gmail: crea la etiqueta `leads-ia`.
7. Activa 01 (y 02, 03, 04) y prueba con `pruebas/probar.sh`.

## Aviso importante
Los workflows se generaron y validaron estructuralmente (JSON, conexiones, referencias entre nodos y sintaxis de los nodos Code), pero **no se ejecutaron contra tus cuentas**. Al importarlos, revisa credenciales y campos de cada nodo; los nombres de campo de Airtable deben coincidir exactamente. Ninguna credencial está incluida en el repositorio.
