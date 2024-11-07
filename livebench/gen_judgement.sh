export HF_HOME="/lustre/fsw/portfolios/llmservice/users/chengyud/huggingface_cache"
export HOME="/lustre/fsw/portfolios/llmservice/users/chengyud"
python gen_ground_truth_judgment.py --bench-name "live_bench/coding/LCB_generation" \
                                    --model-list "megatron-lm" \
                                    --output-path "/lustre/fsw/portfolios/llmservice/users/chengyud/experiments_evaluation/LiveBench/runs/megatron_lm/bs_1/2024-11-07_02-25-22" \
                                    --question-begin 0 --question-end 77 \