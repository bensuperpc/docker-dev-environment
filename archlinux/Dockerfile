ARG DOCKER_IMAGE=archlinux:base-devel
ARG CT_VERSION_GIT=master
FROM $DOCKER_IMAGE

ARG VERSION="1.0.0"
ENV VERSION=$VERSION

LABEL author="Bensuperpc <bensuperpc@gmail.com>"
LABEL mantainer="Bensuperpc <bensuperpc@gmail.com>"

RUN pacman-key --init && pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    clang \
    openmp \
    opencv \
    opencv-samples \
    rsync \
    openssl \
    devtools \
    help2man \
    xz \
    gettext \
    gzip \
    python \
    python-opencv \
    python-pip \
    cmake \
    extra-cmake-modules \
    cppcheck \
    gdb \
    cppcheck \
    valgrind \
    lcov \
    gcovr \
    meson \
    automake \
    autogen \
    ninja \
	pkgconf \
    texinfo \
	byacc \
    bash \
    bc \
    bzip2 \
    ca-certificates \
    gnupg \
    wget \
    unzip \
    curl \
    boost \
    fmt \
    gtest \
    benchmark \
    qt6-base \
    qt6-charts \
    qt6-doc \
    qt6-examples \
    qt6-connectivity \
    qt6-3d \
    qt6-imageformats \
    qt6-multimedia \
    qt6-tools \
    qt6-virtualkeyboard \
    qt6-wayland \
    qt6-webview \
    qt6-shadertools \
    qt6-serialport \
    qt6-quick3d \
    qt6-quicktimeline \
    && pacman -Scc --noconfirm

RUN git clone --recurse-submodules --remote-submodules https://github.com/crosstool-ng/crosstool-ng.git \
    && cd crosstool-ng \
    && git checkout ${CT_VERSION_GIT} \
    && ./bootstrap \
    && ./configure --enable-local \
    && make -j$(nproc) \
    && ./ct-ng --version \
    && cd .. \
    && rm -rf crosstool-ng


LABEL org.label-schema.schema-version="1.0" \
	  org.label-schema.build-date=$BUILD_DATE \
	  org.label-schema.name="bensuperpc/crosstool-ng" \
	  org.label-schema.description="build crosstool-ng toolchain" \
	  org.label-schema.version=$VERSION \
	  org.label-schema.vendor="Bensuperpc" \
	  org.label-schema.url="http://bensuperpc.com/" \
	  org.label-schema.vcs-url="https://github.com/bensuperpc/docker-crosstool-ng" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.docker.cmd="docker build -t bensuperpc/crosstool-ng -f Dockerfile ."

ENV CT_ALLOW_BUILD_AS_ROOT_SURE=1
ENV CT_PREFIX=/usr/src/myapp

VOLUME [ "/usr/src/myapp" ]
WORKDIR /usr/src/myapp
CMD ["ct-ng"]
