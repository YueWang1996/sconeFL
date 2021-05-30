# run this file inside the container built on Glibc image (see command on second line)
# docker run -it --name scone-fl-pip -v $PWD:/demo --privileged --device registry.scontain.com:5050/lequocdo/scone-paddle:paddle-fl-1.0.1-paddlepaddle1.8.0

# details of environment (after all compilation including comments):
#   Ubuntu 20.04.2 LTS
#   Python 3.6.9 |Anaconda, Inc.| (default, Jul 30 2019, 19:07:31)
#       [GCC 7.3.0] on linux
#   gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
#   g++ ?
#   cmake version ?
#   pip 21.1.1 from /root/miniconda/lib/python3.6/site-packages/pip (python 3.6)
#   Redis server v=5.0.8

apt-get update \
    && apt-get install -y libgl1-mesa-dev ffmpeg libsm6 libxext6 wget make gcc  \
    && wget --no-check-certificate https://paddlefl.bj.bcebos.com/redis-stable.tar \
    && tar -xf redis-stable.tar && cd redis-stable &&  make && make install \
    && cd /  \
    && git clone https://github.com/PaddlePaddle/PaddleFL.git \
    && export PATH_TO_REDIS_BIN=/usr/local/bin/ && export REDIS_PORT=6379 && export LOCALHOST=localhost && export PYTHON=/usr/bin/python

# apt-get update \
#     && apt-get install -y libgomp1 patchelf \
#     && pip3 install paddle_fl \
#     && pip3 uninstall paddlepaddle \
#     && pip3 uninstall paddlepaddle-gpu \
#     && pip3 install paddlepaddle==1.8.0


# wget --no-check-certificate https://paddlefl.bj.bcebos.com/redis-stable.tar \
#     && tar -xf redis-stable.tar \
#     && cd redis-stable &&  make \
#     && make install \
#     && cd / \
#     && wget -q https://cmake.org/files/v3.16/cmake-3.16.0-Linux-x86_64.tar.gz \
#     && tar -zxvf cmake-3.16.0-Linux-x86_64.tar.gz \
#     && rm cmake-3.16.0-Linux-x86_64.tar.gz \
#     && PATH=/cmake-3.16.0-Linux-x86_64/bin:$PATH \
#     && git clone https://github.com/PaddlePaddle/PaddleFL
    

