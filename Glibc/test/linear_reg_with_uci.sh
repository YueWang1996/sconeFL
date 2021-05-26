# commands used for https://github.com/PaddlePaddle/PaddleFL/blob/master/python/paddle_fl/mpc/examples/linear_reg_with_uci/README.md

export PATH_TO_REDIS_BIN=/usr/local/bin/ && export REDIS_PORT=6379 && export LOCALHOST=localhost && export PYTHON=/opt/_internal/cpython-3.6.0/bin/python3

cd /PaddleFL/python/paddle_fl/mpc/examples/linear_reg_with_uci \
&& python3 prepare.py \
&& bash ../run_standalone.sh uci_demo.py
