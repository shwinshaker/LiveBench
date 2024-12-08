#!/bin/bash
LIVEBENCH_PATH="/lustre/fsw/portfolios/llmservice/users/chengyud/experiments_evaluation/LiveBench"

MEGATRON_IP=10.65.199.1
OUTPUT_PATH="/lustre/fsw/portfolios/llmservice/users/chengyud/experiments_evaluation/runs/test"
# source "${LIVEBENCH_PATH}/.venv/bin/activate"
source /lustre/fsw/portfolios/llmservice/users/chengyud/miniconda3/bin/activate livebench  # different from dfw, we use conda env here, because python3.10 is not available in this cluster
# export HF_ALLOW_CODE_EVAL=1

echo "[$(date)] Running all code benchmarks"
export HF_HOME="/lustre/fsw/portfolios/llmservice/users/chengyud/huggingface"
# export HOME="/lustre/fsw/portfolios/llmservice/users/chengyud"
# cannot set export HOME="", otherwise conda env doesn't work, not sure why
# cd "${LIVEBENCH_PATH}/livebench"

# BENCH_NAME="live_bench/coding/coding_completion"
# BENCH_NAME="live_bench/coding/LCB_generation"
BENCH_NAME="live_bench/coding"
BATCH_SIZE=16  # 32
DATETIME=$(date +"%Y-%m-%d_%H-%M-%S")
MODEL_NAME="megatron-lm"
OUTPUT_PATH="${OUTPUT_PATH}/bs_${BATCH_SIZE}/${DATETIME}"
TEST_ARGS="" # "--question-begin 0 --question-end 2 "
# max_tokens=2048
python gen_api_answer.py --model ${MODEL_NAME} \
                         --bench-name ${BENCH_NAME} \
                         --api-base "http://${MEGATRON_IP}:5000/generate_until" \
                         --max-tokens 1024 \
                         --output-path ${OUTPUT_PATH} \
                         --batch-size ${BATCH_SIZE} \
                         ${TEST_ARGS} \

python gen_ground_truth_judgment.py --bench-name ${BENCH_NAME} \
                                    --model-list ${MODEL_NAME} \
                                    --output-path ${OUTPUT_PATH} \
                                    ${TEST_ARGS} \

python show_livebench_result.py --bench-name ${BENCH_NAME} \
                                --model-list ${MODEL_NAME} \
                                --input-path ${OUTPUT_PATH} \
