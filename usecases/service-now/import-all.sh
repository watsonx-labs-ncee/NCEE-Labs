#!/usr/bin/env bash

# Import environment variables
set -a
source .env
set +a

# Enable execution tracing
set -x

# Get the directory of the current script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Re-add connection
orchestrate connections add -a "${SNOW_CONNECTION_NAME}"

# Draft environment connection configuration
orchestrate connections configure -a "${SNOW_CONNECTION_NAME}" --env draft --type team --kind basic --url "${SNOW_URL}"
orchestrate connections set-credentials -a "${SNOW_CONNECTION_NAME}" --env draft -u "${SNOW_USER}" -p "${SNOW_PASSWORD}"
# Live environment connection configuration - Does not go through on Developer Edition
orchestrate connections configure -a "${SNOW_CONNECTION_NAME}" --env live --type team --kind basic --url "${SNOW_URL}"
orchestrate connections set-credentials -a "${SNOW_CONNECTION_NAME}" --env live -u "${SNOW_USER}" -p "${SNOW_PASSWORD}"

# Healthcare Customer Care Tools and Agents
for python_tool in customer_care/get_healthcare_benefits.py customer_care/get_my_claims.py customer_care/search_healthcare_providers.py; do
  orchestrate tools import -k python -f ${SCRIPT_DIR}/tools/${python_tool} -r ${SCRIPT_DIR}/tools/requirements.txt
done

# ServiceNow Tools
for python_tool in servicenow/create_service_now_incident.py servicenow/get_my_service_now_incidents.py servicenow/get_service_now_incident_by_number.py; do
  orchestrate tools import -k python -f "${SCRIPT_DIR}/tools/${python_tool}" -r "${SCRIPT_DIR}/tools/requirements.txt" --app-id "${SNOW_CONNECTION_NAME}"
done

# Knowledge
orchestrate knowledge-bases import -f ${SCRIPT_DIR}/knowledge_base/service_now_knowledge_base.yaml

# Agents - Import and Deploy
for agent in service_now_agent customer_care_agent; do
  orchestrate agents import -f ${SCRIPT_DIR}/agents/${agent}.yaml
  orchestrate agents deploy --name ${agent}
done
