#!/usr/bin/env bash
set -x

# Import environment variables
set -a
source .env
set +a

# Enable execution tracing
set -x

# Agents
for agent in service_now_agent customer_care_agent; do
  orchestrate agents undeploy --name ${agent}
  orchestrate agents remove --name ${agent} --kind native
done

# Service Now Tools
for tool in create_service_now_incident get_my_service_now_incidents get_service_now_incident_by_number; do
  orchestrate tools remove --name "${tool}"
done

# Healthcare Tools
for tool in get_healthcare_benefits get_my_claims search_healthcare_providers; do
  orchestrate tools remove --name "${tool}"
done

orchestrate connections remove --app-id "${SNOW_CONNECTION_NAME}"