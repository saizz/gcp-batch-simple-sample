#!/usr/bin/bash

project="saizo-batch-sample"

gcloud builds submit -t "asia-northeast1-docker.pkg.dev/${project}/cloudrun/logger-job"