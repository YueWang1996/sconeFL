# setup.sh

Set up PaddleFL on scone Glibc image

```bash
$ docker login registry.scontain.com:5050
$ docker run -it --name scone-fl -v $PWD:/logs --privileged --device /dev/isgx registry.scontain.com:5050/lequocdo/scone-paddle:paddle-fl-1.1.0-paddlepaddle1.8.0
$ git clone https://github.com/YueWang1996/sconeFL.git && cd sconeFL/Glibc
$ bash setup.sh
```

run python file in the container

```bash
# SCONE_FORK=1 SCONE_LOG=7 SCONE_HEAP=3G python xxx.py
```
help links:

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


# Dockerfile

Install PaddleFL from source code on scone Glibc image --> failure now

ref: https://github.com/PaddlePaddle/PaddleFL/blob/master/docs/source/md/compile_and_install.md

```bash
$ docker login registry.scontain.com:5050
$ git clone https://github.com/YueWang1996/sconeFL.git && cd sconeFL/Glibc
$ docker build -t scone-fl .
```

### error message of Dockerfile:

Multiple undefined reference errors

```bash
paddle_tensor.cc:(.text._ZNK6common12PaddleTensorIlE11bitwise_andEPKNS_13TensorAdapterIlEEPS3_[_ZNK6common12PaddleTensorIlE11bitwise_andEPKNS_13TensorAdapterIlEEPS3_]+0x259): undefined reference to `paddle::platform::ErrorSummary::ToString[abi:cxx11]() const'
/usr/bin/ld: ../common/libmpc_tensor.a(paddle_tensor.cc.o): in function `common::PaddleTensor<long>::div(common::TensorAdapter<long> const*, common::TensorAdapter<long>*) const':
paddle_tensor.cc:(.text._ZNK6common12PaddleTensorIlE3divEPKNS_13TensorAdapterIlEEPS3_[_ZNK6common12PaddleTensorIlE3divEPKNS_13TensorAdapterIlEEPS3_]+0x275): undefined reference to `paddle::platform::ErrorSummary::ToString[abi:cxx11]() const'
/usr/bin/ld: ../common/libmpc_tensor.a(paddle_tensor.cc.o):paddle_tensor.cc:(.text._ZNK6common12PaddleTensorIlE6add128EPKNS_13TensorAdapterIlEEPS3_bb[_ZNK6common12PaddleTensorIlE6add128EPKNS_13TensorAdapterIlEEPS3_bb]+0x4d5): more undefined references to `paddle::platform::ErrorSummary::ToString[abi:cxx11]() const' follow
collect2: error: ld returned 1 exit status
make[2]: *** [core/privc3/CMakeFiles/boolean_tensor_test.dir/build.make:95: core/privc3/boolean_tensor_test] Error 1
make[1]: *** [CMakeFiles/Makefile2:875: core/privc3/CMakeFiles/boolean_tensor_test.dir/all] Error 2
......
paddle_tensor.cc:(.text._ZNK6common12PaddleTensorIhE11bitwise_xorEPKNS_13TensorAdapterIhEEPS3_[_ZNK6common12PaddleTensorIhE11bitwise_xorEPKNS_13TensorAdapterIhEEPS3_]+0x265): undefined reference to `paddle::platform::ErrorSummary::ToString[abi:cxx11]() const'
/usr/bin/ld: ../common/libmpc_tensor.a(paddle_tensor.cc.o): in function `common::PaddleTensor<unsigned char>::sub128(common::TensorAdapter<unsigned char> const*, common::TensorAdapter<unsigned char>*, bool, bool) const':
paddle_tensor.cc:(.text._ZNK6common12PaddleTensorIhE6sub128EPKNS_13TensorAdapterIhEEPS3_bb[_ZNK6common12PaddleTensorIhE6sub128EPKNS_13TensorAdapterIhEEPS3_bb]+0x472): undefined reference to `paddle::platform::ErrorSummary::ToString[abi:cxx11]() const'
/usr/bin/ld: ../common/libmpc_tensor.a(paddle_tensor.cc.o):paddle_tensor.cc:(.text._ZNK6common12PaddleTensorIhE11bitwise_andEPKNS_13TensorAdapterIhEEPS3_[_ZNK6common12PaddleTensorIhE11bitwise_andEPKNS_13TensorAdapterIhEEPS3_]+0x265): more undefined references to `paddle::platform::ErrorSummary::ToString[abi:cxx11]() const' follow
collect2: error: ld returned 1 exit status
make[2]: *** [core/privc3/CMakeFiles/fixedpoint_tensor_test.dir/build.make:95: core/privc3/fixedpoint_tensor_test] Error 1
make[1]: *** [CMakeFiles/Makefile2:943: core/privc3/CMakeFiles/fixedpoint_tensor_test.dir/all] Error 2
make: *** [Makefile:141: all] Error 2
```

PaddleFL developer suggests gcc-4.8.5: https://github.com/PaddlePaddle/PaddleFL/issues/166#issuecomment-847575834



