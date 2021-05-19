From registry.scontain.com:5050/lequocdo/scone-paddle:paddle1.8.5-glibc
WORKDIR /
RUN apt-get update \
    && apt-get install g++ python3-pip redis-server \
    && wget -q https://cmake.org/files/v3.16/cmake-3.16.0-Linux-x86_64.tar.gz \
    && tar -zxvf cmake-3.16.0-Linux-x86_64.tar.gz \
    && rm cmake-3.16.0-Linux-x86_64.tar.gz \
    && PATH=/cmake-3.16.0-Linux-x86_64/bin:$PATH 
RUN git clone https://github.com/PaddlePaddle/PaddleFL \
    && cd PaddleFL/ \
    && mkdir build && cd build \
    && cmake ../ -DPYTHON_EXECUTABLE=/root/miniconda/bin/python3.8 -DPYTHON_INCLUDE_DIRS=/root/miniconda/include/python3.8 -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
    && make -j$(nproc)

    
    
