From registry.scontain.com:5050/lequocdo/scone-paddle:paddle-fl-1.8.0
WORKDIR /
RUN apt-get update \
    && apt-get install build-essential \
    && wget --no-check-certificate https://paddlefl.bj.bcebos.com/redis-stable.tar \
    && tar -xf redis-stable.tar \
    && cd redis-stable &&  make \
    && make install \
    && cd / \
    && wget -q https://cmake.org/files/v3.16/cmake-3.16.0-Linux-x86_64.tar.gz \
    && tar -zxvf cmake-3.16.0-Linux-x86_64.tar.gz \
    && rm cmake-3.16.0-Linux-x86_64.tar.gz \
    && PATH=/cmake-3.16.0-Linux-x86_64/bin:$PATH 
RUN git clone https://github.com/PaddlePaddle/PaddleFL \
    && cd PaddleFL/ \
    && mkdir build && cd build \
    && cmake ../ -DPYTHON_EXECUTABLE=/root/miniconda/bin/python3 -DPYTHON_INCLUDE_DIRS=/root/miniconda/include/python3.7m -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
    && make -j$(nproc)

    
    
