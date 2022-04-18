ARG DOCKER_IMAGE=fedora:37
ARG CT_VERSION_GIT=master

FROM $DOCKER_IMAGE

ARG VERSION="1.0.0"
ENV VERSION=$VERSION

ENV CT_ALLOW_BUILD_AS_ROOT_SURE=1
ENV CT_PREFIX=/usr/src/myapp

LABEL author="Bensuperpc <bensuperpc@gmail.com>"
LABEL mantainer="Bensuperpc <bensuperpc@gmail.com>"

RUN dnf -y groupinstall "Development Tools" \
    && dnf install -y \
    clang-tools-extra \
    clang-devel \
    qt6-qtbase-devel \
    qt6-qtmultimedia-devel \
    qt6-qt3d-devel \
    qt6-qtcharts-devel \
    qt6-qtdeclarative-devel \
    qt6-qtquick3d-devel \
    opencv-devel \
    SDL2-devel \
    SDL2_net-devel \
    SDL2_mixer-devel \
    SDL2_image \
    boost \
    openssl \
    fmt-devel \
    gtest-devel \
    google-benchmark-devel \
    catch22 \
    openmpi-devel \
    valgrind-devel \
    gdb \
    cppcheck \
    gcovr \
    mold \
    lcov \
    byacc \
    distcc \
    ca-certificates \
    ninja-build \
    automake \
    cmake \
    meson \
    bison \
    gdb \
    python3 \
    help2man \
    rsync \
    wget \
    curl \
    ncurses-devel \
    xz-devel \
    gettext-devel \
    flex \
    bc \ 
    gzip \
    zip \
    lzip \
    texinfo \
    bzip2 \
    && dnf clean all -y


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
	  org.label-schema.description="dev-environment" \
	  org.label-schema.version=$VERSION \
	  org.label-schema.vendor="Bensuperpc" \
	  org.label-schema.url="http://bensuperpc.com/" \
	  org.label-schema.vcs-url="https://github.com/bensuperpc/dev-environment" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.docker.cmd="docker build -t bensuperpc/dev-environment -f Dockerfile ."

VOLUME [ "/usr/src/myapp" ]
WORKDIR /usr/src/myapp
# CMD ["ct-ng"]