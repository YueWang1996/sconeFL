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

## error message of pip.sh:

```bash
root@a3f4f2706588:/# python3
Python 3.7.7 (default, Mar 23 2020, 22:36:06)
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import paddle_fl
/root/miniconda/lib/python3.7/site-packages/paddle/fluid/framework.py:299: UserWarning: You are using GPU version Paddle, but your CUDA device is not set properly. CPU device will be used by default.
  "You are using GPU version Paddle, but your CUDA device is not set properly. CPU device will be used by default."
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/root/miniconda/lib/python3.7/site-packages/paddle_fl/__init__.py", line 15, in <module>
    from . import mpc
  File "/root/miniconda/lib/python3.7/site-packages/paddle_fl/mpc/__init__.py", line 59, in <module>
    fluid.load_op_library(_paddle_enc_lib)
AttributeError: module 'paddle.fluid' has no attribute 'load_op_library'
```

# native.sh

Install PaddleFL from docker using pip on official PaddleFL image

ref: https://github.com/PaddlePaddle/PaddleFL/blob/master/docs/source/md/compile_and_install.md

```bash
$ docker pull hub.baidubce.com/paddlefl/paddle_fl:latest
$ docker run --name fl-native --net=host -it -v $PWD:/paddle paddlepaddle/paddlefl:latest /bin/bash
$ git clone https://github.com/YueWang1996/sconeFL.git && cd sconeFL/Glibc
$ bash native.sh
```

# test

Some PaddleFL examples:

https://github.com/PaddlePaddle/PaddleFL/blob/master/python/paddle_fl/mpc/examples/linear_reg_with_uci/README.md

https://github.com/PaddlePaddle/PaddleFL/tree/master/python/paddle_fl/mpc/examples/model_encryption/train

