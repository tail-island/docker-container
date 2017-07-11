FROM rojima1/base

USER root
WORKDIR /home/root

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
      libbz2-1.0:i386 \
      libncurses5:i386 \
      libstdc++6:i386 \
      module-init-tools \
      openjdk-8-jdk \
      zlib1g:i386 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O android-studio.zip https://dl.google.com/dl/android/studio/ide-zips/2.3.3.0/android-studio-ide-162.4069837-linux.zip && unzip android-studio.zip && mv android-studio /opt && \
    groupadd --gid 130 kvm && \
    gpasswd --add developer kvm

USER developer
WORKDIR /home/developer
