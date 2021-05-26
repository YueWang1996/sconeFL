# run this file inside the container built on official PaddleFL image
# docker pull hub.baidubce.com/paddlefl/paddle_fl:latest
# docker run --name fl-native --net=host -it -v $PWD:/paddle paddlepaddle/paddlefl:latest /bin/bash

# details of environment (after compilation):
#  x86_64
#  CentOS release 6.10 (Final)
#  Python 3.6.0
#  pip 18.1 from /opt/_internal/cpython-3.6.0/lib/python3.6/site-packages/pip (python 3.6)
#  Redis server v=5.0.8
#  cmake version 3.15.7
#  gcc (GCC) 4.8.3
#  g++ (GCC) 4.8.3


# install PaddleFL and redis
pip install paddle_fl \
&& wget --no-check-certificate https://paddlefl.bj.bcebos.com/redis-stable.tar \
&& tar -xf redis-stable.tar \
&& cd redis-stable &&  make \
&& make install 

# set environment variables for tests
export PATH_TO_REDIS_BIN=/usr/local/bin/ \
&& export REDIS_PORT=6379 \
&& export LOCALHOST=localhost \
&& export PYTHON=/opt/_internal/cpython-3.6.0/bin/python3
