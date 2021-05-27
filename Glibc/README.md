# Dockerfile

Install PaddleFL from source code on scone Glibc image --> failure now

ref: https://github.com/PaddlePaddle/PaddleFL/blob/master/docs/source/md/compile_and_install.md

```bash
$ docker login registry.scontain.com:5050
$ git clone https://github.com/YueWang1996/sconeFL.git && cd sconeFL/Glibc
$ docker build -t scone-fl .
```

# pip.sh

Install PaddleFL from pip on scone Glibc image--> failure now

ref: https://github.com/PaddlePaddle/PaddleFL/blob/master/docs/source/md/compile_and_install.md

```bash
$ docker login registry.scontain.com:5050
$ docker run -it --name scone-fl-pip -v $PWD:/demo --privileged --device /dev/isgx registry.scontain.com:5050/lequocdo/scone-paddle:paddle-fl-1.8.0
$ git clone https://github.com/YueWang1996/sconeFL.git && cd sconeFL/Glibc
$ bash pip.sh
```

OR just run this in the container

```bash
apt-get update \
    && apt-get install -y libgomp1 patchelf \
    && pip3 install paddle_fl \
    && pip3 uninstall paddlepaddle \
    && pip3 uninstall paddlepaddle-gpu \
    && pip3 install paddlepaddle==1.8.0
```

## error message of pip.sh:

See: https://github.com/PaddlePaddle/PaddleFL/issues/166


# native.sh

Install PaddleFL from pip on official PaddleFL image

ref: https://github.com/PaddlePaddle/PaddleFL/blob/master/docs/source/md/compile_and_install.md

```bash
$ docker pull hub.baidubce.com/paddlefl/paddle_fl:latest
$ docker run --name fl-native --net=host -it -v $PWD:/paddle paddlepaddle/paddlefl:latest /bin/bash
# git clone https://github.com/PaddlePaddle/PaddleFL  
# git clone https://github.com/YueWang1996/sconeFL.git && cd sconeFL/Glibc
# bash native.sh
```

# test

Some PaddleFL examples:

https://github.com/PaddlePaddle/PaddleFL/blob/master/python/paddle_fl/mpc/examples/linear_reg_with_uci/README.md

https://github.com/PaddlePaddle/PaddleFL/tree/master/python/paddle_fl/mpc/examples/model_encryption/train

