export HF_HOME="/lustre/fsw/portfolios/llmservice/users/chengyud/huggingface_cache"
export HOME="/lustre/fsw/portfolios/llmservice/users/chengyud"
python gen_ground_truth_judgment.py --bench-name "live_bench/coding/coding_completion" \
                                    --model-list "megatron-lm" \
                                    # --question-begin 0 --question-end 2 \