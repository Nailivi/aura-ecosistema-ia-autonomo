#!/usr/bin/env bash
# Uso: WEBHOOK_URL="https://TU-N8N/webhook/aura-lead-entrante" WEBHOOK_TOKEN="tu-token" ./probar.sh 01-vip-completo.json
# (usa /webhook-test/... mientras ejecutas el flujo manualmente; /webhook/... con el flujo activo)
set -euo pipefail
: "${WEBHOOK_URL:?Define WEBHOOK_URL}"; : "${WEBHOOK_TOKEN:?Define WEBHOOK_TOKEN}"
curl -sS -X POST "$WEBHOOK_URL" -H "Content-Type: application/json" -H "X-API-KEY: $WEBHOOK_TOKEN" --data @"${1:?archivo json}"
echo
