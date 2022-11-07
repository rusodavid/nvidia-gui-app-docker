FROM gui-app:latest


ARG NVIDIA_DRIVER_VERSION="${NVIDIA_DRIVER_VERSION:-'470.141.03'}"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        wget \
        build-essential \
        gcc-multilib \
        dkms

RUN wget --progress=dot:giga  https://es.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_DRIVER_VERSION}/NVIDIA-Linux-x86_64-${NVIDIA_DRIVER_VERSION}.run \
&& mv NVIDIA-Linux-x86_64-${NVIDIA_DRIVER_VERSION}.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run
ENV DEBIAN_FRONTEND=newt
