#!/usr/bin/env bash

# Import environment variables
set -a
source .env
set +a

# Enable execution tracing
set -x

# Add model connection
for model in groq/llama-3.3-70b-versatile groq/meta-llama/llama-4-maverick-17b-128e-instruct groq/meta-llama/llama-4-scout-17b-16e-instruct groq/meta-llama/llama-guard-4-12b groq/meta-llama/llama-prompt-guard-2-22m groq/meta-llama/llama-prompt-guard-2-86m groq/openai/gpt-oss-safeguard-20b groq/openai/gpt-oss-120b groq/openai/gpt-oss-20b groq/qwen/qwen3-32b; do
  orchestrate models add --name "${model}" --provider-config "{\"api_key\": \"${GROQ_API_KEY}\"}"
done
