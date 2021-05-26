# run this file inside the container built on Glibc image (see command on second line)
# docker run -it --name scone-fl-pip -v $PWD:/demo --privileged --device /dev/isgx registry.scontain.com:5050/lequocdo/scone-paddle:paddle-fl-1.8.0

# details of environment (after compilation):
#   Ubuntu 20.04.2 LTS
#   gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
#   g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
#   cmake version 3.16.0
#   Python 3.7.7 
#   pip 21.0.1 from /root/miniconda/lib/python3.7/site-packages/pip (python 3.7)
#   Redis server v=5.0.8

apt-get update \
    && apt-get install -y build-essential libmkldnn-dev libmkldnn1 patchelf \
    && wget --no-check-certificate https://paddlefl.bj.bcebos.com/redis-stable.tar \
    && tar -xf redis-stable.tar \
    && cd redis-stable &&  make \
    && make install \
    && cd / \
    && wget -q https://cmake.org/files/v3.16/cmake-3.16.0-Linux-x86_64.tar.gz \
    && tar -zxvf cmake-3.16.0-Linux-x86_64.tar.gz \
    && rm cmake-3.16.0-Linux-x86_64.tar.gz

PATH=/cmake-3.16.0-Linux-x86_64/bin:$PATH \
    && git clone https://github.com/PaddlePaddle/PaddleFL
    
pip3 install paddle_fl

#Attention the comments!!!!!!!!

# error message:
# root@a3f4f2706588:/# python3
# Python 3.7.7 (default, Mar 23 2020, 22:36:06)
# [GCC 7.3.0] :: Anaconda, Inc. on linux
# Type "help", "copyright", "credits" or "license" for more information.
# >>> import paddle_fl
# /root/miniconda/lib/python3.7/site-packages/paddle/fluid/framework.py:299: UserWarning: You are using GPU version Paddle, but your CUDA device is not set properly. CPU device will be used by default.
#   "You are using GPU version Paddle, but your CUDA device is not set properly. CPU device will be used by default."
# Traceback (most recent call last):
#   File "<stdin>", line 1, in <module>
#   File "/root/miniconda/lib/python3.7/site-packages/paddle_fl/__init__.py", line 15, in <module>
#     from . import mpc
#   File "/root/miniconda/lib/python3.7/site-packages/paddle_fl/mpc/__init__.py", line 59, in <module>
#     fluid.load_op_library(_paddle_enc_lib)
# AttributeError: module 'paddle.fluid' has no attribute 'load_op_library'

# tried python3.6 --> doesn't work
