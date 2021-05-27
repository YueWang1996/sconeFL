# run this file inside the container built on Glibc image (see command on second line)
# docker run -it --name scone-fl-pip -v $PWD:/demo --privileged --device /dev/isgx registry.scontain.com:5050/lequocdo/scone-paddle:paddle-fl-1.8.0

# details of environment (after all compilation including comments):
#   Ubuntu 20.04.2 LTS
#   gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
#   g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
#   cmake version 3.16.0
#   Python 3.7.7 
#   pip 21.0.1 from /root/miniconda/lib/python3.7/site-packages/pip (python 3.7)
#   Redis server v=5.0.8

apt-get update \
    && apt-get install -y libgomp1 patchelf \
    && pip3 install paddle_fl \
    && pip3 uninstall paddlepaddle \
    && pip3 uninstall paddlepaddle-gpu \
    && pip3 install paddlepaddle==1.8.0


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
    

