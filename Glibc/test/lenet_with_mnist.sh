# commands for https://github.com/PaddlePaddle/PaddleFL/blob/master/python/paddle_fl/mpc/examples/lenet_with_mnist/README_CN.md

export PATH_TO_REDIS_BIN=/usr/local/bin/ && export REDIS_PORT=6379 && export LOCALHOST=localhost && export PYTHON=/opt/_internal/cpython-3.6.0/bin/python3

cd /PaddleFL/python/paddle_fl/mpc/examples/lenet_with_mnist 
cp ../logistic_with_mnist/process_data.py . && cp ../logistic_with_mnist/decrypt_save.py . 

# change class_num = 10
vim process_data.py

# too long time
bash run_standalone.sh train_lenet.py
python3 decrypt_save.py decrypt_file
