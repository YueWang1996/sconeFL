# upgrade alpine 3.7 to alpine 3.11, python 3.8

From registry.scontain.com:5050/sconecuratedimages/crosscompilers
WORKDIR /
RUN apk update \
    && apk upgrade --available ; exit 0
RUN apk fix 
RUN apk add --no-cache g++ gfortran make cmake patchelf git ccache python3 py3-pip python3-dev \
    && apk add --no-cache --force-overwrite linux-headers freetype-dev libjpeg-turbo-dev zlib-dev openblas-dev lapack-dev  openssl-dev libuv-dev graphviz \
    && git clone https://github.com/PaddlePaddle/Paddle.git \
    && cd ./Paddle \
    && git checkout release/1.8 \
    && mkdir build && cd build \
    && pip3 install --upgrade pip \
    && pip3 install -r /Paddle/python/requirements.txt \
    && pip3 install wheel numpy protobuf \
    && cmake ..  -DCMAKE_C_COMPILER=/usr/local/bin/gcc -DCMAKE_CXX_COMPILER=/usr/local/bin/g++ -DWITH_AVX=OFF -DWITH_MUSL=ON -DWITH_CRYPTO=OFF -DWITH_MKL=OFF -DWITH_GPU=OFF -DPY_VERSION=3.8 -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 -DPYTHON_LIBRARY=/usr/lib/libpython3.so -DPY_PIP=/usr/lib/python3.8/site-packages/pip -DPY_NUMPY=/usr/lib/python3.8/site-packages/numpy -DPY_WHEEL=/usr/lib/python3.8/site-packages/wheel -DPY_GOOGLE.PROTOBUF=/usr/lib/python3.8/site-packages/google/protobuf -DPYTHON_NUMPY_INCLUDE_DIR=/usr/lib/python3.8/site-packages/numpy/core/include/numpy \
    && export SCONE_HEAP=4G  \
    && make -j$(nproc) 
RUN cd /Paddle/build/python/dist \
    && pip3 install -U paddlepaddle-0.0.0-cp38-cp38-linux_x86_64.whl

# install opencv
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/master.zip \
    && unzip opencv.zip \
    && mkdir opencv_build && cd opencv_build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_NEW_PYTHON_SUPPORT=ON -D BUILD_EXAMPLES=ON ../opencv-master \
    && make -j$(nproc) && make install \
    && cd /usr/local/lib/python3.8/site-packages/cv2/python-3.8  \
    && mv cv2.cpython-38-x86_64-linux-gnu.so cv2.so 
     
ENTRYPOINT [ "/bin/sh" ]
