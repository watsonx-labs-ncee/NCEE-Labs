#!/usr/bin/env bash

# Import environment variables
set -a
source .env
set +a

# Enable execution tracing
set -x

# Add model connection
for model in openai/gpt-4.1 openai/gpt-4o openai/gpt-5; do
  orchestrate models add --name "${model}" --provider-config "{\"api_key\": \"${OPENAI_API_KEY}\"}"
done
