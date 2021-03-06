ARG DOCKER_IMAGE=alpine:3.15
ARG CT_VERSION_GIT=master

FROM $DOCKER_IMAGE

ARG VERSION="1.0.0"
ENV VERSION=$VERSION

ENV CT_ALLOW_BUILD_AS_ROOT_SURE=1
ENV CT_PREFIX=/usr/src/myapp

LABEL author="Bensuperpc <bensuperpc@gmail.com>"
LABEL mantainer="Bensuperpc <bensuperpc@gmail.com>"

RUN apk update && \
    apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    autoconf \
    automake \
    rsync \
    bison \
    meson \
    ninja \
    cmake \
    cppcheck \
    gdb \
    cppcheck \
    valgrind \
    lcov \
    gcovr \
    build-base \
    openmp \
    clang-dev \
    clang-analyzer \
    clang-extra-tools \
    clang-static \
    distcc \
    mold \
    curl \
    file \
    flex \
    bash \
    gawk \
    git \
    gperf \
    help2man \
    libc-dev \
    libtool \
    ncurses-dev \
    patch \
    sed \
    texinfo \
    unzip \
    wget \
    xz \
    gettext \
    python3-dev \
    py3-pip \
    boost-dev \
    fmt-dev \
    gtest-dev \
    benchmark-dev \
    catch2 \
    sfml-dev \
    sdl2-dev \
    opencv-dev \
    qt6-qtbase-dev \
    qt6-qt3d-dev \
    qt6-qtcharts-dev \
    qt6-qtimageformats-dev \
    qt6-qtnetworkauth-dev \
    qt6-qtcharts-dev \
    qt6-qtquick3d-dev \
    qt6-qtmultimedia-dev \
    qt6-qtwebview-dev \
    qt6-qtwebengine-dev \
    qt6-qtnetworkauth-dev \
    qt6-qtquicktimeline-dev \
    qt6-qtsensors-dev \
    qt6-qtserialport-dev \
    qt6-qtshadertools-dev \
    qt6-qtvirtualkeyboard-dev \
    qt6-qtwayland-dev \
    perl-gd

RUN git clone --recurse-submodules --remote-submodules https://github.com/crosstool-ng/crosstool-ng.git \
    && cd /crosstool-ng \
    && git checkout ${CT_VERSION_GIT} \
    && ./bootstrap \
    && ./configure --prefix=/usr/local \
    && make -j$(nproc) \
    && make install \
    && rm -rf /crosstool-ng \
    && cd / \
    && ct-ng --version

LABEL org.label-schema.schema-version="1.0" \
	  org.label-schema.build-date=$BUILD_DATE \
	  org.label-schema.name="bensuperpc/dev-environment" \
	  org.label-schema.description="" \
	  org.label-schema.version=$VERSION \
	  org.label-schema.vendor="Bensuperpc" \
	  org.label-schema.url="http://bensuperpc.com/" \
	  org.label-schema.vcs-url="https://github.com/bensuperpc/dev-environment" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.docker.cmd="docker build -t bensuperpc/dev-environment -f Dockerfile ."

VOLUME [ "/usr/src/myapp" ]
WORKDIR /usr/src/myapp
# CMD ["ct-ng"]
