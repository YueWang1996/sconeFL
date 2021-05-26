# commands for https://github.com/PaddlePaddle/PaddleFL/tree/master/python/paddle_fl/mpc/examples/model_encryption/train

# export PATH_TO_REDIS_BIN=/usr/local/bin/ && export REDIS_PORT=6379 && export LOCALHOST=localhost && export PYTHON=/opt/_internal/cpython-3.6.0/bin/python3

cd /PaddleFL/python/paddle_fl/mpc/examples/model_encryption/train
python3 ../process_data.py
cd ../train
cp -r mpc_data/ ../
cp /PaddleFL/python/paddle_fl/mpc/examples/run_standalone.sh .
bash run_standalone.sh encrypt_and_train_model.py
python3 decrypt_mpc_loss.py
