# commands for https://github.com/PaddlePaddle/PaddleFL/blob/master/python/paddle_fl/mpc/examples/logistic_with_mnist/README.md

# export PATH_TO_REDIS_BIN=/usr/local/bin/ && export REDIS_PORT=6379 && export LOCALHOST=localhost && export PYTHON=/opt/_internal/cpython-3.6.0/bin/python3

cd /PaddleFL/python/paddle_fl/mpc/examples/logistic_with_mnist \
&& python3 process_data.py \
&& bash ../run_standalone.sh train_fc_sigmoid.py \
&& python3 decrypt_save.py decrypt_file
