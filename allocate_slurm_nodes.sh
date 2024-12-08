#! /bin/bash

set -eux

partition="interactive"
extra_args="--gpus-per-node=8 "
salloc \
  --job-name=llmservice_fm_text:dev \
  --account=llmservice_fm_text \
  --partition=${partition} \
  --nodes=1 \
  --time=04:00:00 \
  --exclusive \
  ${extra_args}

