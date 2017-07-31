FROM rojima1/base

USER root
WORKDIR /home/root

# OpenCV

RUN apt-get update && \
    apt-get install -y \
      ant \
      build-essential \
      cmake \
      git-core \
      libatlas-base-dev \
      libatlas-dev \
      libavcodec-dev \
      libavformat-dev \
      libavresample-dev \
      libdc1394-22-dev \
      libeigen3-dev \
      libgflags-dev \
      libgoogle-glog-dev \
      libgphoto2-dev \
      libgstreamer-plugins-base1.0-dev \
      libgstreamer1.0-dev \
      libgtk-3-dev \
      libjasper-dev \
      libjpeg-dev \
      liblapacke-dev \
      libopenblas-dev \
      libpng-dev \
      libsuitesparse-dev \
      libswscale-dev \
      libtbb-dev \
      libtbb2 \
      libtiff-dev \
      libvtk6-dev \
      openjdk-8-jdk \
      pkg-config \
      python-dev \
      python-numpy \
      python3-dev \
      python3-numpy \
      qtbase5-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN git clone https://ceres-solver.googlesource.com/ceres-solver && \
    mkdir ceres-solver/build && \
    cd ceres-solver/build && \
    cmake -D CMAKE_BUILD_TYPE=Release .. && \
    make -j16 && \
    make install && \
    rm -rf ceres-solver

RUN wget -q -O opencv-3.2.0.zip https://github.com/opencv/opencv/archive/3.2.0.zip && \
    wget -q -O opencv_contrib-3.2.0.zip https://github.com/opencv/opencv_contrib/archive/3.2.0.zip && \
    unzip opencv-3.2.0.zip && \
    unzip opencv_contrib-3.2.0.zip && \
    mkdir opencv-3.2.0/build && \
    cd opencv-3.2.0/build && \
    cmake \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_LIBRARY_PATH=/usr/local/cuda/lib64/stubs \
      -D ENABLE_SSE3=ON \
      -D ENABLE_SSE41=ON \
      -D ENABLE_SSE42=ON \
      -D ENABLE_SSSE3=ON \
      -D ENABLE_AVX=ON \
      -D ENABLE_AVX2=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.2.0/modules \
      -D WITH_OPENGL=ON \
      -D WITH_QT=ON \
      -D WITH_TBB=ON \
      .. && \
    make -j16 && \
    make install && \
    rm -rf opencv-3.2.0.zip opencv-3.2.0 opencv_contrib-3.2.0.zip opencv_contrib-3.2.0

# TensorFlow

RUN apt-get update && \
    apt-get -y install \
      libcupti-dev \
      python3-pip \
      python3-tk \
      python3-wheel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list && \
    wget -q -O - https://bazel.build/bazel-release.pub.gpg | sudo apt-key add - && \
    apt-get update && \
    apt-get install -y \
      bazel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O tensorflow-1.2.1.zip https://github.com/tensorflow/tensorflow/archive/v1.2.1.zip && \
    unzip tensorflow-1.2.1 && \
    cd tensorflow-1.2.1 && \
    expect -c \
     "set timeout 60; \
      spawn ./configure; \
      expect \"Please specify the location of python.\"; \
      send \"/usr/bin/python3\n\"; \
      expect \"Please input the desired Python library path to use.\"; \
      send \"\n\"; \
      expect \"Do you wish to build TensorFlow with MKL support?\"; \
      send \"\n\"; \
      expect \"Please specify optimization flags to use during compilation when bazel option\"; \
      send \"\n\"; \
      expect \"Do you wish to use jemalloc as the malloc implementation?\"; \
      send \"\n\"; \
      expect \"Do you wish to build TensorFlow with Google Cloud Platform support?\"; \
      send \"\n\"; \
      expect \"Do you wish to build TensorFlow with Hadoop File System support?\"; \
      send \"\n\"; \
      expect \"Do you wish to build TensorFlow with the XLA just-in-time compiler (experimental)?\"; \
      send \"\n\"; \
      expect \"Do you wish to build TensorFlow with VERBS support?\"; \
      send \"\n\"; \
      expect \"Do you wish to build TensorFlow with OpenCL support?\"; \
      send \"\n\"; \
      expect \"Do you wish to build TensorFlow with CUDA support?\"; \
      send \"\n\"; \
      expect eof;" && \
    bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package && \
    ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg && \
    pip3 install /tmp/tensorflow_pkg/tensorflow-1.2.1-cp35-cp35m-linux_x86_64.whl && \
    cd .. && \
    rm -rf tensorflow-1.2.1.zip tensorflow-1.2.1 /tmp/tensorflow_pkg

# Keras

RUN pip3 install \
      funcy \
      h5py \
      keras \
      matplotlib

####

USER developer
WORKDIR /home/developer
