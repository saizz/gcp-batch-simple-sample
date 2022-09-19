#!/usr/bin/bash

set -eu

project="saizo-batch-sample"
location="us-central1"
job="example-script-job"

gcloud beta batch jobs submit ${job} --location=${location} --config=config.json

job_name="projects/${project}/locations/${location}/jobs/${job}"
echo "$(date "+%H:%M:%S") job name: ${job_name}"

while :
do
  state="$(gcloud beta batch jobs describe ${job_name} --format=json | jq .status.state)"
  echo "$(date "+%H:%M:%S") state: ${state}"
  sleep 5s
done
