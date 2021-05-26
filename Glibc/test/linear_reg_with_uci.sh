# commands used for https://github.com/PaddlePaddle/PaddleFL/blob/master/python/paddle_fl/mpc/examples/linear_reg_with_uci/README.md

cd /PaddleFL/python/paddle_fl/mpc/examples/linear_reg_with_uci
python3 prepare.py
cp /PaddleFL/python/paddle_fl/mpc/examples/run_standalone.sh .
bash run_standalone.sh uci_demo.py
