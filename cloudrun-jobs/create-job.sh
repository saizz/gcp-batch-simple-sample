#!/usr/bin/bash

set -eu

project="saizo-batch-sample"
region="asia-northeast1"

gcloud beta run jobs create logger-job \
  --project="${project}" \
  --region="${region}" \
  --image="asia-northeast1-docker.pkg.dev/${project}/cloudrun/logger-job" \
  --tasks=5 \
  --parallelism=2 \
  --set-env-vars SLEEP_MS=5000 \
  --set-env-vars FAIL_RATE=0.1 \