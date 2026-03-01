#!/usr/bin/env bash

# Import environment variables
set -a
source .env
set +a

# Enable execution tracing
set -x

# Add model connection
for model in groq/openai/gpt-oss-safeguard-20b groq/openai/gpt-oss-120b groq/openai/gpt-oss-20b groq/qwen/qwen3-32b; do
  orchestrate models add --name "${model}" --provider-config "{\"api_key\": \"${GROQ_API_KEY}\"}"
done
